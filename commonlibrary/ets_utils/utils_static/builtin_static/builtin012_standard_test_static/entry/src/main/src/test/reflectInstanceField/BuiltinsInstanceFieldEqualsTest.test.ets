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

class NumberFieldClass {
  value: number = 0;
  count: number = 0;
}

class StringFieldClass {
  text: string = "";
  label: string = "";
}

class BooleanFieldClass {
  flag: boolean = false;
  active: boolean = false;
}

class MultiTypeClass {
  n: number = 0;
  s: string = "";
  b: boolean = false;
}

class ParentClass {
  parentField: number = 0;
}

class ChildClass extends ParentClass {
  childField: string = "";
}

class SingleFieldClass {
  only: number = 0;
}

export default function BuiltinsInstanceFieldEqualsTest(): void {
  describe('BuiltinsInstanceFieldEqualsTest', () => {
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
     * @tc.name    BuiltinsInstanceFieldEqualsTest0100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0100
     * @tc.desc    Verify Number field self-comparison returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldEqualsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      expect(field!.equals(field!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0200
     * @tc.desc    Verify two fetches of same Number field equals returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldEqualsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field1 = Class.from<NumberFieldClass>().getInstanceField("value");
      const field2 = Class.from<NumberFieldClass>().getInstanceField("value");
      expect(field1!.equals(field2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0300
     * @tc.desc    Verify two different Number fields in same class equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldEqualsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field1 = Class.from<NumberFieldClass>().getInstanceField("value");
      const field2 = Class.from<NumberFieldClass>().getInstanceField("count");
      expect(field1!.equals(field2!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0400
     * @tc.desc    Verify Number field and String field equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldEqualsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fieldNum = Class.from<NumberFieldClass>().getInstanceField("value");
      const fieldStr = Class.from<StringFieldClass>().getInstanceField("text");
      expect(fieldNum!.equals(fieldStr!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0500
     * @tc.desc    Verify String field symmetry: a.equals(b) and b.equals(a) results are consistent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<StringFieldClass>().getInstanceField("text");
      const field2 = Class.from<StringFieldClass>().getInstanceField("text");
      expect(field1!.equals(field2!)).assertTrue();
      expect(field2!.equals(field1!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0600
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0600
     * @tc.desc    Verify Number field and Boolean field symmetrically not equal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fieldNum = Class.from<NumberFieldClass>().getInstanceField("value");
      const fieldBool = Class.from<BooleanFieldClass>().getInstanceField("flag");
      expect(fieldNum!.equals(fieldBool!)).assertFalse();
      expect(fieldBool!.equals(fieldNum!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0700
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0700
     * @tc.desc    Verify Number field transitivity: a==b and b==c then a==c
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<NumberFieldClass>().getInstanceField("value");
      const field2 = Class.from<NumberFieldClass>().getInstanceField("value");
      const field3 = Class.from<NumberFieldClass>().getInstanceField("value");
      expect(field1!.equals(field2!)).assertTrue();
      expect(field2!.equals(field3!)).assertTrue();
      expect(field1!.equals(field3!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0800
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0800
     * @tc.desc    Verify Number field equals idempotency: multiple calls return consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<NumberFieldClass>().getInstanceField("value");
      const field2 = Class.from<NumberFieldClass>().getInstanceField("value");
      for (let i = 0; i < 10; i++) {
        expect(field1!.equals(field2!)).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest0900
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_0900
     * @tc.desc    Verify subclass String field and parent Number field equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parentField = Class.from<ParentClass>().getInstanceField("parentField");
      const childField = Class.from<ChildClass>().getInstanceField("childField");
      expect(parentField!.equals(childField!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1000
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1000
     * @tc.desc    Verify String field and Boolean field equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fieldStr = Class.from<StringFieldClass>().getInstanceField("text");
      const fieldBool = Class.from<BooleanFieldClass>().getInstanceField("flag");
      expect(fieldStr!.equals(fieldBool!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1100
     * @tc.desc    Verify multi-type field class (Number + String + Boolean) all fields pairwise not equal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MultiTypeClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = i + 1; j < fields.length; j++) {
          expect(fields[i].equals(fields[j])).assertFalse();
        }
      }
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1200
     * @tc.desc    Verify Boolean field via getInstanceFields and getInstanceField equals is true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldEqualsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<BooleanFieldClass>();
      const fieldByName = cls.getInstanceField("flag");
      const allFields = cls.getInstanceFields();
      expect(allFields.length > 0).assertTrue();
      let found = false;
      for (let i = 0; i < allFields.length; i++) {
        if (fieldByName!.equals(allFields[i])) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1300
     * @tc.desc    Verify multi-type field class each field in getInstanceFields equals itself returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldEqualsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MultiTypeClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1400
     * @tc.desc    Verify Number single field class two fetches equals returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldEqualsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field1 = Class.from<SingleFieldClass>().getInstanceField("only");
      const field2 = Class.from<SingleFieldClass>().getInstanceField("only");
      expect(field1!.equals(field2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldEqualsTest1500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_EQUALS_TEST_1500
     * @tc.desc    Verify parent class Number field two independent fetches equals returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldEqualsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<ParentClass>().getInstanceField("parentField");
      const field2 = Class.from<ParentClass>().getInstanceField("parentField");
      expect(field1!.equals(field2!)).assertTrue();
    });
  });
}
