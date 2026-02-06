/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, afterAll, it, expect, beforeAll, beforeEach, afterEach, TestType, Level, Size } from '@ohos/hypium'
import { ArkTSUtils } from '@kit.ArkTS';
import {
  ContainsLruCache,
  ChildLruCache,
  testWorkerReceiveCache001,
  testWorkerReceiveCache002,
  testWorkerSendCache001,
  testTaskPoolCreateCacheInMainThread001,
  testTaskPoolCreateCacheInMainThread002,
  testTaskPoolCreateCacheInTaskThread001
} from './SendableLruCache'

declare class ArkTools {
  static forceFullGC(): void
}

export default function SendableLruCacheTest() {
  let printLog = 'SendableLruCacheTest:';
  // the repeat cycle of worker and taskpool
  let cycleMaxCount = 10;
  describe('SendableLruCacheTest', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_001
     * @tc.name: testSendableLRUCacheUpdateGetCapacity001
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheUpdateGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(10)
        let result = that.getCapacity()
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(10);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_002
     * @tc.name: testSendableLRUCacheUpdateGetCapacity002
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheUpdateGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(2147483646)
        let result = that.getCapacity()
        expect(result).assertEqual(2147483646)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_003
     * @tc.name: testSendableLRUCacheUpdateGetCapacity003
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheUpdateGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.updateCapacity(20)
        let result = that.getCapacity()
        expect(result).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_004
     * @tc.name: testSendableLRUCacheUpdateGetCapacity004
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheUpdateGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(50)
        that.updateCapacity(2)
        let result = that.getCapacity()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_005
     * @tc.name: testSendableLRUCacheUpdateGetCapacity005
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheUpdateGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
        that.updateCapacity(100)
        let result = that.getCapacity()
        expect(result).assertEqual(100)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_001
     * @tc.name: testSendableLRUCacheGet001
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        let result = that.get(1)
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_002
     * @tc.name: testSendableLRUCacheGet002
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        let result = that.get(5)
        expect(result).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_003
     * @tc.name: testSendableLRUCacheGet003
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        let result1 = that.get(20)
        let result2 = that.get('abcd')
        let result3 = that.get(2)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(15)
        expect(result3).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_004
     * @tc.name: testSendableLRUCacheGet004
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(20, 'cdjcaxb')
        that.put('abcd', 15)
        let result1 = that.get('1111')
        let result2 = that.get(20)
        let result3 = that.get('abcd')
        let result4 = that.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_005
     * @tc.name: testSendableLRUCacheGet005
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(20, 'cdjcaxb')
        that.updateCapacity(2)
        that.put('abcd', 15)
        let result1 = that.get('1111')
        let result2 = that.get(20)
        let result3 = that.get('abcd')
        let result4 = that.get(25)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_006
     * @tc.name: testSendableLRUCacheGet006
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      let un = undefined;
      that.put(20, 'cdjcaxb')
      try {
        let result1 = that.get(un);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_007
     * @tc.name: testSendableLRUCacheGet007
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet007";
      let that = new ArkTSUtils.SendableLruCache<number | string | null, number | string>()
      that.put(20, 'cdjcaxb')
      try {
        let result1 = that.get(null);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of null must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_001
     * @tc.name: testSendableLRUCachePut001
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        expect(temp).assertEqual('bcjdshc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_002
     * @tc.name: testSendableLRUCachePut002
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp1 = that.put('1111', 'bcjdshc')
        let temp2 = that.put('1111', 13)
        expect(temp2).assertEqual(13)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_003
     * @tc.name: testSendableLRUCachePut003
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        let temp3 = that.put(2, 'adasfdad')
        let temp4 = that.put('abc', 10)
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_004
     * @tc.name: testSendableLRUCachePut004
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        that.updateCapacity(2)
        let temp3 = that.put(2, 'adasfdad')
        let temp4 = that.put('1111', 10)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_005
     * @tc.name: testSendableLRUCachePut005
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        let temp3 = that.put(1, 10)
        let temp4 = that.put(2, 22)
        let temp5 = that.put(2, 30)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual(10)
        expect(temp4).assertEqual(22)
        expect(temp5).assertEqual(30)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_006
     * @tc.name: testSendableLRUCachePut006
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      let un = undefined;
      try {
        that.put(un, 'bcjdshc')
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_007
     * @tc.name: testSendableLRUCachePut007
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut007";
      let that = new ArkTSUtils.SendableLruCache<number | string | null, number | string>()
      try {
        that.put(null, 'bcjdshc')
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_008
     * @tc.name: testSendableLRUCachePut008
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCachePut008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut008";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string | null>()
      try {
        that.put(123, null)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CREATE_COUNT_001
     * @tc.name: testSendableLRUCacheGetCreateCount001
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CREATE_COUNT_002
     * @tc.name: testSendableLRUCacheGetCreateCount002
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(6)
        that.get(8)
        that.get(20)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CREATE_COUNT_003
     * @tc.name: testSendableLRUCacheGetCreateCount003
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.get('abc')
        that.get('cndk')
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CREATE_COUNT_004
     * @tc.name: testSendableLRUCacheGetCreateCount004
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 2)
        that.put(10, 10)
        that.put('abcd', 'abcd')
        that.get(3)
        that.get(20)
        that.get(12)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CREATE_COUNT_005
     * @tc.name: testSendableLRUCacheGetCreateCount005
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('xsjk', 'bcjds')
        that.put('ajc', 10)
        that.put('abcd', 15)
        that.get(2)
        that.get(10)
        that.get(30)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_001
     * @tc.name: testSendableLRUCacheGetMissCount001
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_002
     * @tc.name: testSendableLRUCacheGetMissCount002
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 2)
        that.put(1, 10)
        that.put('abcd', 'bcjsc')
        that.get(2)
        that.get(10)
        that.get(15)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_003
     * @tc.name: testSendableLRUCacheGetMissCount003
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 10)
        that.put(3, 20)
        that.put(12, 16)
        that.get(1)
        that.get(2)
        that.get(6)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_004
     * @tc.name: testSendableLRUCacheGetMissCount004
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('acb', 'asdc')
        that.put('vfb', 1)
        that.put('abcd', 'abcd')
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_005
     * @tc.name: testSendableLRUCacheGetMissCount005
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        that.contains(2)
        that.contains(6)
        let result = that.getMissCount()
        expect(result).assertEqual(4)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MISS_COUNT_006
     * @tc.name: testSendableLRUCacheGetMissCount006
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount006";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        let result = that.getMissCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_REMOVAL_COUNT_001
     * @tc.name: testSendableLRUCacheGetRemoveCount001
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetRemoveCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put(3, 20)
        that.put(5, 30)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_REMOVAL_COUNT_002
     * @tc.name: testSendableLRUCacheGetRemoveCount002
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetRemoveCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 2)
        that.put(3, 2)
        that.put(15, 15)
        that.put(1, 20)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_REMOVAL_COUNT_003
     * @tc.name: testSendableLRUCacheGetRemoveCount003
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetRemoveCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('abcd', 'abcd')
        that.put(3, 2)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_REMOVAL_COUNT_004
     * @tc.name: testSendableLRUCacheGetRemoveCount004
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetRemoveCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.updateCapacity(2)
        that.put(3, 20)
        that.put(5, 30)
        let result = that.getRemoveCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_REMOVAL_COUNT_005
     * @tc.name: testSendableLRUCacheGetRemoveCount005
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetRemoveCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.updateCapacity(3)
        that.put('string', 20)
        that.put('abc', 30)
        that.put(10, 20)
        let result = that.getRemoveCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_001
     * @tc.name: testSendableLRUCacheGetMatchCount001
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_002
     * @tc.name: testSendableLRUCacheGetMatchCount002
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 2)
        that.put(2, 1)
        that.put('abcd', 15)
        that.get(10)
        that.get(2)
        that.get('abcd')
        that.get('string')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_003
     * @tc.name: testSendableLRUCacheGetMatchCount003
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(0, 1)
        that.put(30, 10)
        that.put('abcd', 15)
        that.get(0)
        that.get(30)
        that.get('abcd')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_004
     * @tc.name: testSendableLRUCacheGetMatchCount004
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.contains(2)
        that.contains('abcd')
        that.contains(20)
        let result = that.getMatchCount()
        expect(result).assertEqual(5)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_005
     * @tc.name: testSendableLRUCacheGetMatchCount005
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('string', 'string')
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.get('string')
        that.contains(2)
        that.contains('abcd')
        that.contains('string')
        that.contains(10)
        let result = that.getMatchCount()
        expect(result).assertEqual(7)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_MATCH_COUNT_006
     * @tc.name: testSendableLRUCacheGetMatchCount006
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableLRUCacheGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount006";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(5)
        let result = that.getMatchCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_PUT_COUNT_001
     * @tc.name: testSendableLRUCacheGetPutCount001
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.getPutCount()
        expect(result).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_PUT_COUNT_002
     * @tc.name: testSendableLRUCacheGetPutCount002
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 3)
        that.put(2, 10)
        let result = that.getPutCount()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_PUT_COUNT_003
     * @tc.name: testSendableLRUCacheGetPutCount003
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 2)
        that.put('abcd', 1)
        that.put('ab', 'a')
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_PUT_COUNT_004
     * @tc.name: testSendableLRUCacheGetPutCount004
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'string')
        that.put('ac', 'abc')
        that.put('abcd', 15)
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_PUT_COUNT_005
     * @tc.name: testSendableLRUCacheGetPutCount005
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.updateCapacity(2)
        that.put('abcd', 'abc')
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CAPACITY_001
     * @tc.name: testSendableLRUCacheGetCapacity001
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let result = that.getCapacity()
        expect(result).assertEqual(64)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CAPACITY_002
     * @tc.name: testSendableLRUCacheGetCapacity002
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(2)
        let result = that.getCapacity()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CAPACITY_003
     * @tc.name: testSendableLRUCacheGetCapacity003
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        let result = that.getCapacity()
        expect(result).assertEqual(100)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CAPACITY_004
     * @tc.name: testSendableLRUCacheGetCapacity004
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(50)
        let result = that.getCapacity()
        expect(result).assertEqual(50)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_GET_CAPACITY_005
     * @tc.name: testSendableLRUCacheGetCapacity005
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.updateCapacity(10)
        let result = that.getCapacity()
        expect(result).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_LENGTH_001
     * @tc.name: testSendableLRUCacheLength001
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let result = that.length
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_LENGTH_002
     * @tc.name: testSendableLRUCacheLength002
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.length
        expect(result).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_LENGTH_003
     * @tc.name: testSendableLRUCacheLength003
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('string', 'string')
        let result = that.length
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_LENGTH_004
     * @tc.name: testSendableLRUCacheLength004
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('abcd', 20)
        let result = that.length
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_LENGTH_005
     * @tc.name: testSendableLRUCacheLength005
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('abcd', 20)
        that.updateCapacity(3);
        that.put(5, 33);
        that.put(25, 35);
        let result = that.length
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_001
     * @tc.name: testSendableLRUCacheClear001
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_002
     * @tc.name: testSendableLRUCacheClear002
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.put(25, 35);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_003
     * @tc.name: testSendableLRUCacheClear003
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put(2, 'abc')
        that.put('ancd', 'abcd')
        that.put(10, 35)
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_004
     * @tc.name: testSendableLRUCacheClear004
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.updateCapacity(3);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(3)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_005
     * @tc.name: testSendableLRUCacheClear005
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.put('abcd', 'string');
        that.updateCapacity(2);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_IS_EMPTY_001
     * @tc.name: testSendableLRUCacheIsEmpty001
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_IS_EMPTY_002
     * @tc.name: testSendableLRUCacheIsEmpty002
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_IS_EMPTY_003
     * @tc.name: testSendableLRUCacheIsEmpty003
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_IS_EMPTY_004
     * @tc.name: testSendableLRUCacheIsEmpty004
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('string', 10)
        that.put('ab', 'abc')
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_IS_EMPTY_005
     * @tc.name: testSendableLRUCacheIsEmpty005
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.clear()
        let result = that.isEmpty()
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_001
     * @tc.name: testSendableLRUCacheContains001
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.contains(1)
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_002
     * @tc.name: testSendableLRUCacheContains002
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(0, 5)
        let result = that.contains(0)
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_003
     * @tc.name: testSendableLRUCacheContains003
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 'abc')
        let result = that.contains(1)
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_004
     * @tc.name: testSendableLRUCacheContains004
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put('abcd', 20)
        let result1 = that.contains(1)
        let result2 = that.contains(20)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_005
     * @tc.name: testSendableLRUCacheContains005
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put('string', 'string')
        let result1 = that.contains(1)
        let result2 = that.contains('string')
        let result3 = that.contains(0)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(true)
        expect(result3).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_006
     * @tc.name: testSendableLRUCacheContains006
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      that.put('abc', 'abc')
      let un = undefined;
      try {
        that.contains(un)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_001
     * @tc.name: testSendableLRUCacheRemove001
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.remove(1)
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_002
     * @tc.name: testSendableLRUCacheRemove002
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put('abcd', 20)
        let result1 = that.remove(1)
        let result2 = that.remove('abcd')
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_003
     * @tc.name: testSendableLRUCacheRemove003
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result1 = that.remove(1)
        let result2 = that.remove(5)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_004
     * @tc.name: testSendableLRUCacheRemove004
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(0, 'abc')
        that.put('abcd', 20)
        let result1 = that.remove(1)
        let result2 = that.remove('abcd')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_005
     * @tc.name: testSendableLRUCacheRemove005
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        let result1 = that.remove(1)
        let result2 = that.remove(3)
        let result3 = that.get(3)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(10)
        expect(result3).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_006
     * @tc.name: testSendableLRUCacheRemove006
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      that.put(1, 2)
      let un = undefined;
      try {
        that.remove(un)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REMOVE_007
     * @tc.name: testSendableLRUCacheRemove007
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheRemove007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRemove007";
      let that = new ArkTSUtils.SendableLruCache<number | string | null, number | string>()
      that.put(1, 2)
      try {
        that.remove(null)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of null must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEYS_001
     * @tc.name: testSendableLRUCacheKeys001
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'abc')
        let result = that.keys()
        expect(result[0]).assertEqual('string')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEYS_002
     * @tc.name: testSendableLRUCacheKeys002
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        expect(result[3]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEYS_003
     * @tc.name: testSendableLRUCacheKeys003
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual('abc')
        expect(result[3]).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEYS_004
     * @tc.name: testSendableLRUCacheKeys004
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let result = that.keys()
        expect(result[0]).assertEqual(5)
        expect(result[1]).assertEqual('abc')
        expect(result[2]).assertEqual(3)
        expect(result[3]).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEYS_005
     * @tc.name: testSendableLRUCacheKeys005
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let result = that.keys()
        expect(result[0]).assertEqual(3)
        expect(result[1]).assertEqual(1)
        expect(result[2]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUES_001
     * @tc.name: testSendableLRUCacheValues001
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'abc')
        let result = that.values()
        expect(result[0]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUES_002
     * @tc.name: testSendableLRUCacheValues002
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(10)
        expect(result[2]).assertEqual(15)
        expect(result[3]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUES_003
     * @tc.name: testSendableLRUCacheValues003
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(15)
        expect(result[2]).assertEqual(20)
        expect(result[3]).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUES_004
     * @tc.name: testSendableLRUCacheValues004
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let result = that.values()
        expect(result[0]).assertEqual(15)
        expect(result[1]).assertEqual(20)
        expect(result[2]).assertEqual(10)
        expect(result[3]).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUES_005
     * @tc.name: testSendableLRUCacheValues005
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let result = that.values()
        expect(result[0]).assertEqual(10)
        expect(result[1]).assertEqual(2)
        expect(result[2]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TO_STRING_001
     * @tc.name: testSendableLRUCacheToString001
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(1, 2)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TO_STRING_002
     * @tc.name: testSendableLRUCacheToString002
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(1, 2)
        that.get(1)
        that.get('1111')
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TO_STRING_003
     * @tc.name: testSendableLRUCacheToString003
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TO_STRING_004
     * @tc.name: testSendableLRUCacheToString004
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.get(2)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TO_STRING_005
     * @tc.name: testSendableLRUCacheToString005
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.get(2)
        that.get(1)
        that.contains(5)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_ENTRIES_001
     * @tc.name: testSendableLRUCacheEntries001
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries001";
      try {
        let that = new ArkTSUtils.SendableLruCache<string, string>()
        that.put('string', 'abc')
        let key: string = '';
        let value: string = '';
        for (let entry of that.entries()) {
          key = entry[0];
          value = entry[1];
        }
        expect(value).assertEqual('abc');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_ENTRIES_002
     * @tc.name: testSendableLRUCacheEntries002
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(2);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_ENTRIES_003
     * @tc.name: testSendableLRUCacheEntries003
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[0]).assertEqual(1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_ENTRIES_004
     * @tc.name: testSendableLRUCacheEntries004
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_ENTRIES_005
     * @tc.name: testSendableLRUCacheEntries005
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSendableLRUCacheEntries005';
      console.log(`${caseName} test start `);
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_001
     * @tc.name: testSendableLRUCacheConstrcutor001
     * @tc.desc: The default constructor is used to create a new SendableLRUCache instance with a default capacity of 64.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheConstrcutor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConstrcutor001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(0.1)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of 0.1 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_00
     * @tc.name: testSendableLRUCacheConstrcutor001
     * @tc.desc: The default constructor is used to create a new SendableLRUCache instance with a default capacity of 64.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheConstrcutor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConstrcutor002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(-0.1)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of -0.1 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_007
     * @tc.name: testSendableLRUCacheUpdateGetCapacity007
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheUpdateGetCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity007";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
      try {
        that.updateCapacity(-20);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of -20 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_UPDATE_GET_CAPACITY_008
     * @tc.name: testSendableLRUCacheUpdateGetCapacity008
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheUpdateGetCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity007";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
      try {
        that.updateCapacity(50.5);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of 50.5 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_COMBINE_001
     * @tc.name: testSendableLRUCacheCombine001
     * @tc.desc: Test multi different APIs in the same scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheCombine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine001';
      console.log(`${TAG} test start `);
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(10)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        ArkTools.forceFullGC();
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        console.log(`${TAG} testSendableLRUCacheCombine001 array content:` + arr.toString());
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_COMBINE_002
     * @tc.name: testSendableLRUCacheCombine002
     * @tc.desc: Test LruCache as class property.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheCombine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine002';
      console.log(`${TAG} test start `);
      try {
        let cacheTest: ContainsLruCache = new ContainsLruCache()
        let result = cacheTest.TestCache1()
        console.log(`${TAG} Test Cache1 result:` + result);
        expect(result).assertEqual(true)
        result = cacheTest.TestCache2()
        console.log(`${TAG} Test Cache2 result:` + result);
        expect(result).assertEqual(true)
        result = cacheTest.TestCache3()
        console.log(`${TAG} Test Cache3 result:` + result);
        expect(result).assertEqual(true)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_COMBINE_003
     * @tc.name: testSendableLRUCacheCombine003
     * @tc.desc: Test LruCache child class to override toString, contains .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheCombine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine003';
      console.log(`${TAG} test start `);
      try {
        let childCache = new ChildLruCache<number | string, number | string>()
        childCache.put('1111', 'bcjdshc')
        childCache.put(20, 'cdjcaxb')
        childCache.put('abcd', 15)
        let result1 = childCache.get('1111')
        let result2 = childCache.get(20)
        let result3 = childCache.get('abcd')
        let result4 = childCache.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        let strResult = childCache.toString()
        expect(strResult).assertEqual("Test ChildLruCache")
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_COMBINE_004
     * @tc.name: testSendableLRUCacheCombine004
     * @tc.desc: Test LruCache child class to override contains interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheCombine004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine004';
      console.log(`${TAG} test start `);
      try {
        let childCache = new ChildLruCache<number | string | undefined, number | string>()
        childCache.put('1111', 'bcjdshc')
        childCache.put(20, 'cdjcaxb')
        childCache.put('abcd', 15)
        try {
          let pos = childCache.contains(undefined)
        } catch (e) {
          expect(e.message).assertEqual('ChildLruCache input type error.')
        }
        let isExist = childCache.contains(20)
        expect(isExist).assertEqual(true)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_WORKER_001
     * @tc.name: testSendableLRUCacheWorker001
     * @tc.desc: Test LruCache worker scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker001';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerReceiveCache001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_WORKER_002
     * @tc.name: testSendableLRUCacheWorker002
     * @tc.desc: Test LruCache worker scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker002';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerReceiveCache002()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_WORKER_003
     * @tc.name: testSendableLRUCacheWorker003
     * @tc.desc: Test LruCache worker scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker003';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerSendCache001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TASKPOOL_001
     * @tc.name: testSendableLRUCacheTaskPool001
     * @tc.desc: Test LruCache taskpool scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheTaskPool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool001';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInMainThread001()
          console.log('testSendableLRUCacheTaskPool001 last result:' + result);
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TASKPOOL_002
     * @tc.name: testSendableLRUCacheTaskPool002
     * @tc.desc: Test LruCache taskpool scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheTaskPool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool002';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInMainThread002()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TASKPOOL_003
     * @tc.name: testSendableLRUCacheTaskPool003
     * @tc.desc: Test LruCache taskpool scenario.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableLRUCacheTaskPool003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool003';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInTaskThread001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });
  })
}