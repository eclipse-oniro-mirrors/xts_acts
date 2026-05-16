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
  public publicMethod(): string {
    return "public";
  }

  private privateMethod(): string {
    return "private";
  }

  protected protectedMethod(): string {
    return "protected";
  }

  public anotherMethod(): number {
    return 42;
  }
}

class AnotherClassWithMethods {
  public methodA(): string {
    return "A";
  }

  public methodB(): string {
    return "B";
  }
}

export default function ReflectMethodGetNameTest(): void {
  describe('ReflectMethodGetNameTest', () => {
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
     * @tc.name    ReflectMethodGetNameTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0100
     * @tc.desc    Verify getName for public method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetNameTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("publicMethod");
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual("publicMethod");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0200
     * @tc.desc    Verify getName for anotherMethod
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetNameTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("anotherMethod");
      expect(method !== undefined).assertTrue();
      const name = method!.getName();
      expect(name).assertEqual("anotherMethod");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0300
     * @tc.desc    Verify getName for public, private and protected methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetNameTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method1 = cls.getInstanceMethod("publicMethod");
      const method2 = cls.getInstanceMethod("privateMethod");
      const method3 = cls.getInstanceMethod("protectedMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 === undefined).assertTrue();
      expect(method3 === undefined).assertTrue();
      expect(method1!.getName()).assertEqual("publicMethod");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0400
     * @tc.desc    Verify getName for all instance methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetNameTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMethods>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        expect(methods[i].getName().length > 0).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0500
     * @tc.desc    Verify getName for private method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetNameTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("privateMethod");
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0600
     * @tc.desc    Verify getName returns the same value for multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetNameTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("publicMethod");
      expect(method !== undefined).assertTrue();
      const name1 = method!.getName();
      const name2 = method!.getName();
      const name3 = method!.getName();
      expect(name1).assertEqual(name2);
      expect(name2).assertEqual(name3);
      expect(name1).assertEqual("publicMethod");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0700
     * @tc.desc    Verify getName for methods in another class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetNameTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<AnotherClassWithMethods>();
      const method1 = cls.getInstanceMethod("methodA");
      const method2 = cls.getInstanceMethod("methodB");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual("methodA");
      expect(method2!.getName()).assertEqual("methodB");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0800
     * @tc.desc    Verify getName for method returning number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetNameTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("anotherMethod");
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual("anotherMethod");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_0900
     * @tc.desc    Verify getName for protected method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetNameTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("protectedMethod");
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetNameTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_1000
     * @tc.desc    Verify getAllInstanceMethods includes all methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetNameTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMethods>();
      const methods = cls.getInstanceMethods();
      expect(methods.length >= 2).assertTrue();
      const names: string[] = [];
      for (let i = 0; i < methods.length; i++) {
        names.push(methods[i].getName());
      }
      expect(names.includes("publicMethod")).assertTrue();
      expect(names.includes("anotherMethod")).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetNameTest1100
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_1100
     * @tc.desc    Verify getName returns non-empty string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetNameTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithMethods>();
      const methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        const name = methods[i].getName();
        expect(name.length > 0).assertTrue();
        expect(typeof name === 'string').assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetNameTest1200
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_1200
     * @tc.desc    Verify getName for methods from different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetNameTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls1 = Class.from<TestClassWithMethods>();
      const cls2 = Class.from<AnotherClassWithMethods>();
      const method1 = cls1.getInstanceMethod("publicMethod");
      const method2 = cls2.getInstanceMethod("methodA");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual("publicMethod");
      expect(method2!.getName()).assertEqual("methodA");
    });

    /**
     * @tc.name    ReflectMethodGetNameTest1300
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_1300
     * @tc.desc    Verify getName returns non-empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetNameTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithMethods>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const name = methods[i].getName();
        expect(name !== "").assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetNameTest1400
     * @tc.number  SUB_REFLECT_METHOD_GET_NAME_TEST_1400
     * @tc.desc    Verify getName returns valid string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetNameTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithMethods>();
      const method = cls.getInstanceMethod("publicMethod");
      expect(method !== undefined).assertTrue();
      const name = method!.getName();
      expect(typeof name === 'string').assertTrue();
      expect(name.length > 0).assertTrue();
    });
  });
}
