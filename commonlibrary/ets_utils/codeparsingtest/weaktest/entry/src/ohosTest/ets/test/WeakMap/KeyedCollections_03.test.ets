/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

interface TestObject01 {
  id: number;
}

interface TestObject02 {
  name: string;
}

interface TestObject03 {
  age: number;
}

interface TestObject04 {
  city: string;
}

interface TestObject05 {
  gender: string;
}

interface TestObject06 {
  key: string;
}

interface TestObject07 {
  data: string;
}

interface TestObject08 {
  unused: string;
}

interface NestedObject {
  b: string;
}
interface TestObject09 {
  a: NestedObject;
}

interface InnerObject01 {
  y: number;
}
interface TestObject10 {
  x: InnerObject01;
}

interface InnerObject02 {
  n: string;
}
interface TestObject11 {
  m: InnerObject02;
}

interface InnerObject03 {
  q: number;
}
interface TestObject12 {
  p: InnerObject03;
}

interface InnerObject04 {
  s: string;
}
interface TestObject13 {
  r: InnerObject04;
}

interface InnerObject05 {
  b: number;
}
interface TestObject14 {
  a: InnerObject05;
}

interface InnerObject06 {
  y: string;
}
interface TestObject15 {
  x: InnerObject06;
}

interface TestObject16 {
  a: number;
}

interface InnerObject07 {
  n: number;
}
interface TestObject17 {
  m: InnerObject07;
}

interface TestObject18 {
  sharedKey: string;
}

interface BuiltinObject {
  type: string;
}

