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
}

class NestedFieldClass {
  inner: AnotherClass = new AnotherClass();
  label: string = "test";
}

class ChildClass extends SimpleClass {
  extra: number = 99;
}

class MultiTypeClass {
  numField: number = 42;
  strField: string = "hello";
  boolField: boolean = true;
  objField: AnotherClass = new AnotherClass();
}

class SingleFieldClass {
  onlyField: string = "only";
}

export default function BuiltinsGetTypeTest(): void {
  describe('BuiltinsGetTypeTest', () => {
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
     * @tc.name    BuiltinsGetTypeTest0100
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0100
     * @tc.desc    Verify number type field getType returns valid primitive Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("value");
      const fieldType = field!.getType();
      expect(fieldType !== undefined).assertTrue();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0200
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0200
     * @tc.desc    Verify string type field getType returns correct Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("name");
      const fieldType = field!.getType();
      expect(fieldType !== undefined).assertTrue();
      expect(fieldType.getName()).assertEqual(Class.from<string>().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0300
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0300
     * @tc.desc    Verify boolean type field getType returns valid primitive Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsGetTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<SimpleClass>().getInstanceField("flag");
      const fieldType = field!.getType();
      expect(fieldType !== undefined).assertTrue();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0400
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0400
     * @tc.desc    Verify custom class type field getType returns correct Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<NestedFieldClass>().getInstanceField("inner");
      const fieldType = field!.getType();
      expect(fieldType.getName()).assertEqual(Class.from<AnotherClass>().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0500
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0500
     * @tc.desc    Verify different type fields getType return different Classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numField = Class.from<SimpleClass>().getInstanceField("value");
      const strField = Class.from<SimpleClass>().getInstanceField("name");
      const boolField = Class.from<SimpleClass>().getInstanceField("flag");
      expect(numField!.getType().getName() === strField!.getType().getName()).assertFalse();
      expect(numField!.getType().getName() === boolField!.getType().getName()).assertFalse();
      expect(strField!.getType().getName() === boolField!.getType().getName()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0600
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0600
     * @tc.desc    Verify multiple getType calls return consistent results (idempotency)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<SimpleClass>().getInstanceField("value");
      const type1 = field!.getType();
      const type2 = field!.getType();
      const type3 = field!.getType();
      expect(type1.getName()).assertEqual(type2.getName());
      expect(type2.getName()).assertEqual(type3.getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0700
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0700
     * @tc.desc    Verify same type fields in different classes getType return same Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<SimpleClass>().getInstanceField("value");
      const field2 = Class.from<AnotherClass>().getInstanceField("id");
      expect(field1!.getType().getName()).assertEqual(field2!.getType().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0800
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0800
     * @tc.desc    Verify subclass new field and parent same type field getType return same Class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parentField = Class.from<SimpleClass>().getInstanceField("value");
      const childField = Class.from<ChildClass>().getInstanceField("extra");
      expect(parentField!.getType().getName()).assertEqual(childField!.getType().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest0900
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_0900
     * @tc.desc    Verify custom class field getType is non-primitive, primitive field getType is primitive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MultiTypeClass>();
      const numType = cls.getInstanceField("numField")!.getType();
      const strType = cls.getInstanceField("strField")!.getType();
      const boolType = cls.getInstanceField("boolField")!.getType();
      const objType = cls.getInstanceField("objField")!.getType();

      expect(numType.isPrimitive()).assertTrue();
      expect(boolType.isPrimitive()).assertTrue();
      expect(objType.isPrimitive()).assertFalse();
      expect(objType.getName()).assertEqual(Class.from<AnotherClass>().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1000
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1000
     * @tc.desc    Verify that getType returns non-undefined for fields retrieved via getInstanceFields iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MultiTypeClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const fieldType = fields[i].getType();
        expect(fieldType !== undefined).assertTrue();
        expect(fieldType.getName().length > 0).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1100
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1100
     * @tc.desc    Verify that getType returns non-primitive type (reference type) for string fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<SimpleClass>().getInstanceField("name");
      const fieldType = field!.getType();
      expect(fieldType.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1200
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1200
     * @tc.desc    Verify that getType results match between fields from getInstanceFields and getInstanceField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<SingleFieldClass>();
      const fieldByName = cls.getInstanceField("onlyField");
      const allFields = cls.getInstanceFields();
      expect(allFields.length > 0).assertTrue();
      expect(fieldByName!.getType().getName()).assertEqual(allFields[0].getType().getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1300
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1300
     * @tc.desc    Verify that getType returns consistent results for the same field from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const type1 = Class.from<SimpleClass>().getInstanceField("value")!.getType();
      const type2 = Class.from<SimpleClass>().getInstanceField("value")!.getType();
      expect(type1.getName()).assertEqual(type2.getName());
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1400
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1400
     * @tc.desc    Verify that getType returns non-primitive type for custom class fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsGetTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<NestedFieldClass>().getInstanceField("inner");
      expect(field!.getType().isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsGetTypeTest1500
     * @tc.number  SUB_BUILTINS_GET_TYPE_TEST_1500
     * @tc.desc    Verify that isPrimitive differs between reference type and primitive type fields in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsGetTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MultiTypeClass>();
      const numIsPrim = cls.getInstanceField("numField")!.getType().isPrimitive();
      const objIsPrim = cls.getInstanceField("objField")!.getType().isPrimitive();
      expect(numIsPrim).assertTrue();
      expect(objIsPrim).assertFalse();
      expect(numIsPrim === objIsPrim).assertFalse();
    });
  });
}
