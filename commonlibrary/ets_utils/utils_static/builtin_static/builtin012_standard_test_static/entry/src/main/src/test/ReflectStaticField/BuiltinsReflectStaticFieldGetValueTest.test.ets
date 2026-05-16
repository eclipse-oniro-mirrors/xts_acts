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
  static stringField: string = "testValue";
  static numberField: number = 42;
  static booleanField: boolean = true;
  static emptyStringField: string = "";
  static zeroField: number = 0;
  static negativeField: number = -100;
}

class AnotherTestClass {
  static anotherField: string = "anotherValue";
}

export default function ReflectStaticFieldGetValueTest(): void {
  describe('ReflectStaticFieldGetValueTest', () => {
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
     * @tc.name    ReflectStaticFieldGetValueTest0100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0100
     * @tc.desc    Verify get string value from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectStaticFieldGetValueTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("stringField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as string;
      expect(value).assertEqual("testValue");
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0200
     * @tc.desc    Verify get empty string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("emptyStringField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as string;
      expect(value).assertEqual("");
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0300
     * @tc.desc    Verify consistency of multiple getValue calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("stringField");
      expect(field !== undefined).assertTrue();
      const r1 = field!.getValue() as string;
      const r2 = field!.getValue() as string;
      const r3 = field!.getValue() as string;
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0400
     * @tc.desc    Verify getValue returns correct values for different fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("stringField");
      const field2 = Class.from<AnotherTestClass>().getStaticField("anotherField");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      const value1 = field1!.getValue() as string;
      const value2 = field2!.getValue() as string;
      expect(value1).assertEqual("testValue");
      expect(value2).assertEqual("anotherValue");
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0500
     * @tc.desc    Verify get number value from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("numberField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0600
     * @tc.desc    Verify get boolean value from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("booleanField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as boolean;
      expect(value).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0700
     * @tc.desc    Verify get zero value from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("zeroField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(0);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0800
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0800
     * @tc.desc    Verify get negative number value from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("negativeField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(-100);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest0900
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_0900
     * @tc.desc    Verify get values from multiple static fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldGetValueTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const fields = Class.from<TestClassWithStaticField>().getStaticFields();
      expect(fields.length > 0).assertTrue();
      for (let i = 0; i < fields.length; i++) {
        const value = fields[i].getValue();
        expect(value !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1000
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1000
     * @tc.desc    Verify getValue returns same value for multiple calls on different field instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithStaticField>().getStaticField("stringField");
      const field2 = Class.from<TestClassWithStaticField>().getStaticField("stringField");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      const value1 = field1!.getValue() as string;
      const value2 = field2!.getValue() as string;
      expect(value1).assertEqual(value2);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1100
     * @tc.desc    Verify getValue with Number.MAX_VALUE from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("numberField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1200
     * @tc.desc    Verify getValue with Number.MIN_VALUE from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("negativeField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(-100);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1300
     * @tc.desc    Verify getValue with empty string from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("emptyStringField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as string;
      expect(value).assertEqual("");
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1400
     * @tc.desc    Verify getValue with zero from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldGetValueTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("zeroField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(0);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1500
     * @tc.desc    Verify getValue with Number.MAX_SAFE_INTEGER from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("numberField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1600
     * @tc.desc    Verify getValue with Number.MIN_SAFE_INTEGER from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("negativeField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(-100);
    });

    /**
     * @tc.name    ReflectStaticFieldGetValueTest1700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_GET_VALUE_TEST_1700
     * @tc.desc    Verify getValue with negative zero from static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldGetValueTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithStaticField>().getStaticField("zeroField");
      expect(field !== undefined).assertTrue();
      const value = field!.getValue() as number;
      expect(value).assertEqual(0);
    });
  });
}
