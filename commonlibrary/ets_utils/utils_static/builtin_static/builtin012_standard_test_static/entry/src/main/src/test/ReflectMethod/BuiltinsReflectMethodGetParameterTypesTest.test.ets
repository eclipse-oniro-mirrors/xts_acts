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

class TestClassForParamTypes {
  public noParams(): string {
    return "noParams";
  }

  public oneStringParam(a: string): string {
    return a;
  }

  public threeParams(a: number, b: string, c: boolean): boolean {
    return c;
  }

  public sameTypeParams(a: number, b: number, c: number): number {
    return a + b + c;
  }

  public customClassParam(obj: TestClassForParamTypes, str: string): string {
    return str;
  }

  public arrayParam(arr: string[], num: number): number {
    return num;
  }
}

export default function ReflectMethodGetParameterTypesTest(): void {
  describe('ReflectMethodGetParameterTypesTest', () => {
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
     * @tc.name    ReflectMethodGetParameterTypesTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0100
     * @tc.desc    Verify empty parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParameterTypesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0200
     * @tc.desc    Verify single parameter type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParameterTypesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("oneStringParam");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0300
     * @tc.desc    Verify multiple parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParameterTypesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(3);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0400
     * @tc.desc    Verify multiple methods with different parameter counts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParameterTypesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method1 = cls.getInstanceMethod("noParams");
      const method2 = cls.getInstanceMethod("oneStringParam");
      const method3 = cls.getInstanceMethod("customClassParam");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method1!.getParameterTypes().length).assertEqual(0);
      expect(method2!.getParameterTypes().length).assertEqual(1);
      expect(method3!.getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0500
     * @tc.desc    Verify same parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParameterTypesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("sameTypeParams");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(3);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0600
     * @tc.desc    Verify idempotency of getParameterTypes calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      const paramTypes1 = method!.getParameterTypes();
      const paramTypes2 = method!.getParameterTypes();
      const paramTypes3 = method!.getParameterTypes();
      expect(paramTypes1.length).assertEqual(paramTypes2.length);
      expect(paramTypes2.length).assertEqual(paramTypes3.length);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0700
     * @tc.desc    Verify reverse order of parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method1 = cls.getInstanceMethod("oneStringParam");
      const method2 = cls.getInstanceMethod("customClassParam");
      const method3 = cls.getInstanceMethod("noParams");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method1!.getParameterTypes().length).assertEqual(1);
      expect(method2!.getParameterTypes().length).assertEqual(2);
      expect(method3!.getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0800
     * @tc.desc    Verify custom class parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("customClassParam");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_0900
     * @tc.desc    Verify array parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("arrayParam");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_1000
     * @tc.desc    Verify batch parameter types retrieval
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParameterTypesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const paramTypes = methods[i].getParameterTypes();
        expect(paramTypes.length >= 0).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest1100
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_1100
     * @tc.desc    Verify parameter types for all methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParameterTypesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        const paramTypes = methods[i].getParameterTypes();
        expect(paramTypes.length >= 0).assertTrue();
        for (let j = 0; j < paramTypes.length; j++) {
          expect(paramTypes[j] !== undefined).assertTrue();
        }
      }
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest1200
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_1200
     * @tc.desc    Verify complex parameter types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParameterTypesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("arrayParam");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.name    ReflectMethodGetParameterTypesTest1300
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETER_TYPES_TEST_1300
     * @tc.desc    Verify empty parameter types again
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParameterTypesTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamTypes>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

  });
}
