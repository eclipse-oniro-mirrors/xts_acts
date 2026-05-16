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

export default function WeakRefTest() {
  describe('weakRefTest', () => {
    /**
     * @tc.name   testWeakRef0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0100
     * @tc.desc   A WeakRef object lets you hold a weak reference to another object, without preventing that object from getting garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeakRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testWeakRef0001";
      try {
        let ret = new WeakRef(Object);
        expect(ret.deref !== undefined).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testWeakRef0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0200
     * @tc.desc   A WeakRef object lets you hold a weak reference to another object, without preventing that object from getting garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeakRef0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakRef0002";
      try {
        let ret = new WeakRef(new Object);
        const str = ret.deref !== undefined;
        expect(str).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testWeakRef0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0300
     * @tc.desc   A WeakRef object lets you hold a weak reference to another object, without preventing that object from getting garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeakRef0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakRef0003";
      try {
        interface Interface_1 {
          name: string;
          age: number;
        }

        let obj: Interface_1 = {
          name: 'John',
          age: 30
        };
        let ret = new WeakRef(obj);
        const str = ret.deref !== undefined;
        expect(str).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testWeakRef0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0400
     * @tc.desc   A WeakRef object lets you hold a weak reference to another object, without preventing that object from getting garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeakRef0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakRef0004";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        let ref = new WeakRef(Person);
        const str = ref.deref !== undefined;
        expect(str).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testWeakRef0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0500
     * @tc.desc   A WeakRef object lets you hold a weak reference to another object, without preventing that object from getting garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeakRef0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakRef0005";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        let person = new Person('John', 30);
        let ref = new WeakRef(person);
        const str = ref.deref !== undefined;
        expect(str).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testWeakRef0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAK_REF_0600
     * @tc.desc   The deref() method of WeakRef instances returns this WeakRef's target value, or undefined if the target value has been garbage-collected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeakRef0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakRef0006";
      try {
        let weakRefObj = new WeakRef(new Object);
        let res = weakRefObj.deref()
        const str = res != undefined && res != null
        expect(str).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}