interface TestObject19 {
  prop: string;
}
export default function keyedCollections_03Test() {
  describe('keyedCollections_03Test', () => {
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
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_SET_0100
     * @tc.name      testWeakMapSet0001
     * @tc.desc      WeakMap should correctly set and check existence with object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSet0001";
        console.log(TAG + ' start');
        const wm1 = new WeakMap<TestObject01, string>();
        const obj1: TestObject01 = { id: 1 };
        wm1.set(obj1, "val1");
        expect(wm1.has(obj1)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_HAS_0200
     * @tc.name      testWeakMapHas0002
     * @tc.desc      WeakMap should correctly check existence of object keys with has() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapHas0002";
        console.log(TAG + ' start');
        const wm2 = new WeakMap<TestObject02, string>();
        const obj2: TestObject02 = { name: "Alice" };
        wm2.set(obj2, "val2");
        expect(wm2.has(obj2)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_GET_0300
     * @tc.name      testWeakMapGet0003
     * @tc.desc      WeakMap should correctly retrieve values with get() method using object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapGet0003";
        console.log(TAG + ' start');
        const wm3 = new WeakMap<TestObject03, string>();
        const obj3: TestObject03 = { age: 25 };
        wm3.set(obj3, "val3");
        expect(wm3.get(obj3)).assertEqual("val3");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_0400
     * @tc.name      testWeakMapDelete0004
     * @tc.desc      WeakMap should correctly delete entries with delete() method using object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDelete0004";
        console.log(TAG + ' start');
        const wm4 = new WeakMap<TestObject04, string>();
        const obj4: TestObject04 = { city: "Beijing" };
        wm4.set(obj4, "val4");
        expect(wm4.delete(obj4)).assertTrue();
        expect(wm4.has(obj4)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_HAS_0500
     * @tc.name      testWeakMapDeleteHas0005
     * @tc.desc      WeakMap should correctly reflect non-existence after delete() operation with object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDeleteHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDeleteHas0005";
        console.log(TAG + ' start');
        const wm5 = new WeakMap<TestObject05, string>();
        const obj5: TestObject05 = { gender: "female" };
        wm5.set(obj5, "val5");
        wm5.delete(obj5);
        expect(wm5.has(obj5)).assertFalse();
        expect(wm5.get(obj5)).assertUndefined();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DIFFERENT_INSTANCES_0600
     * @tc.name      testWeakMapDifferentInstances0006
     * @tc.desc      WeakMap should treat different object instances as distinct keys even with same content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDifferentInstances0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDifferentInstances0006";
        console.log(TAG + ' start');
        const wm6 = new WeakMap<TestObject01, string>();
        const obj6a: TestObject01 = { id: 2 };
        const obj6b: TestObject01 = { id: 2 };
        wm6.set(obj6a, "val6a");
        wm6.set(obj6b, "val6b");
        expect(wm6.has(obj6a)).assertTrue();
        expect(wm6.has(obj6b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_DIFFERENT_INSTANCE_0700
     * @tc.name      testWeakMapDeleteDifferentInstance0007
     * @tc.desc      WeakMap should return false when deleting with a different object instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDeleteDifferentInstance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDeleteDifferentInstance0007";
        console.log(TAG + ' start');
        const wm7 = new WeakMap<TestObject06, string>();
        const obj7a: TestObject06 = { key: "test" };
        const obj7b: TestObject06 = { key: "test" };
        wm7.set(obj7a, "val7");
        expect(wm7.delete(obj7b)).assertFalse();
        expect(wm7.has(obj7a)).assertTrue();
        expect(wm7.has(obj7b)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_MODIFY_PROPERTY_0800
     * @tc.name      testWeakMapModifyProperty0008
     * @tc.desc      WeakMap should still recognize object keys after property modification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapModifyProperty0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapModifyProperty0008";
        console.log(TAG + ' start');
        const wm8 = new WeakMap<TestObject07, string>();
        const obj8: TestObject07 = { data: "old" };
        wm8.set(obj8, "val8");
        obj8.data = "new";
        expect(wm8.has(obj8)).assertTrue();
        expect(wm8.get(obj8)).assertEqual("val8");
        expect(obj8.data).assertEqual("new");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_UNSET_KEY_0900
     * @tc.name      testWeakMapUnsetKey0009
     * @tc.desc      WeakMap should return false for has() when checking an unset object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapUnsetKey0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapUnsetKey0009";
        console.log(TAG + ' start');
        const wm9 = new WeakMap<TestObject08, string>();
        const obj9: TestObject08 = { unused: "obj" };
        expect(wm9.has(obj9)).assertFalse();
        expect(wm9.get(obj9)).assertUndefined();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OVERWRITE_VALUE_1000
     * @tc.name      testWeakMapOverwriteValue0010
     * @tc.desc      WeakMap should overwrite value when setting the same object key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapOverwriteValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapOverwriteValue0010";
        console.log(TAG + ' start');
        const wm10 = new WeakMap<TestObject01, string>();
        const obj10: TestObject01 = { id: 3 };
        wm10.set(obj10, "oldVal");
        wm10.set(obj10, "newVal");
        expect(wm10.get(obj10)).assertEqual("newVal");
        expect(wm10.has(obj10)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_OBJECT_0100
     * @tc.name      testWeakMapNestedObject0001
     * @tc.desc      WeakMap should correctly set and check existence with nested object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedObject0001";
        console.log(TAG + ' start');
        const wm11 = new WeakMap<TestObject09, string>();
        const nestedObj11: TestObject09 = { a: { b: "c" } };
        wm11.set(nestedObj11, "val11");
        expect(wm11.has(nestedObj11)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_HAS_0200
     * @tc.name      testWeakMapNestedHas0002
     * @tc.desc      WeakMap should correctly check existence of nested object keys with has() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedHas0002";
        console.log(TAG + ' start');
        const wm12 = new WeakMap<TestObject10, string>();
        const nestedObj12: TestObject10 = { x: { y: 10 } };
        wm12.set(nestedObj12, "val12");
        expect(wm12.has(nestedObj12)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_GET_0300
     * @tc.name      testWeakMapNestedGet0003
     * @tc.desc      WeakMap should correctly retrieve values with get() method using nested object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedGet0003";
        console.log(TAG + ' start');
        const wm13 = new WeakMap<TestObject11, string>();
        const nestedObj13: TestObject11 = { m: { n: "o" } };
        wm13.set(nestedObj13, "val13");
        expect(wm13.get(nestedObj13)).assertEqual("val13");
        expect(wm13.has(nestedObj13)).assertTrue();
        expect(nestedObj13.m.n).assertEqual("o");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_DELETE_0400
     * @tc.name      testWeakMapNestedDelete0004
     * @tc.desc      WeakMap should correctly delete entries with delete() method using nested object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedDelete0004";
        console.log(TAG + ' start');
        const wm14 = new WeakMap<TestObject12, string>();
        const nestedObj14: TestObject12 = { p: { q: 20 } };
        wm14.set(nestedObj14, "val14");
        expect(wm14.delete(nestedObj14)).assertTrue();
        expect(wm14.has(nestedObj14)).assertFalse();
        expect(wm14.get(nestedObj14)).assertUndefined();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_DELETE_HAS_0500
     * @tc.name      testWeakMapNestedDeleteHas0005
     * @tc.desc      WeakMap should correctly reflect non-existence after delete() operation with nested object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedDeleteHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedDeleteHas0005";
        console.log(TAG + ' start');
        const wm15 = new WeakMap<TestObject13, string>();
        const nestedObj15: TestObject13 = { r: { s: "t" } };
        wm15.set(nestedObj15, "val15");
        wm15.delete(nestedObj15);
        expect(wm15.has(nestedObj15)).assertFalse();
        expect(wm15.get(nestedObj15)).assertUndefined();
        expect(nestedObj15.r.s).assertEqual("t");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_MODIFY_PROPERTY_0600
     * @tc.name      testWeakMapNestedModifyProperty0006
     * @tc.desc      WeakMap should still recognize nested object keys after modifying internal properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedModifyProperty0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedModifyProperty0006";
        console.log(TAG + ' start');
        const wm16 = new WeakMap<TestObject14, string>();
        const nestedObj16: TestObject14 = { a: { b: 30 } };
        wm16.set(nestedObj16, "val16");
        nestedObj16.a.b = 40;
        expect(wm16.has(nestedObj16)).assertTrue();
        expect(wm16.get(nestedObj16)).assertEqual("val16");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DIFFERENT_NESTED_OBJECTS_0700
     * @tc.name      testWeakMapDifferentNestedObjects0007
     * @tc.desc      WeakMap should treat different nested object instances as distinct keys even with same content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDifferentNestedObjects0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDifferentNestedObjects0007";
        console.log(TAG + ' start');
        const wm17 = new WeakMap<TestObject14, string>();
        const obj17a: TestObject14 = { a: { b: 1 } };
        const obj17b: TestObject14 = { a: { b: 1 } };
        wm17.set(obj17a, "val17a");
        wm17.set(obj17b, "val17b");
        expect(wm17.has(obj17a)).assertTrue();
        expect(wm17.has(obj17b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_UNSET_NESTED_0800
     * @tc.name      testWeakMapDeleteUnsetNested0008
     * @tc.desc      WeakMap should return false when deleting an unset nested object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDeleteUnsetNested0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDeleteUnsetNested0008";
        console.log(TAG + ' start');
        const wm18 = new WeakMap<TestObject15, string>();
        const nestedObj18: TestObject15 = { x: { y: "z" } };
        expect(wm18.delete(nestedObj18)).assertFalse();
        expect(wm18.has(nestedObj18)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_REASSIGN_REFERENCE_0900
     * @tc.name      testWeakMapReassignReference0009
     * @tc.desc      WeakMap should maintain reference to original object after variable reassignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapReassignReference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapReassignReference0009";
        console.log(TAG + ' start');
        const wm19 = new WeakMap<TestObject16, string>();
        let nestedObj19: TestObject16 = { a: 1 };
        wm19.set(nestedObj19, "val19");
        nestedObj19 = { a: 2 };
        expect(wm19.has({ a: 1 })).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_NESTED_OVERWRITE_1000
     * @tc.name      testWeakMapNestedOverwrite0010
     * @tc.desc      WeakMap should overwrite value when setting the same nested object key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapNestedOverwrite0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapNestedOverwrite0010";
        console.log(TAG + ' start');
        const wm20 = new WeakMap<TestObject17, string>();
        const nestedObj20: TestObject17 = { m: { n: 50 } };
        wm20.set(nestedObj20, "old");
        wm20.set(nestedObj20, "new");
        expect(wm20.get(nestedObj20)).assertEqual("new");
        expect(wm20.has(nestedObj20)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_KEY_0100
     * @tc.name      testWeakMapArrayKey0001
     * @tc.desc      WeakMap should correctly set and check existence with array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayKey0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayKey0001";
        console.log(TAG + ' start');
        const wm21 = new WeakMap<object, string>();
        const arr21: number[] = [1, 2, 3];
        wm21.set(arr21, "val21");
        expect(wm21.has(arr21)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_HAS_0200
     * @tc.name      testWeakMapArrayHas0002
     * @tc.desc      WeakMap should correctly check existence of array keys with has() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayHas0002";
        console.log(TAG + ' start');
        const wm22 = new WeakMap<object, string>();
        const arr22: string[] = ["a", "b"];
        wm22.set(arr22, "val22");
        expect(wm22.has(arr22)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_GET_0300
     * @tc.name      testWeakMapArrayGet0003
     * @tc.desc      WeakMap should correctly retrieve values with get() method using array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayGet0003";
        console.log(TAG + ' start');
        const wm23 = new WeakMap<object, string>();
        const arr23: boolean[] = [true, false];
        wm23.set(arr23, "val23");
        expect(wm23.get(arr23)).assertEqual("val23");
        expect(wm23.has(arr23)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_DELETE_0400
     * @tc.name      testWeakMapArrayDelete0004
     * @tc.desc      WeakMap should correctly delete entries with delete() method using array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayDelete0004";
        console.log(TAG + ' start');
        const wm24 = new WeakMap<object, string>();
        const arr24: (null | undefined)[] = [null, undefined];
        wm24.set(arr24, "val24");
        expect(wm24.delete(arr24)).assertTrue();
        expect(wm24.has(arr24)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_DELETE_HAS_0500
     * @tc.name      testWeakMapArrayDeleteHas0005
     * @tc.desc      WeakMap should correctly reflect non-existence after delete() operation with array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayDeleteHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayDeleteHas0005";
        console.log(TAG + ' start');
        const wm25 = new WeakMap<object, string>();
        const arr25: number[] = [10, 20];
        wm25.set(arr25, "val25");
        wm25.delete(arr25);
        expect(wm25.has(arr25)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_MODIFY_0600
     * @tc.name      testWeakMapArrayModify0006
     * @tc.desc      WeakMap should still recognize array keys after modifying array content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayModify0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayModify0006";
        console.log(TAG + ' start');
        const wm26 = new WeakMap<object, string>();
        const arr26: number[] = [1, 2];
        wm26.set(arr26, "val26");
        arr26.push(3);
        expect(wm26.has(arr26)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DIFFERENT_ARRAYS_0700
     * @tc.name      testWeakMapDifferentArrays0007
     * @tc.desc      WeakMap should treat different array instances as distinct keys even with same content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDifferentArrays0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDifferentArrays0007";
        console.log(TAG + ' start');
        const wm27 = new WeakMap<object, string>();
        const arr27a: number[] = [1, 2];
        const arr27b: number[] = [1, 2];
        wm27.set(arr27a, "val27a");
        wm27.set(arr27b, "val27b");
        expect(wm27.has(arr27a)).assertTrue();
        expect(wm27.has(arr27b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_DIFFERENT_ARRAY_0800
     * @tc.name      testWeakMapDeleteDifferentArray0008
     * @tc.desc      WeakMap should return false when deleting with a different array instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDeleteDifferentArray0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDeleteDifferentArray0008";
        console.log(TAG + ' start');
        const wm28 = new WeakMap<object, string>();
        const arr28a: number[] = [3, 4];
        const arr28b: number[] = [3, 4];
        wm28.set(arr28a, "val28");
        expect(wm28.delete(arr28b)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_UNSET_ARRAY_0900
     * @tc.name      testWeakMapUnsetArray0009
     * @tc.desc      WeakMap should return false for has() when checking an unset array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapUnsetArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapUnsetArray0009";
        console.log(TAG + ' start');
        const wm29 = new WeakMap<object, string>();
        const arr29: number[] = [5, 6];
        expect(wm29.has(arr29)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_ARRAY_OVERWRITE_1000
     * @tc.name      testWeakMapArrayOverwrite0010
     * @tc.desc      WeakMap should overwrite value when setting the same array key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapArrayOverwrite0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapArrayOverwrite0010";
        console.log(TAG + ' start');
        const wm30 = new WeakMap<object, string>();
        const arr30: number[] = [7, 8];
        wm30.set(arr30, "oldVal");
        wm30.set(arr30, "newVal");
        expect(wm30.get(arr30)).assertEqual("newVal");
        expect(wm30.has(arr30)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_KEY_0100
     * @tc.name      testWeakMapFunctionKey0001
     * @tc.desc      WeakMap should correctly set and check existence with function keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionKey0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionKey0001";
        console.log(TAG + ' start');
        const wm31 = new WeakMap<object, string>();
        const func31 = (): string => "test1";
        wm31.set(func31, "val31");
        expect(wm31.has(func31)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_HAS_0200
     * @tc.name      testWeakMapFunctionHas0002
     * @tc.desc      WeakMap should correctly check existence of function keys with has() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionHas0002";
        console.log(TAG + ' start');
        const wm32 = new WeakMap<object, string>();
        const func32 = () => "test2";
        wm32.set(func32, "val32");
        expect(wm32.has(func32)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_GET_0300
     * @tc.name      testWeakMapFunctionGet0003
     * @tc.desc      WeakMap should correctly retrieve values with get() method using function keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionGet0003";
        console.log(TAG + ' start');
        const wm33 = new WeakMap<object, string>();
        const func33 = () => "test3";
        wm33.set(func33, "val33");
        expect(wm33.get(func33)).assertEqual("val33");
        expect(wm33.has(func33)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_DELETE_0400
     * @tc.name      testWeakMapFunctionDelete0004
     * @tc.desc      WeakMap should correctly delete entries with delete() method using function keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionDelete0004";
        console.log(TAG + ' start');
        const wm34 = new WeakMap<object, string>();
        const func34 = () => "test4";
        wm34.set(func34, "val34");
        expect(wm34.delete(func34)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_DELETE_HAS_0500
     * @tc.name      testWeakMapFunctionDeleteHas0005
     * @tc.desc      WeakMap should correctly reflect non-existence after delete() operation with function keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionDeleteHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionDeleteHas0005";
        console.log(TAG + ' start');
        const wm35 = new WeakMap<object, string>();
        const func35 = () => "test5";
        wm35.set(func35, "val35");
        wm35.delete(func35);
        expect(wm35.has(func35)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_ADD_PROPERTY_0600
     * @tc.name      testWeakMapFunctionAddProperty0006
     * @tc.desc      WeakMap should still recognize function keys after adding properties to function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionAddProperty0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionAddProperty0006";
        console.log(TAG + ' start');
        const wm36 = new WeakMap<object, string>();
        const func36 = () => "test6";
        wm36.set(func36, "val36");
        func36.prop = "newProp";
        expect(wm36.has(func36)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DIFFERENT_FUNCTIONS_0700
     * @tc.name      testWeakMapDifferentFunctions0007
     * @tc.desc      WeakMap should treat different function instances as distinct keys even with same implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDifferentFunctions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDifferentFunctions0007";
        console.log(TAG + ' start');
        const wm37 = new WeakMap<object, string>();
        const func37a = () => "a";
        const func37b = () => "a";
        wm37.set(func37a, "val37a");
        wm37.set(func37b, "val37b");
        expect(wm37.has(func37a)).assertTrue();
        expect(wm37.has(func37b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DELETE_DIFFERENT_FUNCTION_0800
     * @tc.name      testWeakMapDeleteDifferentFunction0008
     * @tc.desc      WeakMap should return false when deleting with a different function instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDeleteDifferentFunction0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDeleteDifferentFunction0008";
        console.log(TAG + ' start');
        const wm38 = new WeakMap<object, string>();
        const func38a = () => "b";
        const func38b = () => "b";
        wm38.set(func38a, "val38");
        expect(wm38.delete(func38b)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_UNSET_FUNCTION_0900
     * @tc.name      testWeakMapUnsetFunction0009
     * @tc.desc      WeakMap should return false for has() when checking an unset function key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapUnsetFunction0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapUnsetFunction0009";
        console.log(TAG + ' start');
        const wm39 = new WeakMap<object, string>();
        const func39 = () => "c";
        expect(wm39.has(func39)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_FUNCTION_OVERWRITE_1000
     * @tc.name      testWeakMapFunctionOverwrite0010
     * @tc.desc      WeakMap should overwrite value when setting the same function key multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapFunctionOverwrite0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapFunctionOverwrite0010";
        console.log(TAG + ' start');
        const wm40 = new WeakMap<object, string>();
        const func40 = () => "d";
        wm40.set(func40, "old");
        wm40.set(func40, "new");
        expect(wm40.get(func40)).assertEqual("new");
        expect(wm40.has(func40)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_SYMBOL_KEY_0100
     * @tc.name      testWeakMapSymbolKey0001
     * @tc.desc      WeakMap should correctly set and check existence with object keys (Symbol not supported in ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSymbolKey0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSymbolKey0001";
        console.log(TAG + ' start');
        const wm41 = new WeakMap<TestObject06, string>();
        const obj41: TestObject06 = { key: "key1" };
        wm41.set(obj41, "val41");
        expect(wm41.has(obj41)).assertTrue();
        expect(wm41.get(obj41)).assertEqual("val41");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_HAS_0200
     * @tc.name      testWeakMapObjectHas0002
     * @tc.desc      WeakMap should correctly check existence of object keys with has() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectHas0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectHas0002";
        console.log(TAG + ' start');
        const wm42 = new WeakMap<TestObject06, string>();
        const obj42: TestObject06 = { key: "key2" };
        wm42.set(obj42, "val42");
        expect(wm42.has(obj42)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_GET_0300
     * @tc.name      testWeakMapObjectGet0003
     * @tc.desc      WeakMap should correctly retrieve values with get() method using object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectGet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectGet0003";
        console.log(TAG + ' start');
        const wm43 = new WeakMap<TestObject06, string>();
        const obj43: TestObject06 = { key: "key3" };
        wm43.set(obj43, "val43");
        expect(wm43.get(obj43)).assertEqual("val43");
        expect(wm43.has(obj43)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_DELETE_0400
     * @tc.name      testWeakMapObjectDelete0004
     * @tc.desc      WeakMap should correctly delete entries with delete() method using object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectDelete0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectDelete0004";
        console.log(TAG + ' start');
        const wm44 = new WeakMap<TestObject06, string>();
        const obj44: TestObject06 = { key: "key4" };
        wm44.set(obj44, "val44");
        expect(wm44.delete(obj44)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_OBJECT_DELETE_HAS_0500
     * @tc.name      testWeakMapObjectDeleteHas0005
     * @tc.desc      WeakMap should correctly reflect non-existence after delete() operation with object keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapObjectDeleteHas0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapObjectDeleteHas0005";
        console.log(TAG + ' start');
        const wm45 = new WeakMap<TestObject06, string>();
        const obj45: TestObject06 = { key: "key5" };
        wm45.set(obj45, "val45");
        wm45.delete(obj45);
        expect(wm45.has(obj45)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_SHARED_OBJECT_0600
     * @tc.name      testWeakMapSharedObject0006
     * @tc.desc      WeakMap should correctly set and check existence with shared object keys (Symbol.for not supported in ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSharedObject0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSharedObject0006";
        console.log(TAG + ' start');
        const wm46 = new WeakMap<TestObject18, string>();
        const obj46: TestObject18 = { sharedKey: "shared" };
        wm46.set(obj46, "val46");
        expect(wm46.has(obj46)).assertTrue();
        expect(wm46.get(obj46)).assertEqual("val46");
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_SAME_OBJECT_0700
     * @tc.name      testWeakMapSameObject0007
     * @tc.desc      WeakMap should treat the same object reference as the same key (Symbol.for not supported in ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapSameObject0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapSameObject0007";
        console.log(TAG + ' start');
        const wm47 = new WeakMap<TestObject18, string>();
        const sharedObj: TestObject18 = { sharedKey: "sharedKey" };
        const obj47a = sharedObj;
        const obj47b = sharedObj;
        wm47.set(obj47a, "val47");
        expect(wm47.has(obj47b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_BUILTIN_OBJECT_0800
     * @tc.name      testWeakMapBuiltinObject0008
     * @tc.desc      WeakMap should correctly set and check existence with builtin-like object keys (Symbol.iterator not supported in ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapBuiltinObject0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapBuiltinObject0008";
        console.log(TAG + ' start');
        const wm48 = new WeakMap<BuiltinObject, string>();
        const builtinObj: BuiltinObject = { type: "iterator" };
        wm48.set(builtinObj, "val48");
        expect(wm48.has(builtinObj)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_DIFFERENT_OBJECTS_0900
     * @tc.name      testWeakMapDifferentObjects0009
     * @tc.desc      WeakMap should treat different object instances as distinct keys even with same content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapDifferentObjects0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapDifferentObjects0009";
        console.log(TAG + ' start');
        const wm49 = new WeakMap<TestObject06, string>();
        const obj49a: TestObject06 = { key: "key6" };
        const obj49b: TestObject06 = { key: "key6" };
        wm49.set(obj49a, "val49a");
        wm49.set(obj49b, "val49b");
        expect(wm49.has(obj49a)).assertTrue();
        expect(wm49.has(obj49b)).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_WEAKMAP_UNSET_OBJECT_1000
     * @tc.name      testWeakMapUnsetObject0010
     * @tc.desc      WeakMap should return false for has() when checking an unset object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testWeakMapUnsetObject0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testWeakMapUnsetObject0010";
        console.log(TAG + ' start');
        const wm50 = new WeakMap<TestObject06, string>();
        const obj50: TestObject06 = { key: "key7" };
        expect(wm50.has(obj50)).assertFalse();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}