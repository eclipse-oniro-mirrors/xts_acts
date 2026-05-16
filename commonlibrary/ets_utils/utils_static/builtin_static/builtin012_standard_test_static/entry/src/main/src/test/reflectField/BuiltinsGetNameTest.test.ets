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

class SimpleClass {
  value: number = 0;
  name: string = "";
  flag: boolean = false;
}

class AnotherClass {
  id: number = 1;
  label: string = "test";
}

class ParentClass {
  parentField: number = 10;
}

class ChildClass extends ParentClass {
  childField: string = "child";
}

class MultiFieldClass {
  alpha: number = 1;
  beta: string = "b";
  gamma: boolean = true;
  delta: number = 4;
}

class GrandChildClass extends ChildClass {
  grandChildField: boolean = true;
}

class TwoFieldClass {
  first: number = 1;
  second: string = "two";
}

export default function BuiltinsGetNameTest(): void {
  describe('BuiltinsGetNameTest', () => {
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
     * @tc.name    BuiltinsGetNameTest0100
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0100
     * @tc.desc    Verify basic function: get field name returns correct string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetNameTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("value");
      expect(field!.getName()).assertEqual("value");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0200
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0200
     * @tc.desc    Verify string type field name is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetNameTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("name");
      expect(field!.getName()).assertEqual("name");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0300
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0300
     * @tc.desc    Verify boolean type field name is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetNameTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("flag");
      expect(field!.getName()).assertEqual("flag");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0400
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0400
     * @tc.desc    Verify field names in different classes are correct respectively
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fieldA = Class.from<SimpleClass>().getInstanceField("value");
      const fieldB = Class.from<AnotherClass>().getInstanceField("id");
      expect(fieldA!.getName()).assertEqual("value");
      expect(fieldB!.getName()).assertEqual("id");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0500
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0500
     * @tc.desc    Verify different fields in same class getName return different names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<SimpleClass>().getInstanceField("value");
      const field2 = Class.from<SimpleClass>().getInstanceField("name");
      const field3 = Class.from<SimpleClass>().getInstanceField("flag");
      expect(field1!.getName() === field2!.getName()).assertFalse();
      expect(field1!.getName() === field3!.getName()).assertFalse();
      expect(field2!.getName() === field3!.getName()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetNameTest0600
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0600
     * @tc.desc    Verify multiple getName calls return consistent results (idempotency)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<SimpleClass>().getInstanceField("value");
      const name1 = field!.getName();
      const name2 = field!.getName();
      const name3 = field!.getName();
      expect(name1).assertEqual(name2);
      expect(name2).assertEqual(name3);
    });

    /**
     * @tc.name    BuiltinsGetNameTest0700
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0700
     * @tc.desc    Verify subclass own field getName returns correct name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<ChildClass>().getInstanceField("childField");
      expect(field!.getName()).assertEqual("childField");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0800
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0800
     * @tc.desc    Verify parent class field getName returns correct name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<ParentClass>().getInstanceField("parentField");
      expect(field!.getName()).assertEqual("parentField");
    });

    /**
     * @tc.name    BuiltinsGetNameTest0900
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_0900
     * @tc.desc    Verify getName return value is non-empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<AnotherClass>().getInstanceField("label");
      const name = field!.getName();
      expect(name !== undefined).assertTrue();
      expect(name.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsGetNameTest1000
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1000
     * @tc.desc    Verify all field names via getInstanceFields iteration match expected
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MultiFieldClass>().getInstanceFields();
      const expectedNames: string[] = ["alpha", "beta", "gamma", "delta"];
      for (let i = 0; i < fields.length; i++) {
        const name = fields[i].getName();
        expect(name !== undefined).assertTrue();
        expect(name.length > 0).assertTrue();
        expect(expectedNames.indexOf(name) >= 0).assertTrue();
      }
      expect(fields.length).assertEqual(expectedNames.length);
    });

    /**
     * @tc.name    BuiltinsGetNameTest1100
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1100
     * @tc.desc    Verify that getName returns the same name as used in getInstanceField lookup
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fieldNames: string[] = ["first", "second"];
      for (let name of fieldNames) {
        const field = Class.from<TwoFieldClass>().getInstanceField(name);
        expect(field!.getName()).assertEqual(name);
      }
    });

    /**
     * @tc.name    BuiltinsGetNameTest1200
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1200
     * @tc.desc    Verify that getName returns correct name for grandchild class own field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetNameTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<GrandChildClass>().getInstanceField("grandChildField");
      expect(field!.getName()).assertEqual("grandChildField");
    });

    /**
     * @tc.name    BuiltinsGetNameTest1300
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1300
     * @tc.desc    Verify that getName returns consistent results for the same field from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const name1 = Class.from<SimpleClass>().getInstanceField("value")!.getName();
      const name2 = Class.from<SimpleClass>().getInstanceField("value")!.getName();
      expect(name1).assertEqual(name2);
    });

    /**
     * @tc.name    BuiltinsGetNameTest1400
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1400
     * @tc.desc    Verify that field names from getInstanceFields match those from getInstanceField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<AnotherClass>();
      const allFields = cls.getInstanceFields();
      for (let i = 0; i < allFields.length; i++) {
        const name = allFields[i].getName();
        const fieldByName = cls.getInstanceField(name);
        expect(fieldByName!.getName()).assertEqual(name);
      }
    });

    /**
     * @tc.name    BuiltinsGetNameTest1500
     * @tc.number  SUB_BUILTINS_GET_NAME_TEST_1500
     * @tc.desc    Verify that getName returns correct names for fields in multiple classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetNameTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(Class.from<AnotherClass>().getInstanceField("id")!.getName()).assertEqual("id");
      expect(Class.from<AnotherClass>().getInstanceField("label")!.getName()).assertEqual("label");
      expect(Class.from<ParentClass>().getInstanceField("parentField")!.getName()).assertEqual("parentField");
      expect(Class.from<ChildClass>().getInstanceField("childField")!.getName()).assertEqual("childField");
    });
  });
}
