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

export default function WeakSetTest() {
  describe('weakSetTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0100
     * @tc.name       : testWeakSet0001
     * @tc.desc       : A WeakSet is a collection of garbage-collectable values, including objects and non-registered symbols.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSet0001";
      try {
        const ws = new WeakSet();
        const str = ws != undefined && ws != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0200
     * @tc.name       : testWeakSet0002
     * @tc.desc       : A WeakSet is a collection of garbage-collectable values, including objects and non-registered symbols.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSet0002";
      try {
        const map = new Map<string, number>();
        const ws = new WeakSet(map);
        const str = ws != undefined && ws != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0300
     * @tc.name       : testWeakSet0003
     * @tc.desc       : A WeakSet is a collection of garbage-collectable values, including objects and non-registered symbols.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSet0003";
      try {
        const ws = new WeakSet(null);
        const str = ws != undefined && ws != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0400
     * @tc.name       : testWeakSet0004
     * @tc.desc       : A WeakSet is a collection of garbage-collectable values, including objects and non-registered symbols.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSet0004";
      try {
        const ws = new WeakSet(undefined);
        const str = ws != undefined && ws != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0500
     * @tc.name       : testWeakSetPrototypeAdd0001
     * @tc.desc       : The add() method of WeakSet instances appends a new object to the end of this WeakSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeAdd0001";
      try {
        interface GeneratedObjectLiteralInterface_1 {}

        const weakset = new WeakSet();
        const interfaceObject: GeneratedObjectLiteralInterface_1 = {};
        let res = weakset.add(interfaceObject);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0600
     * @tc.name       : testWeakSetPrototypeAdd0002
     * @tc.desc       : The add() method of WeakSet instances appends a new object to the end of this WeakSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeAdd0002";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        let res = weakset.add(Person);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0700
     * @tc.name       : testWeakSetPrototypeAdd0003
     * @tc.desc       : The add() method of WeakSet instances appends a new object to the end of this WeakSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeAdd0003";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        let res = weakset.add(new Person('John', 30));
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0800
     * @tc.name       : testWeakSetPrototypeAdd0004
     * @tc.desc       : The add() method of WeakSet instances appends a new object to the end of this WeakSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeAdd0004";
      try {
        const weakset = new WeakSet();
        let res = weakset.add(new Object);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_0900
     * @tc.name       : testWeakSetPrototypeAdd0005
     * @tc.desc       : The add() method of WeakSet instances appends a new object to the end of this WeakSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeAdd0005";
      try {
        const weakset = new WeakSet();
        let res = weakset.add(Object);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1000
     * @tc.name       : testWeakSetPrototypeHas0001
     * @tc.desc       : The has() method of WeakSet instances returns a boolean indicating whether an object exists in this WeakSet or not.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeHas0001";
      try {
        interface Generated0bjectliteralInterface_1 {}

        const weakset = new WeakSet();
        const interfaceObject: Generated0bjectliteralInterface_1 = {};
        weakset.add(interfaceObject);
        let res = weakset.has(interfaceObject);
        expect(res).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1100
     * @tc.name       : testWeakSetPrototypeHas0002
     * @tc.desc       : The has() method of WeakSet instances returns a boolean indicating whether an object exists in this WeakSet or not.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeHas0002";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        weakset.add(Person);
        let res = weakset.has(Person);
        expect(res).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1200
     * @tc.name       : testWeakSetPrototypeHas0003
     * @tc.desc       : The has() method of WeakSet instances returns a boolean indicating whether an object exists in this WeakSet or not.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeHas0003";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        let personObj = new Person('John', 30)
        weakset.add(personObj);
        let res = weakset.has(personObj);
        expect(res).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1300
     * @tc.name       : testWeakSetPrototypeHas0004
     * @tc.desc       : The has() method of WeakSet instances returns a boolean indicating whether an object exists in this WeakSet or not.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeHas0004";
      try {
        const weakset = new WeakSet();
        let res = weakset.add(new Object);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    }) /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1400
     * @tc.name       : testWeakSetPrototypeHas0005
     * @tc.desc       : The has() method of WeakSet instances returns a boolean indicating whether an object exists in this WeakSet or not.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeakSetPrototypeHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWeakSetPrototypeHas0005";
      try {
        const weakset = new WeakSet();
        let res = weakset.add(Object);
        const str = res != undefined && res != null
        expect(str).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1500
     * @tc.name       : testPrototypeHas0001
     * @tc.desc       : Test the function of the interface prototype.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPrototypeHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeHas0001";
      try {
        interface GeneratedObjectLiteralInterface_1 {}

        const weakset = new WeakSet();
        const interfaceObject: GeneratedObjectLiteralInterface_1 = {};
        weakset.add(interfaceObject);
        weakset.delete(interfaceObject);
        let res = weakset.has(interfaceObject);
        expect(res).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1600
     * @tc.name       : testPrototypeHas0002
     * @tc.desc       : Test the function of the interface prototype.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPrototypeHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeHas0002";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        weakset.add(Person);
        weakset.delete(Person);
        let res = weakset.has(Person);
        expect(res).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1700
     * @tc.name       : testPrototypeHas0003
     * @tc.desc       : Test the function of the interface prototype.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPrototypeHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeHas0003";
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const weakset = new WeakSet();
        let personObj = new Person('John', 30)
        weakset.add(personObj);
        weakset.delete(personObj);
        let res = weakset.has(personObj);
        expect(res).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1800
     * @tc.name       : testPrototypeHas0004
     * @tc.desc       : Test the function of the interface prototype.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPrototypeHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeHas0004";
      try {
        const weakset = new WeakSet();
        let obj = new Object
        weakset.add(new Object);
        weakset.delete(obj);
        let res = weakset.has(obj);
        expect(res).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WEAK_SET_1900
     * @tc.name       : testPrototypeHas0005
     * @tc.desc       : Test the function of the interface prototype.has().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPrototypeHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeHas0005";
      try {
        const weakset = new WeakSet();
        weakset.add(Object);
        weakset.delete(Object);
        let res = weakset.has(Object);
        expect(res).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}