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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function WeakMapTest() {
  describe('weakMapTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0100
     * @tc.name       : testWeakMap0001
     * @tc.desc       : Test the function of the weakMap function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWeakMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testWeakMap0001";
      try {
        let weakMap: WeakMap<object, number> = new WeakMap();
        let a = Object;
        weakMap.set(a, 123);
        let value = weakMap.get(a);
        expect(value).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0200
     * @tc.name       : testWeakMap0002
     * @tc.desc       : Test the function of the weakMap Symbol.iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMap0002";
      try {
        let arr = [1, 2, 3];
        let iterator = arr[Symbol.iterator]();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
        expect(iterator.next().value).assertEqual(3);
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0300
     * @tc.name       : testWeakMapDelete0001
     * @tc.desc       : Test the function of the WeakMap.prototype.delete().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapDelete0001";
      try {
        const weakMap1 = new WeakMap<Object, number>();
        let a = Object;
        weakMap1.set(a, 1);
        expect(weakMap1.delete(a)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0400
     * @tc.name       : testWeakMapDelete0002
     * @tc.desc       : Test the function of the WeakMap.prototype.delete().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapDelete0002";
      try {
        const weakMap1 = new WeakMap<Object, number>();
        let a = Object;
        let b = 0;
        weakMap1.set(a, 1);
        expect(weakMap1.delete(b)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0500
     * @tc.name       : testWeakDelete0005
     * @tc.desc       : Test the function of the WeakMap.prototype.delete().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapDelete0005";
      try {
        const weakMap: WeakMap<object, number> = new WeakMap();

        interface GeneratedObjectLiteralInterface_7 {
          key?: number | string | undefined;
        }

        let a: GeneratedObjectLiteralInterface_7 = {
          key: undefined
        };
        expect(weakMap.delete(a)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0600
     * @tc.name       : testWeakMapGet0001
     * @tc.desc       : Test the function of the ccc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0001";
      try {
        let weakMap = new WeakMap<object, string>();

        interface GeneratedObjectLiteralInterface_4 {}

        let key: GeneratedObjectLiteralInterface_4 = {}
        let value = weakMap.get(key);
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0700
     * @tc.name       : testWeakMapGet0002
     * @tc.desc       : Test the function of the WeakMap.prototype.get()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0002";
      try {
        let weakMap = new WeakMap<object, string>();

        interface GeneratedObjectLiteralInterface_4 {}

        let key: GeneratedObjectLiteralInterface_4 = {}
        weakMap.set(key, "aaa");
        let value = weakMap.get(key);
        expect(value).assertEqual("aaa");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0800
     * @tc.name       : testWeakMapGet0003
     * @tc.desc       : Test the function of the WeakMap.prototype.get()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0003";
      try {
        let weakMap = new WeakMap<Object, string>();

        interface GeneratedObjectLiteralInterface_1 {
          name: string;
        }

        interface GeneratedObjectLiteralInterface_2 {
          name: string;
        }

        let a: GeneratedObjectLiteralInterface_1 = {
          name: "weiwei"
        }
        let b: GeneratedObjectLiteralInterface_2 = {
          name: "huihui"
        }
        let c = Object

        weakMap.set(a, 'weiwei');
        weakMap.set(b, 'huihui');
        weakMap.set(c, 'zhenzhen');
        expect(weakMap.get(a)).assertEqual('weiwei');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0900
     * @tc.name       : testWeakMapGet0005
     * @tc.desc       : Test the function of the WeakMap.prototype.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0005";
      try {
        let result: WeakMap<object, string> = new WeakMap();
        let key = [];
        expect(result.get(key)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1000
     * @tc.name       : testWeakMapGet0006
     * @tc.desc       : Test the function of the WeakMap.prototype.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0006";
      try {
        let result: WeakMap<object, string> = new WeakMap();
        let key = [];
        result.set(key, "values1");
        expect(result.get(key)).assertEqual("values1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1100
     * @tc.name       : testWeakMapGet0007
     * @tc.desc       : Test the function of the WeakMap.prototype.get().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0007";
      try {
        let result: WeakMap<object, string> = new WeakMap();
        let key1 = [];
        let key2 = [];
        let key3 = [];
        result.set(key1, "value1");
        result.set(key2, "value2");
        result.set(key3, "value3");
        expect(result.get(key1)).assertEqual("value1");
        expect(result.get(key2)).assertEqual("value2");
        expect(result.get(key3)).assertEqual("value3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1200
     * @tc.name       : testWeakMapGet0008
     * @tc.desc       : Test the function of the WeakMap.prototype.get()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapGet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapGet0008";
      try {
        let result: WeakMap<Object, string> = new WeakMap();
        let key = [];
        result.set(key, "undefined");
        expect(result.get(key)).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1300
     * @tc.name       : testWeakMapHas0001
     * @tc.desc       : Test the function of the Interface WeakMap.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWeakMapHas0001';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap();
        let key = [];
        expect(weakMap.has(key)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1400
     * @tc.name       : testWeakMapHas0002
     * @tc.desc       : Test the function of the Interface WeakMap.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWeakMapHas0002';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap();
        let key1 = ["姓名"];
        let value1 = '张三';
        weakMap.set(key1, value1);
        expect(weakMap.has(key1)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1500
     * @tc.name       : testWeakMapHas0003
     * @tc.desc       : Test the function of the Interface WeakMap.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWeakMapHas0003';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap();
        const key1 = [];
        const key2 = [];
        const key3 = [];
        const value1 = 'value1';
        const value2 = 'value2';
        const value3 = 'value3';
        weakMap.set(key1, value1);
        weakMap.set(key2, value2);
        weakMap.set(key3, value3);
        expect(weakMap.has(key1)).assertTrue();
        expect(weakMap.has(key2)).assertTrue();
        expect(weakMap.has(key3)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1600
     * @tc.name       : testWeakMapHas0004
     * @tc.desc       : Test the function of the Interface has.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWeakMapHas0004';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap();

        interface GeneratedObjectLiteralInterface_4 {}

        let a: GeneratedObjectLiteralInterface_4 = {
          undefined
        }
        expect(weakMap.has(a)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1700
     * @tc.name       : testWeakMapHas0006
     * @tc.desc       : Test the function of the Interface has.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapHas0006";
      try {
        const weakMap1 = new WeakMap<object, string>();
        let a = Object;
        weakMap1.set(a, 'asd');
        weakMap1.delete(a);
        weakMap1.set(a, 'tqj');
        let value = weakMap1.has(a);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1800
     * @tc.name       : testWeakMapSet0001
     * @tc.desc       : Test the function of the Interface set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapSet0001";
      try {
        const weakMap1: WeakMap<object, String> = new WeakMap();

        interface GeneratedObjectLiteralInterface_4 {}

        let object1: GeneratedObjectLiteralInterface_4 = {};
        weakMap1.set(object1, 'foo');
        expect(weakMap1.get(object1)).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1900
     * @tc.name       : testWeakMapSet0004
     * @tc.desc       : Test the function of the Interface set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakMapSet0004";
      try {
        const weakMap1 = new WeakMap<object, string>();
        let a = Object;
        weakMap1.set(a, 'foo');
        weakMap1.delete(a);
        weakMap1.set(a, 'weiwei');
        expect(weakMap1.get(a)).assertEqual('weiwei');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}