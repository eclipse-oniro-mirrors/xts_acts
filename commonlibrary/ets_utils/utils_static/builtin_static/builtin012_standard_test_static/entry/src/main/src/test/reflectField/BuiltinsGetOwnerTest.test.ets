 /*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class ClassA {
  value: number = 0;
  name: string = "";
}

class ClassB {
  id: number = 1;
  label: string = "b";
}

class ParentClass {
  parentField: number = 10;
}

class ChildClass extends ParentClass {
  childField: string = "child";
}

class GrandChildClass extends ChildClass {
  grandChildField: boolean = true;
}

class MultiFieldClass {
  numField: number = 42;
  strField: string = "hello";
  boolField: boolean = true;
}

class SingleFieldOwner {
  solo: number = 0;
}

export default function BuiltinsGetOwnerTest(): void {
  describe('BuiltinsGetOwnerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsGetOwnerTest0100
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0100
     * @tc.desc    Verify field getOwner returns the class declaring this field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetOwnerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<ClassA>().getInstanceField("value");
      const owner = field!.getOwner();
      expect(owner.getName()).assertEqual(Class.from<ClassA>().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0200
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0200
     * @tc.desc    Verify fields from different classes getOwner return their respective declaring classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetOwnerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fieldA = Class.from<ClassA>().getInstanceField("value");
      const fieldB = Class.from<ClassB>().getInstanceField("id");
      const ownerA = fieldA!.getOwner();
      const ownerB = fieldB!.getOwner();
      expect(ownerA.getName()).assertEqual(Class.from<ClassA>().getName());
      expect(ownerB.getName()).assertEqual(Class.from<ClassB>().getName());
      expect(ownerA.getName() === ownerB.getName()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0300
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0300
     * @tc.desc    Verify different fields in same class getOwner return the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetOwnerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<ClassA>().getInstanceField("value");
      const field2 = Class.from<ClassA>().getInstanceField("name");
      expect(field1!.getOwner().getName()).assertEqual(field2!.getOwner().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0400
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0400
     * @tc.desc    Verify subclass own field getOwner returns subclass itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetOwnerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<ChildClass>().getInstanceField("childField");
      const owner = field!.getOwner();
      expect(owner.getName()).assertEqual(Class.from<ChildClass>().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0500
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0500
     * @tc.desc    Verify parent class field getOwner returns parent class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetOwnerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<ParentClass>().getInstanceField("parentField");
      const owner = field!.getOwner();
      expect(owner.getName()).assertEqual(Class.from<ParentClass>().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0600
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0600
     * @tc.desc    Verify grandchild class own field getOwner returns grandchild class itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<GrandChildClass>().getInstanceField("grandChildField");
      const owner = field!.getOwner();
      expect(owner.getName()).assertEqual(Class.from<GrandChildClass>().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0700
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0700
     * @tc.desc    Verify multiple getOwner calls return consistent results (idempotency)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<ClassA>().getInstanceField("value");
      const owner1 = field!.getOwner();
      const owner2 = field!.getOwner();
      const owner3 = field!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
      expect(owner2.getName()).assertEqual(owner3.getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0800
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0800
     * @tc.desc    Verify getOwner return value is not undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetOwnerTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<ClassB>().getInstanceField("id");
      const owner = field!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest0900
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_0900
     * @tc.desc    Verify iterating all fields via getInstanceFields getOwner returns same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MultiFieldClass>();
      const fields = cls.getInstanceFields();
      const expectedName = cls.getName();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getOwner().getName()).assertEqual(expectedName);
      }
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1000
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1000
     * @tc.desc    Verify subclass own field and parent class field getOwner return respective declaring classes (different)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const childField = Class.from<ChildClass>().getInstanceField("childField");
      const parentField = Class.from<ParentClass>().getInstanceField("parentField");
      const childOwner = childField!.getOwner().getName();
      const parentOwner = parentField!.getOwner().getName();
      expect(childOwner).assertEqual(Class.from<ChildClass>().getName());
      expect(parentOwner).assertEqual(Class.from<ParentClass>().getName());
      expect(childOwner === parentOwner).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1100
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1100
     * @tc.desc    Verify getOwner via getInstanceFields matches getInstanceField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<SingleFieldOwner>();
      const fieldByName = cls.getInstanceField("solo");
      const allFields = cls.getInstanceFields();
      expect(allFields.length > 0).assertTrue();
      expect(fieldByName!.getOwner().getName()).assertEqual(allFields[0].getOwner().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1200
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1200
     * @tc.desc    Verify getOwner results consistent for same field from two Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const owner1 = Class.from<ClassA>().getInstanceField("value")!.getOwner();
      const owner2 = Class.from<ClassA>().getInstanceField("value")!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1300
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1300
     * @tc.desc    Verify number and string fields in same class have same getOwner
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetOwnerTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numField = Class.from<ClassB>().getInstanceField("id");
      const strField = Class.from<ClassB>().getInstanceField("label");
      expect(numField!.getOwner().getName()).assertEqual(strField!.getOwner().getName());
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1400
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1400
     * @tc.desc    Verify grandchild own field getOwner different from grandparent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const grandChildOwner = Class.from<GrandChildClass>().getInstanceField("grandChildField")!.getOwner();
      const parentOwner = Class.from<ParentClass>().getInstanceField("parentField")!.getOwner();
      expect(grandChildOwner.getName() === parentOwner.getName()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetOwnerTest1500
     * @tc.number  SUB_BUILTINS_GET_OWNER_TEST_1500
     * @tc.desc    Verify multiple classes getOwner getName match Class.from respectively
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetOwnerTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const classes: string[] = [];
      const fieldA = Class.from<ClassA>().getInstanceField("value");
      const fieldB = Class.from<ClassB>().getInstanceField("id");
      const fieldMulti = Class.from<MultiFieldClass>().getInstanceField("numField");

      expect(fieldA!.getOwner().getName()).assertEqual(Class.from<ClassA>().getName());
      expect(fieldB!.getOwner().getName()).assertEqual(Class.from<ClassB>().getName());
      expect(fieldMulti!.getOwner().getName()).assertEqual(Class.from<MultiFieldClass>().getName());
    });
  });
}
