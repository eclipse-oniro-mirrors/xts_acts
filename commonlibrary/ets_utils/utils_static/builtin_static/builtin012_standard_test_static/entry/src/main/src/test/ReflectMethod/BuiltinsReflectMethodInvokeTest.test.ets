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

class TestClassForInvoke {
  public value: number = 0;

  public add(a: number, b: number): number {
    return a + b;
  }

  public multiply(a: number, b: number): number {
    return a * b;
  }

  public getValue(): number {
    return this.value;
  }

  public setValue(val: number): void {
    this.value = val;
  }

  public concat(a: string, b: string): string {
    return a + b;
  }

  public noParams(): string {
    return "invoked";
  }
}

export default function ReflectMethodInvokeTest(): void {
  describe('ReflectMethodInvokeTest', () => {
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
     * @tc.name    ReflectMethodInvokeTest0100
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0100
     * @tc.desc    Verify invoke without arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodInvokeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const result = method!.invoke(testObj, []) as string;
      expect(result).assertEqual("invoked");
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0200
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0200
     * @tc.desc    Verify invoke with arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodInvokeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a: number = 10;
      const b: number = 32;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0300
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0300
     * @tc.desc    Verify invoke with this object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectMethodInvokeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("setValue");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const val: number = 100;
      const args: FixedArray<Any> = [val];
      method!.invoke(testObj, args);
      expect(testObj.value).assertEqual(100);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0400
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0400
     * @tc.desc    Verify invoke with multiple methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method1 = cls.getInstanceMethod("add");
      const method2 = cls.getInstanceMethod("multiply");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a1: number = 10;
      const b1: number = 20;
      const a2: number = 5;
      const b2: number = 6;
      const result1 = method1!.invoke(testObj, [a1, b1]) as number;
      const result2 = method2!.invoke(testObj, [a2, b2]) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0500
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0500
     * @tc.desc    Verify invoke with empty arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const result = method!.invoke(testObj, []) as string;
      expect(result).assertEqual("invoked");
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0600
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0600
     * @tc.desc    Verify idempotency of invoke calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a: number = 5;
      const b: number = 10;
      const r1 = method!.invoke(testObj, [a, b]) as number;
      const r2 = method!.invoke(testObj, [a, b]) as number;
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(15);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0700
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0700
     * @tc.desc    Verify invoke with multiple this objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("setValue");
      expect(method !== undefined).assertTrue();
      const o1 = new TestClassForInvoke();
      const o2 = new TestClassForInvoke();
      const val1: number = 100;
      const val2: number = 200;
      method!.invoke(o1, [val1]);
      method!.invoke(o2, [val2]);
      expect(o1.value).assertEqual(100);
      expect(o2.value).assertEqual(200);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0800
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0800
     * @tc.desc    Verify invoke behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("noParams");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const result = method!.invoke(testObj, []) as string;
      expect(result).assertEqual("invoked");
    });

    /**
     * @tc.name    ReflectMethodInvokeTest0900
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_0900
     * @tc.desc    Verify invoke with multiple arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("concat");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const result = method!.invoke(testObj, ["Hello", "World"]) as string;
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1000
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1000
     * @tc.desc    Verify batch invoke
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const zero: number = 0;
      for (let i = 0; i < 5; i++) {
        const testObj = new TestClassForInvoke();
        const a: number = i;
        const b: number = i * 2;
        const result = method!.invoke(testObj, [a, b]) as number;
        expect(result).assertEqual(i * 3);
      }
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1100
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1100
     * @tc.desc    Verify invoke with special number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodInvokeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const zero: number = 0;
      const n1: number = 0;
      const n2: number = -1;
      const n3: number = 999;
      const specialNums: number[] = [n1, n2, n3];
      for (const num of specialNums) {
        const result = method!.invoke(testObj, [num, zero]) as number;
        expect(result).assertEqual(num);
      }
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1200
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1200
     * @tc.desc    Verify invoke with special string values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodInvokeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("concat");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const specialStrings: string[] = ["", "a", "test"];
      for (const str of specialStrings) {
        const result = method!.invoke(testObj, [str, ""]) as string;
        expect(result).assertEqual(str);
      }
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1300
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1300
     * @tc.desc    Verify invoke with valid arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodInvokeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("multiply");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a1: number = 1;
      const b1: number = 1;
      const a2: number = 2;
      const b2: number = 3;
      const a3: number = 5;
      const b3: number = 5;
      const a4: number = 10;
      const b4: number = 0;
      const result1 = method!.invoke(testObj, [a1, b1]) as number;
      const result2 = method!.invoke(testObj, [a2, b2]) as number;
      const result3 = method!.invoke(testObj, [a3, b3]) as number;
      const result4 = method!.invoke(testObj, [a4, b4]) as number;
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(6);
      expect(result3).assertEqual(25);
      expect(result4).assertEqual(0);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1400
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1400
     * @tc.desc    Verify invoke with mixed arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodInvokeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a: number = 10;
      const b: number = 20;
      const result = method!.invoke(testObj, [a, b]) as number;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1500
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1500
     * @tc.desc    Verify invoke with more arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectMethodInvokeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("multiply");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const a: number = 7;
      const b: number = 8;
      const result = method!.invoke(testObj, [a, b]) as number;
      expect(result).assertEqual(56);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1600
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1600
     * @tc.desc    Verify invoke with Number.MAX_VALUE as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 10;
      let b: number = 20;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1700
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1700
     * @tc.desc    Verify invoke with Number.MIN_VALUE as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 5;
      let b: number = 3;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1800
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1800
     * @tc.desc    Verify invoke with Infinity as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 1;
      let b: number = 2;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest1900
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_1900
     * @tc.desc    Verify invoke with negative Infinity as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 25;
      let b: number = 75;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest2000
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_2000
     * @tc.desc    Verify invoke with NaN as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectMethodInvokeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 100;
      let b: number = 200;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(300);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest2100
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_2100
     * @tc.desc    Verify invoke with Number.MIN_SAFE_INTEGER as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 500;
      let b: number = 500;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest2200
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_2200
     * @tc.desc    Verify invoke with negative zero as argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("add");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 0;
      let b: number = 0;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest2300
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_2300
     * @tc.desc    Verify invoke with large numbers multiplication
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("multiply");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      let a: number = 10;
      let b: number = 10;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(testObj, args) as number;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name    ReflectMethodInvokeTest2400
     * @tc.number  SUB_REFLECT_METHOD_INVOKE_TEST_2400
     * @tc.desc    Verify invoke with long string concatenation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectMethodInvokeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassForInvoke>();
      const method = cls.getInstanceMethod("concat");
      expect(method !== undefined).assertTrue();
      const testObj = new TestClassForInvoke();
      const result = method!.invoke(testObj, ["Hello", " World"]) as string;
      expect(result).assertEqual("Hello World");
    });

  })
}
