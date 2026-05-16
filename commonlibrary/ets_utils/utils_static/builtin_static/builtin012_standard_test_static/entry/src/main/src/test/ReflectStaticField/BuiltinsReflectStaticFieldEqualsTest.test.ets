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

class TestClassWithStaticField {
  static field1: string = "value1";
  static field2: string = "value2";
  static field3: number = 100;
}

class AnotherTestClass {
  static field1: string = "value1";
}

export default function ReflectStaticFieldEqualsTest(): void {
  describe('ReflectStaticFieldEqualsTest', () => {
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
     * @tc.name    ReflectStaticFieldEqualsTest0100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0100
     * @tc.desc    Verify equals returns true for same static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectStaticFieldEqualsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.equals(field2!)).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0200
     * @tc.desc    Verify equals returns false for different static fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectStaticFieldEqualsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field2");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.equals(field2!)).assertFalse();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0300
     * @tc.desc    Verify multiple field comparisons
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldEqualsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field2");
      const field3 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      expect(field1!.equals(field2!)).assertFalse();
      expect(field1!.equals(field3!)).assertTrue();
      expect(field2!.equals(field3!)).assertFalse();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0400
     * @tc.desc    Verify equals returns false for fields with same name in different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldEqualsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<AnotherTestClass>().getStaticField("field1");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.equals(field2!)).assertFalse();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0500
     * @tc.desc    Verify equals returns false for fields with different types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldEqualsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field3 = Class.from<TestClassWithStaticField>().getStaticField("field3");
      expect(field1 !== undefined).assertTrue();
      expect(field3 !== undefined).assertTrue();
      expect(field1!.equals(field3!)).assertFalse();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0600
     * @tc.desc    Verify idempotency: consistent results for multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldEqualsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const result1 = field1!.equals(field2!);
      const result2 = field1!.equals(field2!);
      const result3 = field1!.equals(field2!);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0700
     * @tc.desc    Verify instance independence: different field instances do not affect each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldEqualsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field2");
      const field3 = Class.from<TestClassWithStaticField>().getStaticField("field1");
      expect(field1!.equals(field2!)).assertFalse();
      expect(field1!.equals(field3!)).assertTrue();
      expect(field2!.equals(field3!)).assertFalse();
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0800
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0800
     * @tc.desc    Verify batch comparison: get fields in batch and compare
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<TestClassWithStaticField>().getStaticFields();
      expect(fields.length >= 2).assertTrue();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          const isEqual = fields[i].equals(fields[j]);
          if (i === j) {
            expect(isEqual).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest0900
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_0900
     * @tc.desc    Verify comparison of large number of field retrievals
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const count = 100;
      for (let i = 0; i < count; i++) {
        const field1 = Class.from<TestClassWithStaticField>().getStaticField("field1");
        const field2 = Class.from<TestClassWithStaticField>().getStaticField("field1");
        expect(field1!.equals(field2!)).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest1000
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_1000
     * @tc.desc    Verify reflexivity: field equals itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const fields = Class.from<TestClassWithStaticField>().getStaticFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectStaticFieldEqualsTest1100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_EQUALS_TEST_1100
     * @tc.desc    Verify symmetry: if field1 equals field2 then field2 equals field1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const field1a = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field1b = Class.from<TestClassWithStaticField>().getStaticField("field1");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("field2");
      expect(field1a!.equals(field1b!)).assertEqual(field1b!.equals(field1a!));
      expect(field1a!.equals(field2!)).assertEqual(field2!.equals(field1a!));
    });
  });
}
