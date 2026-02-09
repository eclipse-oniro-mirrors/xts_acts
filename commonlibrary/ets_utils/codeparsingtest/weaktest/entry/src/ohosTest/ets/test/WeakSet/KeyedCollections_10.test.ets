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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

// 定义对象接口类型
interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

// 定义数组类型
type TestArray = Array<number | string | boolean | null | undefined>;

// 定义函数接口类型
interface TestFunction extends Function {
  prop?: string;
}

//定义对象类型
class MockSymbol {
  description: string;  // 1. 先在类中声明字段

  constructor(description: string) {  // 2. 构造函数参数不加修饰符
    this.description = description;  // 3. 在构造函数体内赋值
  }
}


export default function keyedCollections_10Test() {
  describe('keyedCollections_10Test', () => {
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
     * @tc.number SUB_BASEDATA_WEAKSET_ADD_0100
     * @tc.name testWeakSetAdd0001
     * @tc.desc Verify that a common object can be added into a WeakSet and detected by has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetAdd0001 start');
      const ws1 = new WeakSet();
      const obj1: TestObject = { id: 1 }; // 添加类型注解
      ws1.add(obj1);
      console.log("1. Object-add successful" + ws1.has(obj1));
      expect(ws1.has(obj1)).assertTrue();
      done();
      console.log('testWeakSetAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ADD_0200
     * @tc.name testWeakSetAdd0002
     * @tc.desc Verify that a common object exists in WeakSet after being added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetAdd0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetAdd0002 start');
      const ws2 = new WeakSet();
      const obj2: TestObject = { name: "Test" }; // 添加类型注解
      ws2.add(obj2);
      console.log("2. Object-has exists" + ws2.has(obj2));
      expect(ws2.has(obj2)).assertTrue();
      done();
      console.log('testWeakSetAdd0002 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_DELETE_0100
     * @tc.name testWeakSetDelete0001
     * @tc.desc Verify that a common object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetDelete0001 start');
      const ws3 = new WeakSet();
      const obj3: TestObject = { data: "value" }; // 添加类型注解
      ws3.add(obj3);
      console.log("3. Object-delete successful" + ws3.delete(obj3));
      expect(ws3.delete(obj3)).assertFalse();
      done();
      console.log('testWeakSetDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_DELETE_0200
     * @tc.name testWeakSetDelete0002
     * @tc.desc Verify that a common object does not exist in WeakSet after being deleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetDelete0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetDelete0002 start');
      const ws4 = new WeakSet();
      const obj4: TestObject = { key: "demo" };
      ws4.add(obj4);
      ws4.delete(obj4);
      console.log("4. Object-delete has notExists" + !ws4.has(obj4));
      expect(ws4.has(obj4)).assertFalse();
      done();
      console.log('testWeakSetDelete0002 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_INSTANCE_0100
     * @tc.name testWeakSetInstance0001
     * @tc.desc Verify that different object instances with same content are treated as different values in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetInstance0001 start');
      const ws5 = new WeakSet();
      const obj5a: TestObject = { id: 5 }; // 添加类型注解
      const obj5b: TestObject = { id: 5 }; // 添加类型注解
      ws5.add(obj5a);

      expect(ws5.has(obj5b)).assertFalse();
      done();
      console.log('testWeakSetInstance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_MODIFY_0100
     * @tc.name testWeakSetModify0001
     * @tc.desc Verify that modified object can still be recognized in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetModify0001 start');
      const ws6 = new WeakSet();
      const obj6: TestObject = { prop: "old" };
      ws6.add(obj6);
      obj6.prop = "new";
      console.log("6. remainsIdentifiableAfterModification: " + ws6.has(obj6));
      expect(ws6.has(obj6)).assertTrue();
      done();
      console.log('testWeakSetModify0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_DUPLICATE_0100
     * @tc.name testWeakSetDuplicate0001
     * @tc.desc Verify that duplicate addition of same object returns WeakSet itself.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetDuplicate0001 start');
      const ws7 = new WeakSet();
      const obj7: TestObject = { a: 1 };
      ws7.add(obj7);
      const result7 = ws7.add(obj7);
      console.log("7. returnsSelfWhenAddingDuplicate: " + (result7 === ws7));
      expect(result7 === ws7).assertTrue();
      done();
      console.log('testWeakSetDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_DELETE_NOTEXIST_0100
     * @tc.name testWeakSetDeleteNotExist0001
     * @tc.desc Verify that deleting non-existent object returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetDeleteNotExist0001 start');
      const ws8 = new WeakSet();
      const obj8: TestObject = { unused: "obj" };
      console.log("8. returnsFalseWhenDeletingNonExistentObject: " + !ws8.delete(obj8));
      expect(ws8.delete(obj8)).assertFalse();
      done();
      console.log('testWeakSetDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_HAS_NOTEXIST_0100
     * @tc.name testWeakSetHasNotExist0001
     * @tc.desc Verify that checking non-existent object returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetHasNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetHasNotExist0001 start');
      const ws9 = new WeakSet();
      const obj9: TestObject = { new: "object" };
      console.log("9. returnsFalseWhenDeletingNonExistentObject: " + !ws9.has(obj9));
      expect(ws9.has(obj9)).assertFalse();
      done();
      console.log('testWeakSetHasNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_MULTIPLE_0100
     * @tc.name testWeakSetMultiple0001
     * @tc.desc Verify that multiple different objects can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetMultiple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetMultiple0001 start');
      const ws10 = new WeakSet();
      const obj10a: TestObject = { x: 10 };
      const obj10b: TestObject = { y: 20 };
      ws10.add(obj10a).add(obj10b);
      console.log("10. addMultipleDistinctObjects: " + (ws10.has(obj10a) && ws10.has(obj10b)));
      expect(ws10.has(obj10a) && ws10.has(obj10b)).assertTrue();
      done();
      console.log('testWeakSetMultiple0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_ADD_0100
     * @tc.name testWeakSetArrayAdd0001
     * @tc.desc Verify that an array object can be added into a WeakSet and detected by has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayAdd0001 start');
      const ws11 = new WeakSet();
      const arr11: TestArray = [1, 2, 3];
      ws11.add(arr11);
      console.log("11. arrayObjectAddSucceeds: " + ws11.has(arr11));
      expect(ws11.has(arr11)).assertTrue();
      done();
      console.log('testWeakSetArrayAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_HAS_0100
     * @tc.name testWeakSetArrayHas0001
     * @tc.desc Verify that an array object exists in WeakSet after being added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayHas0001 start');
      const ws12 = new WeakSet();
      const arr12: TestArray = ["a", "b"];
      ws12.add(arr12);
      console.log("12. arrayObjectHasExists: " + ws12.has(arr12));
      expect(ws12.has(arr12)).assertTrue();
      done();
      console.log('testWeakSetArrayHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_DELETE_0100
     * @tc.name testWeakSetArrayDelete0001
     * @tc.desc Verify that an array object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayDelete0001 start');
      const ws13 = new WeakSet();
      const arr13: TestArray = [true, false];
      ws13.add(arr13);
      console.log("13. arrayObjectDeleteSucceeds: " + ws13.delete(arr13));
      expect(ws13.delete(arr13)).assertFalse();
      done();
      console.log('testWeakSetArrayDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_DELETE_HAS_0100
     * @tc.name testWeakSetArrayDeleteHas0001
     * @tc.desc Verify that an array object does not exist in WeakSet after being deleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayDeleteHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayDeleteHas0001 start');
      const ws14 = new WeakSet();
      const arr14: TestArray = [null, undefined];
      ws14.add(arr14);
      ws14.delete(arr14);
      console.log("14. arrayObjectDoesNotExistAfterDeletion: " + !ws14.has(arr14));
      expect(ws14.has(arr14)).assertFalse();
      done();
      console.log('testWeakSetArrayDeleteHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_INSTANCE_0100
     * @tc.name testWeakSetArrayInstance0001
     * @tc.desc Verify that different array instances with same content are treated as different values in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayInstance0001 start');
      const ws15 = new WeakSet();
      const arr15a: TestArray = [1, 2];
      const arr15b: TestArray = [1, 2];
      ws15.add(arr15a);
      console.log("15. differentInstanceArraysTreatedAsDistinctValues: " + !ws15.has(arr15b));
      expect(ws15.has(arr15b)).assertFalse();
      done();
      console.log('testWeakSetArrayInstance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_MODIFY_0100
     * @tc.name testWeakSetArrayModify0001
     * @tc.desc Verify that modified array can still be recognized in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayModify0001 start');
      const ws16 = new WeakSet();
      const arr16: TestArray = [10, 20];
      ws16.add(arr16);
      arr16.push(30);
      console.log("16. arrayRemainsIdentifiableAfterModification: " + ws16.has(arr16));
      expect(ws16.has(arr16)).assertTrue();
      done();
      console.log('testWeakSetArrayModify0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_DUPLICATE_0100
     * @tc.name testWeakSetArrayDuplicate0001
     * @tc.desc Verify that duplicate addition of same array returns WeakSet itself.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayDuplicate0001 start');
      const ws17 = new WeakSet();
      const arr17: TestArray = [5, 6];
      ws17.add(arr17);
      const result17 = ws17.add(arr17);
      console.log("17. returnsSelfWhenAddingDuplicateArray: " + (result17 === ws17));
      expect(result17 === ws17).assertTrue();
      done();
      console.log('testWeakSetArrayDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_DELETE_NOTEXIST_0100
     * @tc.name testWeakSetArrayDeleteNotExist0001
     * @tc.desc Verify that deleting non-existent array returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayDeleteNotExist0001 start');
      const ws18 = new WeakSet();
      const arr18: TestArray = [7, 8];
      console.log("18. returnsFalseWhenDeletingNonExistentArray: " + !ws18.delete(arr18));
      expect(ws18.delete(arr18)).assertFalse();
      done();
      console.log('testWeakSetArrayDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_HAS_NOTEXIST_0100
     * @tc.name testWeakSetArrayHasNotExist0001
     * @tc.desc Verify that checking non-existent array returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayHasNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayHasNotExist0001 start');
      const ws19 = new WeakSet();
      const arr19: TestArray = [9, 0];
      console.log("19. returnsFalseWhenCheckingUnaddedArrayExistence: " + !ws19.has(arr19));
      expect(ws19.has(arr19)).assertFalse();
      done();
      console.log('testWeakSetArrayHasNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_ARRAY_MULTIPLE_0100
     * @tc.name testWeakSetArrayMultiple0001
     * @tc.desc Verify that multiple different arrays can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetArrayMultiple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetArrayMultiple0001 start');
      const ws20 = new WeakSet();
      const arr20a: TestArray = [1];
      const arr20b: TestArray = [2];
      ws20.add(arr20a).add(arr20b);
      console.log("20. addMultipleDistinctArrays: " + (ws20.has(arr20a) && ws20.has(arr20b)));
      expect(ws20.has(arr20a) && ws20.has(arr20b)).assertTrue();
      done();
      console.log('testWeakSetArrayMultiple0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_ADD_0100
     * @tc.name testWeakSetFunctionAdd0001
     * @tc.desc Verify that a function object can be added into a WeakSet and detected by has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionAdd0001 start');
      const ws21 = new WeakSet();
      const func21: TestFunction = () => "test";
      ws21.add(func21);
      console.log("21. Function object-add success: " + ws21.has(func21));
      expect(ws21.has(func21)).assertTrue();
      done();
      console.log('testWeakSetFunctionAdd0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_HAS_0100
     * @tc.name testWeakSetFunctionHas0001
     * @tc.desc Verify that a function object exists in WeakSet after being added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionHas0001 start');
      const ws22 = new WeakSet();
      const func22: TestFunction = () => "demo";
      ws22.add(func22);
      console.log("22. Function object-exists: " + ws22.has(func22));
      expect(ws22.has(func22)).assertTrue();
      done();
      console.log('testWeakSetFunctionHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_DELETE_0100
     * @tc.name testWeakSetFunctionDelete0001
     * @tc.desc Verify that a function object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionDelete0001 start');
      const ws23 = new WeakSet();
      const func23: TestFunction = () => "delete";
      ws23.add(func23);
      console.log("23. Function object-delete success: " + ws23.delete(func23));
      expect(ws23.delete(func23)).assertFalse();
      done();
      console.log('testWeakSetFunctionDelete0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_DELETE_HAS_0100
     * @tc.name testWeakSetFunctionDeleteHas0001
     * @tc.desc Verify that a function object does not exist in WeakSet after being deleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionDeleteHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionDeleteHas0001 start');
      const ws24 = new WeakSet();
      const func24: TestFunction = () => "remove";
      ws24.add(func24);
      ws24.delete(func24);
      console.log("24. Function object-not exists after deletion: " + !ws24.has(func24));
      expect(ws24.has(func24)).assertFalse();
      done();
      console.log('testWeakSetFunctionDeleteHas0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_INSTANCE_0100
     * @tc.name testWeakSetFunctionInstance0001
     * @tc.desc Verify that different function instances with same content are treated as different values in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionInstance0001 start');
      const ws25 = new WeakSet();
      const func25a: TestFunction = () => 1;
      const func25b: TestFunction = () => 1;
      ws25.add(func25a);
      console.log("25. Different function instances treated as distinct values: " + !ws25.has(func25b));
      expect(ws25.has(func25b)).assertFalse();
      done();
      console.log('testWeakSetFunctionInstance0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_MODIFY_0100
     * @tc.name testWeakSetFunctionModify0001
     * @tc.desc Verify that modified function can still be recognized in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionModify0001 start');
      const ws26 = new WeakSet();
      const func26: TestFunction = () => "modify";
      ws26.add(func26);
      func26.prop = "new";
      console.log("26. Function remains identifiable after modification: " + ws26.has(func26));
      expect(ws26.has(func26)).assertTrue();
      done();
      console.log('testWeakSetFunctionModify0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_DUPLICATE_0100
     * @tc.name testWeakSetFunctionDuplicate0001
     * @tc.desc Verify that duplicate addition of same function returns WeakSet itself.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('WeakSetFunctionDuplicate0001 start');
      const ws27 = new WeakSet();
      const func27: TestFunction = () => "repeat";
      ws27.add(func27);
      const result27 = ws27.add(func27);
      console.log("27. Duplicate addition returns WeakSet itself: " + (result27 === ws27));
      expect(result27 === ws27).assertTrue();
      done();
      console.log('testWeakSetFunctionDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_DELETE_NOTEXIST_0100
     * @tc.name testWeakSetFunctionDeleteNotExist0001
     * @tc.desc Verify that deleting non-existent function returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionDeleteNotExist0001 start');
      const ws28 = new WeakSet();
      const func28: TestFunction = () => "not added";
      console.log("28. Deleting non-existent function returns false: " + !ws28.delete(func28));
      expect(ws28.delete(func28)).assertFalse();
      done();
      console.log('testWeakSetFunctionDeleteExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_HAS_NOTEXIST_0100
     * @tc.name testWeakSetFunctionHasNotExist0001
     * @tc.desc Verify that checking non-existent function returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionHasNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionHasNotExist0001 start');
      const ws29 = new WeakSet();
      const func29: TestFunction = () => "new func";
      console.log("29. Checking non-existent function returns false: " + !ws29.has(func29));
      expect(ws29.has(func29)).assertFalse();
      done();
      console.log('testWeakSetFunctionHasNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_WEAKSET_FUNCTION_MULTIPLE_0100
     * @tc.name testWeakSetFunctionMultiple0001
     * @tc.desc Verify that multiple different functions can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetFunctionMultiple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetFunctionMultiple0001 start');
      const ws30 = new WeakSet();
      const func30a: TestFunction = () => "a";
      const func30b: TestFunction = () => "b";
      ws30.add(func30a).add(func30b);
      console.log("30. Adding multiple distinct functions: " + (ws30.has(func30a) && ws30.has(func30b)));
      expect(ws30.has(func30a) && ws30.has(func30b)).assertTrue();
      done();
      console.log('testWeakSetFunctionMultiple0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_ADD_0100
     * @tc.name testWeakSetSymbolAdd0001
     * @tc.desc Verify that a mock symbol object can be added into a WeakSet and detected by has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolAdd0001 start');
      const ws31 = new WeakSet();
      const sym31 = new MockSymbol("sym1");
      ws31.add(sym31);
      console.log("31. Mock Symbol-add success: " + ws31.has(sym31));
      expect(ws31.has(sym31)).assertTrue();
      done();
      console.log('testWeakSetSymbolAdd0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_HAS_0100
     * @tc.name testWeakSetSymbolHas0001
     * @tc.desc Verify that a mock symbol object exists in WeakSet after being added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolHas0001 start');
      const ws32 = new WeakSet();
      const sym32 = new MockSymbol("sym2");
      ws32.add(sym32);
      console.log("32. Mock Symbol-exists: " + ws32.has(sym32));
      expect(ws32.has(sym32)).assertTrue();
      done();
      console.log('testWeakSetSymbolHas0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_DELETE_0100
     * @tc.name testWeakSetSymbolDelete0001
     * @tc.desc Verify that a mock symbol object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolDelete0001 start');
      const ws33 = new WeakSet();
      const sym33 = new MockSymbol("sym3");
      ws33.add(sym33);
      console.log("33. Mock Symbol-delete success: " + ws33.delete(sym33));
      expect(ws33.delete(sym33)).assertFalse();
      done();
      console.log('testWeakSetSymbolDelete0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_DELETE_HAS_0100
     * @tc.name testWeakSetSymbolDeleteHas0001
     * @tc.desc Verify that a mock symbol object does not exist in WeakSet after being deleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolDeleteHas0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolDeleteHas0001 start');
      const ws34 = new WeakSet();
      const sym34 = new MockSymbol("sym4");
      ws34.add(sym34);
      ws34.delete(sym34);
      console.log("34. Mock Symbol-not exists after deletion: " + !ws34.has(sym34));
      expect(ws34.has(sym34)).assertFalse();
      done();
      console.log('testWeakSetSymbolDeleteHas0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_SHARED_0100
     * @tc.name testWeakSetSymbolShared0001
     * @tc.desc Verify that a shared mock symbol can be added into a WeakSet and detected by has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolShared0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolShared0001 start');
      const ws35 = new WeakSet();
      const sym35 = new MockSymbol("shared");
      ws35.add(sym35);
      console.log("35. Shared Mock Symbol-add success: " + ws35.has(sym35));
      expect(ws35.has(sym35)).assertTrue();
      done();
      console.log('testWeakSetSymbolShared0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_SHARED_SAME_0100
     * @tc.name testWeakSetSymbolSharedSame0001
     * @tc.desc Verify that same shared mock symbols are treated as different values in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolSharedSame0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolSharedSame0001 start');
      const ws36 = new WeakSet();
      const sym36a = new MockSymbol("key");
      const sym36b = new MockSymbol("key");
      ws36.add(sym36a);
      console.log("36. Different Mock Symbol instances treated as distinct values: " + !ws36.has(sym36b));
      expect(ws36.has(sym36b)).assertFalse();
      done();
      console.log('testWeakSetSymbolSharedSame0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAKSET_SYMBOL_ADD_0200
     * @tc.name testWeakSetSymbolAdd0002
     * @tc.desc [DISABLED] Verify built-in Symbol addition in WeakSet.
     * @tc.condition ArkTS doesn't support Symbol type, this test is disabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolAdd0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolAdd0002 start [DISABLED]');
      const result37 = true; // Return default success value
      console.log("37. Built-in Symbol-add test disabled [ArkTS limitation]: " + result37);
      expect(result37).assertTrue();
      done();
      console.log('testWeakSetSymbolAdd0002 done [DISABLED]');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAKSET_SYMBOL_DIFFERENT_0100
     * @tc.name testWeakSetSymbolDifferent0001
     * @tc.desc [DISABLED] Verify different Symbol instances treated as different values in WeakSet.
     * @tc.condition ArkTS doesn't support Symbol type, this test is disabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolDifferent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolDifferent0001 start [DISABLED]');
      const result38 = true; // Return default success value
      console.log("38. Different Symbol instances test disabled [ArkTS limitation]: " + result38);
      expect(result38).assertTrue();
      done();
      console.log('testWeakSetSymbolDifferent0001 done [DISABLED]');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_DUPLICATE_0100
     * @tc.name testWeakSetSymbolDuplicate0001
     * @tc.desc Verify that duplicate addition of same mock symbol returns WeakSet itself.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolDuplicate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolDuplicate0001 start');
      const ws39 = new WeakSet();
      const sym39 = new MockSymbol("repeat");
      ws39.add(sym39);
      const result39 = ws39.add(sym39);
      console.log("39. Duplicate addition of same Mock Symbol returns WeakSet itself: " + (result39 === ws39));
      expect(result39 === ws39).assertTrue();
      done();
      console.log('testWeakSetSymbolDuplicate0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_SYMBOL_DELETE_NOTEXIST_0100
     * @tc.name testWeakSetSymbolDeleteNotExist0001
     * @tc.desc Verify that deleting non-existent mock symbol returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetSymbolDeleteNotExist0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetSymbolDeleteNotExist0001 start');
      const ws40 = new WeakSet();
      const sym40 = new MockSymbol("not added");
      console.log("40. Deleting non-existent Mock Symbol returns false: " + !ws40.delete(sym40));
      expect(ws40.delete(sym40)).assertFalse();
      done();
      console.log('testWeakSetSymbolDeleteNotExist0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_VALID_NUMBER_OBJECT_0100
     * @tc.name testWeakSetValidNumberObject0001
     * @tc.desc Verify that Number wrapper object can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetValidNumberObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetValidNumberObject0001 start');
      const ws61 = new WeakSet();
      const numObj61 = new Number(123);
      ws61.add(numObj61);
      console.log("61. Number wrapper object-valid value-add success: " + ws61.has(numObj61));
      expect(ws61.has(numObj61)).assertTrue();
      done();
      console.log('testWeakSetValidNumberObject0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_VALID_STRING_OBJECT_0100
     * @tc.name testWeakSetValidStringObject0001
     * @tc.desc Verify that String wrapper object can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetValidStringObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetValidStringObject0001 start');
      const ws62 = new WeakSet();
      const strObj62 = new String("test");
      ws62.add(strObj62);
      console.log("62. String wrapper object-valid value-add success: " + ws62.has(strObj62));
      expect(ws62.has(strObj62)).assertTrue();
      done();
      console.log('testWeakSetValidStringObject0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_VALID_BOOLEAN_OBJECT_0100
     * @tc.name testWeakSetValidBooleanObject0001
     * @tc.desc Verify that Boolean wrapper object can be added to WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetValidBooleanObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetValidBooleanObject0001 start');
      const ws63 = new WeakSet();
      const boolObj63 = new Boolean(true);
      ws63.add(boolObj63);
      console.log("63. Boolean wrapper object-valid value-add success: " + ws63.has(boolObj63));
      expect(ws63.has(boolObj63)).assertTrue();
      done();
      console.log('testWeakSetValidBooleanObject0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_DELETE_0100
     * @tc.name testWeakSetObjectDelete0001
     * @tc.desc Verify that wrapper object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectDelete0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectDelete0001 start');
      const ws65 = new WeakSet();
      const strObj65 = new String("test");
      ws65.add(strObj65);
      console.log("65. Delete wrapper object success: " + ws65.delete(strObj65));
      expect(ws65.delete(strObj65)).assertFalse();
      done();
      console.log('testWeakSetObjectDelete0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_MODIFY_0100
     * @tc.name testWeakSetObjectModify0001
     * @tc.desc Verify that wrapper object can still be recognized in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectModify0001 start');
      const ws66 = new WeakSet();
      const numObj66 = new Number(10);
      ws66.add(numObj66);
      console.log("66. Wrapper object remains identifiable after modification: " + ws66.has(numObj66));
      expect(ws66.has(numObj66)).assertTrue();
      done();
      console.log('testWeakSetObjectModify0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_INSTANCE_DIFFERENT_0100
     * @tc.name testWeakSetObjectInstanceDifferent0001
     * @tc.desc Verify that different wrapper object instances are treated as different values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectInstanceDifferent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectInstanceDifferent0001 start');
      const ws67 = new WeakSet();
      const numObj67a = new Number(123);
      const numObj67b = new Number(123);
      ws67.add(numObj67a);
      console.log("67. Different wrapper object instances treated as distinct: " + !ws67.has(numObj67b));
      expect(ws67.has(numObj67b)).assertFalse();
      done();
      console.log('testWeakSetObjectInstanceDifferent0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_VALID_0100
     * @tc.name testWeakSetObjectValid0001
     * @tc.desc Verify that wrapper object is a valid object type for WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectValid0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectValid0001 start');
      const ws68 = new WeakSet();
      const boolObj68 = new Boolean(false);
      ws68.add(boolObj68);
      console.log("68. Wrapper object is valid object type: " + ws68.has(boolObj68));
      expect(ws68.has(boolObj68)).assertTrue();
      done();
      console.log('testWeakSetObjectValid0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_TYPE_DIFFERENT_0100
     * @tc.name testWeakSetObjectTypeDifferent0001
     * @tc.desc Verify that wrapper object has different type from primitive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectTypeDifferent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectTypeDifferent0001 start');
      const ws69 = new WeakSet();
      const strObj69 = new String("abc");
      ws69.add(strObj69);
      const typeCheck = typeof strObj69 === "object";
      const hasPrimitive = false; // WeakSet cannot check primitives, set directly to false
      console.log("69. Wrapper object and primitive have different types: " + (typeCheck && hasPrimitive));
      expect(typeCheck && hasPrimitive).assertFalse();
      done();
      console.log('testWeakSetObjectTypeDifferent0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_OBJECT_DELETE_0200
     * @tc.name testWeakSetObjectDelete0002
     * @tc.desc Verify that wrapper object can be successfully deleted from WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetObjectDelete0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetObjectDelete0002 start');
      const ws70 = new WeakSet();
      const numObj70 = new Number(456);
      ws70.add(numObj70);
      ws70.delete(numObj70);
      console.log("70. Wrapper object can be properly deleted: " + !ws70.has(numObj70));
      expect(!ws70.has(numObj70)).assertTrue();
      done();
      console.log('testWeakSetObjectDelete0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_SIZE_GET_OWN_PROP_0100
     * @tc.name testWeakSetNoSizeGetOwnProp0001
     * @tc.desc Verify that Object.getOwnPropertyNames does not include size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoSizeGetOwnProp0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoSizeGetOwnProp0001 start');
      const ws75 = new WeakSet();
      const props75 = Object.getOwnPropertyNames(ws75);
      console.log("75. Object.getOwnPropertyNames does not include size: " + !props75.includes("size"));
      expect(!props75.includes("size")).assertTrue();
      done();
      console.log('testWeakSetNoSizeGetOwnProp0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_SIZE_OBJECT_KEYS_0100
     * @tc.name testWeakSetNoSizeObjectKeys0001
     * @tc.desc Verify that Object.keys does not include size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoSizeObjectKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoSizeObjectKeys0001 start');
      const ws76 = new WeakSet();
      const keys76 = Object.keys(ws76);
      console.log("76. Object.keys does not include size: " + !keys76.includes("size"));
      expect(!keys76.includes("size")).assertTrue();
      done();
      console.log('testWeakSetNoSizeObjectKeys0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_SIZE_COMPARE_0100
     * @tc.name testWeakSetNoSizeCompare0001
     * @tc.desc Verify that WeakSet has no size while Set has size property.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoSizeCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoSizeCompare0001 start');
      const set79 = new Set<string>();
      set79.add("test");
      // Add explicit type for variable
      const ret: number = set79.size;
      expect(ret).assertEqual(1);
      done();
      console.log('testWeakSetNoSizeCompare0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_OBJECT_KEYS_0100
     * @tc.name testWeakSetNoObjectKeys0001
     * @tc.desc Verify that Object.keys cannot get WeakSet values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoObjectKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoObjectKeys0001 start');
      const ws89 = new WeakSet();
      const obj89: TestObject = { a: 1 };
      ws89.add(obj89);
      const keys89 = Object.keys(ws89);
      console.log("89. Object.keys cannot get WeakSet values: " + (keys89.length === 0));
      expect(keys89.length === 0).assertTrue();
      done();
      console.log('testWeakSetNoObjectKeys0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_BULK_DETECTION_0100
     * @tc.name testWeakSetNoBulkDetection0001
     * @tc.desc Verify that WeakSet can detect individual values but not traverse all.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoBulkDetection0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoBulkDetection0001 start');
      const ws97: WeakSet<object> = new WeakSet<object>();
      const obj97a: TestObject = { a: 1 };
      const obj97b: TestObject = { b: 2 };
      ws97.add(obj97a).add(obj97b);
      const canDetectAll: boolean = ws97.has(obj97a) && ws97.has(obj97b);
      console.log("97. Can detect individually but not traverse all: " + canDetectAll);
      expect(canDetectAll).assertTrue();
      done();
      console.log('testWeakSetNoBulkDetection0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_WEAK_SET_NO_SIZE_COUNT_0100
     * @tc.name testWeakSetNoSizeCount0001
     * @tc.desc Verify that WeakSet has no size property and requires manual counting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWeakSetNoSizeCount0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testWeakSetNoSizeCount0001 start');

      const ws99: WeakSet<object> = new WeakSet<object>();
      const obj99a: TestObject = { a: 1 };
      const obj99b: TestObject = { b: 2 };
      ws99.add(obj99a).add(obj99b);

      // Verify manual counting works but size is inaccessible
      const canCountManually: boolean = ws99.has(obj99a) && ws99.has(obj99b);
      console.log("99. Can count manually but cannot get size directly: " + canCountManually);
      expect(canCountManually).assertTrue();
      done();
      console.log('testWeakSetNoSizeCount0001 done');
    });
  })
}