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

class TestClassWithProtectedMethod {
  protected protectedMethod(): string {
    return "protected";
  }

  public publicMethod(): string {
    return "public";
  }

  private privateMethod(): string {
    return "private";
  }
}

class TestClassWithMultipleProtected {
  protected method1(): number {
    return 1;
  }

  protected method2(): number {
    return 2;
  }

  public publicMethod(): number {
    return 3;
  }
}

class ChildClassWithProtected extends TestClassWithProtectedMethod {
  public childMethod(): string {
    return "child";
  }
}

export default function ReflectMethodIsProtectedTest(): void {
  describe('ReflectMethodIsProtectedTest', () => {
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
     * @tc.name    ReflectMethodIsProtectedTest0100
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0100
     * @tc.desc    Verify protected method cannot be retrieved via getInstanceMethod
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodIsProtectedTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const method = cls.getInstanceMethod("protectedMethod");
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0200
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0200
     * @tc.desc    Verify public method isProtected returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodIsProtectedTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const method = cls.getInstanceMethod("publicMethod");
      expect(method !== undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0300
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0300
     * @tc.desc    Verify private method cannot be retrieved via getInstanceMethod
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodIsProtectedTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const method = cls.getInstanceMethod("privateMethod");
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0400
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0400
     * @tc.desc    Verify getInstanceMethod only returns public methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodIsProtectedTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const publicMethod = cls.getInstanceMethod("publicMethod");
      const privateMethod = cls.getInstanceMethod("privateMethod");
      const protectedMethod = cls.getInstanceMethod("protectedMethod");
      expect(publicMethod !== undefined).assertTrue();
      expect(privateMethod === undefined).assertTrue();
      expect(protectedMethod === undefined).assertTrue();
      expect(publicMethod!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0500
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0500
     * @tc.desc    Verify idempotency of isProtected calls on public method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsProtectedTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const method = cls.getInstanceMethod("publicMethod");
      expect(method !== undefined).assertTrue();
      const result1 = method!.isProtected();
      const result2 = method!.isProtected();
      expect(result1).assertEqual(result2);
      expect(result1).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0600
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0600
     * @tc.desc    Verify independent instances do not affect each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsProtectedTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const publicMethod = cls.getInstanceMethod("publicMethod");
      expect(publicMethod !== undefined).assertTrue();
      expect(publicMethod!.isProtected()).assertFalse();
      expect(publicMethod!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0700
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0700
     * @tc.desc    Verify isProtected returns consistent result from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsProtectedTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassWithProtectedMethod>();
      const cls2 = Class.from<TestClassWithProtectedMethod>();
      const method1 = cls1.getInstanceMethod("publicMethod");
      const method2 = cls2.getInstanceMethod("publicMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.isProtected()).assertFalse();
      expect(method2!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0800
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0800
     * @tc.desc    Verify protected methods from different classes cannot be retrieved
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsProtectedTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassWithProtectedMethod>();
      const cls2 = Class.from<TestClassWithMultipleProtected>();
      const method1 = cls1.getInstanceMethod("protectedMethod");
      const method2 = cls2.getInstanceMethod("method1");
      expect(method1 === undefined).assertTrue();
      expect(method2 === undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest0900
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_0900
     * @tc.desc    Verify getInstanceMethod only retrieves public methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodIsProtectedTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const publicMethod = cls.getInstanceMethod("publicMethod");
      const privateMethod = cls.getInstanceMethod("privateMethod");
      const protectedMethod = cls.getInstanceMethod("protectedMethod");
      expect(publicMethod !== undefined).assertTrue();
      expect(privateMethod === undefined).assertTrue();
      expect(protectedMethod === undefined).assertTrue();
      expect(publicMethod!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest1000
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_1000
     * @tc.desc    Verify large number of method instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodIsProtectedTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const count = 100;
      for (let i = 0; i < count; i++) {
        const method = cls.getInstanceMethod("publicMethod");
        expect(method !== undefined).assertTrue();
        expect(method!.isProtected()).assertFalse();
      }
    });

    /**
     * @tc.name    ReflectMethodIsProtectedTest1100
     * @tc.number  SUB_REFLECT_METHOD_IS_PROTECTED_TEST_1100
     * @tc.desc    Verify multiple access modifier checks
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodIsProtectedTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassWithProtectedMethod>();
      const publicMethod = cls.getInstanceMethod("publicMethod");
      const protectedMethod = cls.getInstanceMethod("protectedMethod");
      expect(publicMethod !== undefined).assertTrue();
      expect(protectedMethod === undefined).assertTrue();
      expect(publicMethod!.isProtected()).assertFalse();
      expect(publicMethod!.isProtected()).assertFalse();
    });
  });
}
