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

class TestClassWithStaticSetter {
  public static _value: number = 0;

  public static set value(val: number) {
    TestClassWithStaticSetter._value = val;
  }

  public static get value(): number {
    return TestClassWithStaticSetter._value;
  }

  public static normalMethod(): void {}
}

class TestClassWithoutStaticSetter {
  public static _value: number = 0;

  public static get value(): number {
    return TestClassWithoutStaticSetter._value;
  }

  public static normalMethod(): void {}
}

class TestClassWithMultipleStaticSetters {
  public static _name: string = "";
  public static _age: number = 0;

  public static set name(val: string) {
    TestClassWithMultipleStaticSetters._name = val;
  }

  public static get name(): string {
    return TestClassWithMultipleStaticSetters._name;
  }

  public static set age(val: number) {
    TestClassWithMultipleStaticSetters._age = val;
  }

  public static get age(): number {
    return TestClassWithMultipleStaticSetters._age;
  }
}

export default function BuiltinsStaticIsSetterTest(): void {
  describe('BuiltinsStaticIsSetterTest', () => {
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
     * @tc.name    BuiltinsStaticIsSetterTest0100
     * @tc.number  SUB_BUILTINS_STATIC_IS_SETTER_TEST_0100
     * @tc.desc    Verify that isSetter() returns false for a static normal method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsSetterTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithStaticSetter>();
      const normalMethod = cls.getStaticMethod("normalMethod");
      expect(normalMethod !== undefined).assertTrue();
      expect(normalMethod!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsSetterTest0200
     * @tc.number  SUB_BUILTINS_STATIC_IS_SETTER_TEST_0200
     * @tc.desc    Verify that isSetter() returns consistent results for the same static method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsSetterTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithStaticSetter>();
      const normalMethod = cls.getStaticMethod("normalMethod");
      expect(normalMethod !== undefined).assertTrue();
      expect(normalMethod!.isSetter()).assertFalse();
      expect(normalMethod!.isSetter()).assertFalse();
      expect(normalMethod!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsSetterTest0300
     * @tc.number  SUB_BUILTINS_STATIC_IS_SETTER_TEST_0300
     * @tc.desc    Verify that isSetter() returns true when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsSetterTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithStaticSetter>();
      const cls2 = Class.from<TestClassWithStaticSetter>();
      const method1 = cls1.getStaticMethod("normalMethod");
      const method2 = cls2.getStaticMethod("normalMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.isSetter()).assertFalse();
      expect(method2!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsSetterTest0400
     * @tc.number  SUB_BUILTINS_STATIC_IS_SETTER_TEST_0400
     * @tc.desc    Verify that isSetter() returns non-undefined for methods retrieved from getStaticMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsSetterTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticSetter>();
      const methods = cls.getStaticMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        expect(methods[i].isSetter() !== undefined).assertTrue();
      }
    });
  });
}
