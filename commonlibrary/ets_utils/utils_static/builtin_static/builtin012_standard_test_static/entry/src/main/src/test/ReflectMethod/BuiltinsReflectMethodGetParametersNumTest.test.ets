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

class TestClassForParamsNum {
  public noParams(): string {
    return "noParams";
  }

  public oneParam(a: number): number {
    return a;
  }

  public twoParams(a: number, b: string): string {
    return b + a;
  }

  public threeParams(a: number, b: string, c: boolean): boolean {
    return c;
  }

  public fiveParams(a: number, b: string, c: boolean, d: number, e: string): string {
    return e;
  }

  public tenParams(a: number, b: string, c: boolean, d: number, e: string, f: number, g: string, h: boolean, i: number, j: string): string {
    return j;
  }
}

export default function ReflectMethodGetParametersNumTest(): void {
  describe('ReflectMethodGetParametersNumTest', () => {
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
     * @tc.name    ReflectMethodGetParametersNumTest0100
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0100
     * @tc.desc    Verify zero parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParametersNumTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0200
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0200
     * @tc.desc    Verify one parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParametersNumTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("oneParam");
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0300
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0300
     * @tc.desc    Verify three parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodGetParametersNumTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0400
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0400
     * @tc.desc    Verify multiple parameter numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParametersNumTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method1 = cls.getInstanceMethod("noParams");
      const method2 = cls.getInstanceMethod("oneParam");
      const method3 = cls.getInstanceMethod("twoParams");
      const method4 = cls.getInstanceMethod("fiveParams");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method4 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(0);
      expect(method2!.getParametersNum()).assertEqual(1);
      expect(method3!.getParametersNum()).assertEqual(2);
      expect(method4!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0500
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0500
     * @tc.desc    Verify ten parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodGetParametersNumTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("tenParams");
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(10);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0600
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0600
     * @tc.desc    Verify idempotency of getParametersNum calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParametersNumTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("threeParams");
      expect(method !== undefined).assertTrue();
      const num1 = method!.getParametersNum();
      const num2 = method!.getParametersNum();
      const num3 = method!.getParametersNum();
      expect(num1).assertEqual(num2);
      expect(num2).assertEqual(num3);
      expect(num1).assertEqual(3);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0700
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0700
     * @tc.desc    Verify get parameters num from multiple methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParametersNumTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method1 = cls.getInstanceMethod("noParams");
      const method2 = cls.getInstanceMethod("oneParam");
      const method3 = cls.getInstanceMethod("fiveParams");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(0);
      expect(method2!.getParametersNum()).assertEqual(1);
      expect(method3!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0800
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0800
     * @tc.desc    Verify parameters num validation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParametersNumTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const num = method!.getParametersNum();
      expect(num >= 0).assertTrue();
      expect(Number.isInteger(num)).assertTrue();
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest0900
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_0900
     * @tc.desc    Verify parameters num range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParametersNumTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const expectedNums = [0, 1, 2, 3, 5, 10];
      const methodNames = ["noParams", "oneParam", "twoParams", "threeParams", "fiveParams", "tenParams"];
      for (let i = 0; i < methodNames.length; i++) {
        const method = cls.getInstanceMethod(methodNames[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.getParametersNum()).assertEqual(expectedNums[i]);
      }
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest1000
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_1000
     * @tc.desc    Verify batch get parameters num
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodGetParametersNumTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const num = methods[i].getParametersNum();
        expect(num >= 0).assertTrue();
        expect(Number.isInteger(num)).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest1100
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_1100
     * @tc.desc    Verify parameters num is non-negative
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParametersNumTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        const num = methods[i].getParametersNum();
        expect(num >= 0).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest1200
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_1200
     * @tc.desc    Verify parameters num is integer type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParametersNumTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        const num = methods[i].getParametersNum();
        expect(Number.isInteger(num)).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectMethodGetParametersNumTest1300
     * @tc.number  SUB_REFLECT_METHOD_GET_PARAMETERS_NUM_TEST_1300
     * @tc.desc    Verify zero parameters again
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodGetParametersNumTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForParamsNum>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });
  });
}
