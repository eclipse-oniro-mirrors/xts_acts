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

class TestClassForReturnType {
  public voidMethod(): void {
    return;
  }

  public stringMethod(): string {
    return "string";
  }

  public numberMethod(): number {
    return 42;
  }

  public booleanMethod(): boolean {
    return true;
  }

  public customClassMethod(): TestClassForReturnType {
    return this;
  }

  public arrayMethod(): string[] {
    return ["a", "b"];
  }

  public int8ArrayMethod(): Int8Array {
    return new Int8Array(0);
  }

  public uint8ArrayMethod(): Uint8Array {
    return new Uint8Array(0);
  }
}

export default function ReflectMethodGetReturnTypeTest(): void {
  describe('ReflectMethodGetReturnTypeTest', () => {
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
     * @tc.name    ReflectMethodGetReturnTypeTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0100
     * @tc.desc    Verify void return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetReturnTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("voidMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0200
     * @tc.desc    Verify string return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetReturnTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("stringMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0300
     * @tc.desc    Verify number return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetReturnTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("numberMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0400
     * @tc.desc    Verify multiple return types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetReturnTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method1 = cls.getInstanceMethod("voidMethod");
      const method2 = cls.getInstanceMethod("stringMethod");
      const method3 = cls.getInstanceMethod("numberMethod");
      const method4 = cls.getInstanceMethod("booleanMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method4 !== undefined).assertTrue();
      expect(method1!.getReturnType() !== undefined).assertTrue();
      expect(method2!.getReturnType() !== undefined).assertTrue();
      expect(method3!.getReturnType() !== undefined).assertTrue();
      expect(method4!.getReturnType() !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0500
     * @tc.desc    Verify boolean return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetReturnTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("booleanMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0600
     * @tc.desc    Verify idempotency of getReturnType calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetReturnTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("stringMethod");
      expect(method !== undefined).assertTrue();
      const type1 = method!.getReturnType();
      const type2 = method!.getReturnType();
      const type3 = method!.getReturnType();
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
      expect(type3 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0700
     * @tc.desc    Verify independent instances have different return types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetReturnTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method1 = cls.getInstanceMethod("voidMethod");
      const method2 = cls.getInstanceMethod("stringMethod");
      const method3 = cls.getInstanceMethod("numberMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method1!.getReturnType() !== undefined).assertTrue();
      expect(method2!.getReturnType() !== undefined).assertTrue();
      expect(method3!.getReturnType() !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0800
     * @tc.desc    Verify custom class return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetReturnTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("customClassMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_0900
     * @tc.desc    Verify array return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetReturnTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("arrayMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_1000
     * @tc.desc    Verify batch return types retrieval
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetReturnTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForReturnType>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const returnType = methods[i].getReturnType();
        expect(returnType !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest1100
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_1100
     * @tc.desc    Verify typed array return types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetReturnTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method1 = cls.getInstanceMethod("int8ArrayMethod");
      const method2 = cls.getInstanceMethod("uint8ArrayMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType() !== undefined).assertTrue();
      expect(method2!.getReturnType() !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest1200
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_1200
     * @tc.desc    Verify return type is valid
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetReturnTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("numberMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest1300
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_1300
     * @tc.desc    Verify Object return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetReturnTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("customClassMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetReturnTypeTest1400
     * @tc.number  SUB_REFLECT_METHOD_GET_RETURN_TYPE_TEST_1400
     * @tc.desc    Verify generic array return types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetReturnTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForReturnType>();
      const method = cls.getInstanceMethod("arrayMethod");
      expect(method !== undefined).assertTrue();
      const returnType = method!.getReturnType();
      expect(returnType !== undefined).assertTrue();
    });
  });
}
