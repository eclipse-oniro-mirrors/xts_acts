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

class TestClassWithMutableStaticField {
  static mutableStringField: string = "initialValue";
  static mutableNumberField: number = 0;
  static mutableBooleanField: boolean = false;
}

class TestClassWithReadonlyStaticField {
  static readonly readonlyField: string = "readonlyValue";
}

class TestClassWithNullableStaticField {
  static nullableField: string | null | undefined = "initial";
}

export default function ReflectStaticFieldSetValueTest(): void {
  describe('ReflectStaticFieldSetValueTest', () => {
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
     * @tc.name    ReflectStaticFieldSetValueTest0100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0100
     * @tc.desc    Verify set string value to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectStaticFieldSetValueTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      field!.setValue("newValue");
      const value = field!.getValue() as string;
      expect(value).assertEqual("newValue");
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0200
     * @tc.desc    Verify set empty string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      field!.setValue("");
      const value = field!.getValue() as string;
      expect(value).assertEqual("");
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0300
     * @tc.desc    Verify set number value to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      const newValue: number = 100;
      field!.setValue(newValue);
      const value = field!.getValue() as number;
      expect(value).assertEqual(100);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0400
     * @tc.desc    Verify set boolean value to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableBooleanField");
      expect(field !== undefined).assertTrue();
      const newValue: boolean = true;
      field!.setValue(newValue);
      const value = field!.getValue() as boolean;
      expect(value).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0500
     * @tc.desc    Verify set value multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      field!.setValue("value1");
      field!.setValue("value2");
      field!.setValue("value3");
      const value = field!.getValue() as string;
      expect(value).assertEqual("value3");
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0600
     * @tc.desc    Verify setValue affects class static field globally
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field1 = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      const field2 = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      field1!.setValue("sharedValue");
      const value1 = field1!.getValue() as string;
      const value2 = field2!.getValue() as string;
      expect(value1).assertEqual("sharedValue");
      expect(value2).assertEqual("sharedValue");
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0700
     * @tc.desc    Verify set negative number value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      const newValue: number = -999;
      field!.setValue(newValue);
      const value = field!.getValue() as number;
      expect(value).assertEqual(-999);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0800
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0800
     * @tc.desc    Verify set zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      const firstValue: number = 100;
      const secondValue: number = 0;
      field!.setValue(firstValue);
      field!.setValue(secondValue);
      const value = field!.getValue() as number;
      expect(value).assertEqual(0);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest0900
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_0900
     * @tc.desc    Verify set values to static field multiple times in batch
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldSetValueTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      const count = 100;
      for (let i = 0; i < count; i++) {
        const newValue: number = i;
        field!.setValue(newValue);
        const value = field!.getValue() as number;
        expect(value).assertEqual(i);
      }
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1000
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1000
     * @tc.desc    Verify set different values multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldSetValueTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      const testValues: string[] = ["value1", "", "value2", "test"];
      for (let i = 0; i < testValues.length; i++) {
        field!.setValue(testValues[i]);
        const value = field!.getValue() as string;
        expect(value).assertEqual(testValues[i]);
      }
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1100
     * @tc.desc    Verify setValue throws error for readonly field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectStaticFieldSetValueTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const field = Class.from<TestClassWithReadonlyStaticField>().getStaticField("readonlyField");
      expect(field !== undefined).assertTrue();
      try {
        field!.setValue("newValue");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1200
     * @tc.desc    Verify setValue with null value to nullable field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithNullableStaticField>().getStaticField("nullableField");
      expect(field !== undefined).assertTrue();
      const newValue: null = null;
      field!.setValue(newValue);
      const value = field!.getValue();
      expect(value === null).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1300
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1300
     * @tc.desc    Verify setValue with undefined value to nullable field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithNullableStaticField>().getStaticField("nullableField");
      expect(field !== undefined).assertTrue();
      const newValue: undefined = undefined;
      field!.setValue(newValue);
      const value = field!.getValue();
      expect(value === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1400
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1400
     * @tc.desc    Verify setValue with Number.MAX_VALUE to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(Number.MAX_VALUE);
      const value = field!.getValue() as number;
      expect(value).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1500
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1500
     * @tc.desc    Verify setValue with Number.MIN_VALUE to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(Number.MIN_VALUE);
      const value = field!.getValue() as number;
      expect(value).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1600
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1600
     * @tc.desc    Verify setValue with Infinity to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(Infinity);
      const value = field!.getValue() as number;
      expect(value).assertEqual(Infinity);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1700
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1700
     * @tc.desc    Verify setValue with NaN to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(NaN);
      const value = field!.getValue() as number;
      expect(Number.isNaN(value)).assertTrue();
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1800
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1800
     * @tc.desc    Verify setValue with Number.MAX_SAFE_INTEGER to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(Number.MAX_SAFE_INTEGER);
      const value = field!.getValue() as number;
      expect(value).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest1900
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_1900
     * @tc.desc    Verify setValue with Number.MIN_SAFE_INTEGER to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      field!.setValue(Number.MIN_SAFE_INTEGER);
      const value = field!.getValue() as number;
      expect(value).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest2000
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_2000
     * @tc.desc    Verify setValue with negative zero to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableNumberField");
      expect(field !== undefined).assertTrue();
      const newValue: number = 0;
      field!.setValue(newValue);
      const value = field!.getValue() as number;
      expect(value).assertEqual(0);
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest2100
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_2100
     * @tc.desc    Verify setValue with empty string to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectStaticFieldSetValueTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      field!.setValue("");
      const value = field!.getValue() as string;
      expect(value).assertEqual("");
    });

    /**
     * @tc.name    ReflectStaticFieldSetValueTest2200
     * @tc.number  SUB_REFLECT_STATIC_FIELD_SET_VALUE_TEST_2200
     * @tc.desc    Verify setValue with long string to static field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectStaticFieldSetValueTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClassWithMutableStaticField>().getStaticField("mutableStringField");
      expect(field !== undefined).assertTrue();
      const longString = "a".repeat(1000);
      field!.setValue(longString);
      const value = field!.getValue() as string;
      expect(value.length).assertEqual(1000);
    });
  });
}
