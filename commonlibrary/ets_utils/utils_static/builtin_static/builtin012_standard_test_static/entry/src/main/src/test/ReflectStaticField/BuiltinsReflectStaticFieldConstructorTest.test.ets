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
  static staticField: string = "staticValue";
  instanceField: number = 42;
}

class AnotherTestClass {
  static anotherStaticField: number = 100;
}

export default function ReflectStaticFieldConstructorTest(): void {
  describe('ReflectStaticFieldConstructorTest', () => {
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
     * @tc.name    ReflectStaticFieldConstructorTest0100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify getStaticField returns valid StaticField object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectStaticFieldConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("staticField");
      expect(field !== undefined).assertTrue();
      expect(field !== null).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify getStaticField returns different StaticField objects for different fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("staticField");
      const field2 = Class.from<AnotherTestClass>().getStaticField("anotherStaticField");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual("staticField");
      expect(field2!.getName()).assertEqual("anotherStaticField");
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify getStaticField returns consistent results for multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("staticField");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("staticField");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual(field2!.getName());
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify getStaticField in batch processing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const count = 100;
      for (let i = 0; i < count; i++) {
        const field = Class.from<TestClassWithStaticField>().getStaticField("staticField");
        expect(field !== undefined).assertTrue();
        expect(field!.getName()).assertEqual("staticField");
      }
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify getStaticField returns undefined for non-existent field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("nonExistentField");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify getStaticField returns undefined for instance field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("instanceField");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify getStaticFields returns array containing StaticField objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields = Class.from<TestClassWithStaticField>().getStaticFields();
      expect(fields.length > 0).assertTrue();
      expect(fields[0] !== undefined).assertTrue();
      expect(fields[0].getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldConstructorTest0800
     * @tc.number  SUB_REFLECT_STATIC_FIELD_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify getStaticField returns undefined for empty string field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("");
      expect(field === undefined).assertTrue();
    });
  });
}
