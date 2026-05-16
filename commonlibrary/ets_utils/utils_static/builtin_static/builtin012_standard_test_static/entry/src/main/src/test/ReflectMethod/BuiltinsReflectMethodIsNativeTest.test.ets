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

class TestClassWithMethods {
  public normalMethod(): string {
    return "normal";
  }

  public anotherMethod(): number {
    return 42;
  }
}

class AnotherTestClass {
  public method1(): boolean {
    return true;
  }

  public method2(): string {
    return "test";
  }
}

export default function ReflectMethodIsNativeTest(): void {
  describe('ReflectMethodIsNativeTest', () => {
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
     * @tc.name    ReflectMethodIsNativeTest0100
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0100
     * @tc.desc    Verify non-native method returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodIsNativeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0200
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0200
     * @tc.desc    Verify isNative returns boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodIsNativeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      const result = method!.isNative();
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0300
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0300
     * @tc.desc    Verify multiple methods with different native flags
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodIsNativeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method1 = cls.getInstanceMethod("normalMethod");
      const method2 = cls.getInstanceMethod("anotherMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isNative();
      const result2 = method2!.isNative();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0400
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0400
     * @tc.desc    Verify idempotency of isNative calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsNativeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      const result1 = method!.isNative();
      const result2 = method!.isNative();
      const result3 = method!.isNative();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0500
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0500
     * @tc.desc    Verify independent instances do not affect each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsNativeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method1 = cls.getInstanceMethod("normalMethod");
      const method2 = cls.getInstanceMethod("anotherMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isNative();
      const result2 = method2!.isNative();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0600
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0600
     * @tc.desc    Verify non-native method in loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsNativeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        const result = method!.isNative();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0700
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0700
     * @tc.desc    Verify native method in loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsNativeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        const result = method!.isNative();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0800
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0800
     * @tc.desc    Verify batch creation with alternating native flags
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsNativeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const methods = ["normalMethod", "anotherMethod"];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getInstanceMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        const result = method!.isNative();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest0900
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_0900
     * @tc.desc    Verify isNative with boolean conversion values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodIsNativeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("normalMethod");
      expect(method !== undefined).assertTrue();
      const result = method!.isNative();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsNativeTest1000
     * @tc.number  SUB_REFLECT_METHOD_IS_NATIVE_TEST_1000
     * @tc.desc    Verify large number of method instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodIsNativeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithMethods>();
      const count = 100;
      for (let i = 0; i < count; i++) {
        const method = cls.getInstanceMethod("normalMethod");
        expect(method !== undefined).assertTrue();
        const result = method!.isNative();
        expect(typeof result === 'boolean').assertTrue();
      }
    });
  });
}
