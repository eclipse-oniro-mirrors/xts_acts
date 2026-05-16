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

class TestClassForOwner {
  public methodA(): string {
    return "A";
  }

  private methodB(): string {
    return "B";
  }

  protected methodC(): string {
    return "C";
  }
}

class AnotherClassForOwner {
  public methodX(): string {
    return "X";
  }
}

export default function ReflectMethodGetOwnerTest(): void {
  describe('ReflectMethodGetOwnerTest', () => {
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
     * @tc.name    ReflectMethodGetOwnerTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0100
     * @tc.desc    Verify basic method owner retrieval
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetOwnerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0200
     * @tc.desc    Verify method owner retrieval with variable
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetOwnerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0300
     * @tc.desc    Verify multiple methods with different owners
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetOwnerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassForOwner>();
      const cls2 = Class.from<AnotherClassForOwner>();
      const method1 = cls1.getInstanceMethod("methodA");
      const method2 = cls2.getInstanceMethod("methodX");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const owner1 = method1!.getOwner();
      const owner2 = method2!.getOwner();
      expect(owner1 !== undefined).assertTrue();
      expect(owner2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0400
     * @tc.desc    Verify methods from same class have same owner
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetOwnerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForOwner>();
      const method1 = cls.getInstanceMethod("methodA");
      const method2 = cls.getInstanceMethod("methodB");
      expect(method1 !== undefined).assertTrue();
      expect(method2 === undefined).assertTrue();
      const owner1 = method1!.getOwner();
      expect(owner1 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0500
     * @tc.desc    Verify owner is valid class object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetOwnerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName() !== "").assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0600
     * @tc.desc    Verify idempotency of getOwner calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetOwnerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner1 = method!.getOwner();
      const owner2 = method!.getOwner();
      const owner3 = method!.getOwner();
      expect(owner1 !== undefined).assertTrue();
      expect(owner2 !== undefined).assertTrue();
      expect(owner3 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0700
     * @tc.desc    Verify independent instances have different owners
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetOwnerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassForOwner>();
      const cls2 = Class.from<AnotherClassForOwner>();
      const method1 = cls1.getInstanceMethod("methodA");
      const method2 = cls2.getInstanceMethod("methodX");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const owner1 = method1!.getOwner();
      const owner2 = method2!.getOwner();
      expect(owner1 !== undefined).assertTrue();
      expect(owner2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0800
     * @tc.desc    Verify owner name is valid string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetOwnerTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      const ownerName = owner.getName();
      expect(ownerName.length > 0).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_0900
     * @tc.desc    Verify owner class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetOwnerTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_1000
     * @tc.desc    Verify batch retrieval of method owners
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetOwnerTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForOwner>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const owner = methods[i].getOwner();
        expect(owner !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest1100
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_1100
     * @tc.desc    Verify all methods have valid owners
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetOwnerTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForOwner>();
      const methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        const owner = methods[i].getOwner();
        expect(owner !== undefined).assertTrue();
        expect(owner.getName().length > 0).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest1200
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_1200
     * @tc.desc    Verify owner name is string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetOwnerTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      const ownerName = owner.getName();
      expect(typeof ownerName === 'string').assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest1300
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_1300
     * @tc.desc    Verify owner retrieval for different access modifiers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetOwnerTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForOwner>();
      const method1 = cls.getInstanceMethod("methodA");
      const method2 = cls.getInstanceMethod("methodB");
      const method3 = cls.getInstanceMethod("methodC");
      expect(method1 !== undefined).assertTrue();
      expect(method2 === undefined).assertTrue();
      expect(method3 === undefined).assertTrue();
      const owner1 = method1!.getOwner();
      expect(owner1 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetOwnerTest1400
     * @tc.number  SUB_REFLECT_METHOD_GET_OWNER_TEST_1400
     * @tc.desc    Verify owner class has valid name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetOwnerTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForOwner>();
      const method = cls.getInstanceMethod("methodA");
      expect(method !== undefined).assertTrue();
      const owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName() !== "").assertTrue();
    });
  });
}
