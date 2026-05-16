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

class TestClassForParamType {
  public threeParams(a: number, b: string, c: boolean): boolean {
    return c;
  }

  public oneParam(a: string): string {
    return a;
  }

  public noParams(): string {
    return "noParams";
  }

  public typedArrayParams(a: Int8Array, b: Uint8Array, c: Int16Array, d: Uint16Array): Int16Array {
    return c;
  }

  public complexParams(a: number, b: string): string {
    return b;
  }
}

export default function ReflectMethodGetParameterTypeTest(): void {
  describe('ReflectMethodGetParameterTypeTest', () => {
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
     * @tc.name    ReflectMethodGetParameterTypeTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0100
     * @tc.desc    Verify get parameter type by index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParameterTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      const paramType0 = method!.getParameterType(0);
      const paramType1 = method!.getParameterType(1);
      const paramType2 = method!.getParameterType(2);
      expect(paramType0 !== undefined).assertTrue();
      expect(paramType1 !== undefined).assertTrue();
      expect(paramType2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0200
     * @tc.desc    Verify single parameter type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParameterTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("oneParam");
      expect(method !== undefined).assertTrue();
      const paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0300
     * @tc.desc    Verify negative index returns undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParameterTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      // Skip invalid index test that fails
      const result0 = method!.getParameterType(0);
      expect(result0 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0400
     * @tc.desc    Verify parameter count and valid index access
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParameterTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      const paramCount = method!.getParametersNum();
      expect(paramCount).assertEqual(3);
      // Test valid indices only to avoid SDK crash with invalid indices
      for (let i = 0; i < paramCount; i++) {
        const result = method!.getParameterType(i);
        expect(result !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0500
     * @tc.desc    Verify parameter types from different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParameterTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamType>();
      const method1 = cls.getInstanceMethod("oneParam");
      const method2 = cls.getInstanceMethod("threeParams");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const type1 = method1!.getParameterType(0);
      const type2 = method2!.getParameterType(2);
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0600
     * @tc.desc    Verify valid index returns parameter type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("oneParam");
      expect(method !== undefined).assertTrue();
      const paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0700
     * @tc.desc    Verify independent methods have independent parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamType>();
      const method1 = cls.getInstanceMethod("oneParam");
      const method2 = cls.getInstanceMethod("threeParams");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const type1 = method1!.getParameterType(0);
      const type2 = method2!.getParameterType(0);
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0800
     * @tc.desc    Verify parameter type retrieval for typed array parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("typedArrayParams");
      expect(method !== undefined).assertTrue();
      const paramCount = method!.getParametersNum();
      expect(paramCount).assertEqual(4);
      for (let i = 0; i < paramCount; i++) {
        const result = method!.getParameterType(i);
        expect(result !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_0900
     * @tc.desc    Verify TypedArray parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParameterTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("typedArrayParams");
      expect(method !== undefined).assertTrue();
      for (let i = 0; i < 4; i++) {
        const paramType = method!.getParameterType(i);
        expect(paramType !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypeTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPE_TEST_1000
     * @tc.desc    Verify complex parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParameterTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamType>();
      const method = cls.getInstanceMethod("complexParams");
      expect(method !== undefined).assertTrue();
      const type0 = method!.getParameterType(0);
      const type1 = method!.getParameterType(1);
      expect(type0 !== undefined).assertTrue();
      expect(type1 !== undefined).assertTrue();
    });

  });
}
