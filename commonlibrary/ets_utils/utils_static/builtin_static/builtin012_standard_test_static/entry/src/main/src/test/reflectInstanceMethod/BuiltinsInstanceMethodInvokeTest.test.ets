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

class NumberProcessor {
  passthrough(n: number): number { return n; }
  multiplyByTwo(n: number): number { return n * 2; }
  isFiniteVal(n: number): boolean { return isFinite(n); }
}

class StringProcessor {
  passthrough(s: string): string { return s; }
  isEmpty(s: string): boolean { return s.length === 0; }
  append(a: string, b: string): string { return a + b; }
}

class BooleanProcessor {
  passthrough(b: boolean): boolean { return b; }
  negate(b: boolean): boolean { return !b; }
}

class MultiProcessor {
  process(n: number, s: string, b: boolean): string {
    return `${n}_${s}_${b}`;
  }
}

class ParentClass {
  describe(): string { return "parent"; }
}

class ChildClass extends ParentClass {
  greet(name: string): string { return `hello ${name}`; }
}

export default function BuiltinsInstanceMethodInvokeTest(): void {
  describe('BuiltinsInstanceMethodInvokeTest', () => {
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
     * @tc.name    BuiltinsInstanceMethodInvokeTest0100
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0100
     * @tc.desc    Verify that invoke with Number 0 returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodInvokeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = 0;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0200
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0200
     * @tc.desc    Verify that invoke with negative integer -1 returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodInvokeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = -1;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0300
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0300
     * @tc.desc    Verify that invoke with NaN returns NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodInvokeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = NaN;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0400
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0400
     * @tc.desc    Verify that invoke with Infinity returns Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodInvokeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = Infinity;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0500
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0500
     * @tc.desc    Verify that invoke with -Infinity returns -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = -Infinity;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0600
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0600
     * @tc.desc    Verify that invoke with MAX_SAFE_INTEGER returns correct extreme value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = Number.MAX_SAFE_INTEGER;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0700
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0700
     * @tc.desc    Verify that invoke with empty string returns true for isEmpty
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringProcessor();
      const method = Class.from<StringProcessor>().getInstanceMethod("isEmpty");
      let s: string = "";
      const args: FixedArray<Any> = [s];
      const result = method!.invoke(obj, args) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0800
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0800
     * @tc.desc    Verify that invoke with regular string returns original value for passthrough
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringProcessor();
      const method = Class.from<StringProcessor>().getInstanceMethod("passthrough");
      let s: string = "hello world";
      const args: FixedArray<Any> = [s];
      const result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest0900
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_0900
     * @tc.desc    Verify that invoke with string containing escape characters returns original value for passthrough
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringProcessor();
      const method = Class.from<StringProcessor>().getInstanceMethod("passthrough");
      let s: string = "line1\nline2\ttab";
      const args: FixedArray<Any> = [s];
      const result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1000
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1000
     * @tc.desc    Verify that invoke with Boolean true returns false for negate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanProcessor();
      const method = Class.from<BooleanProcessor>().getInstanceMethod("negate");
      const args: FixedArray<Any> = [true];
      const result = method!.invoke(obj, args) as boolean;
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1100
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1100
     * @tc.desc    Verify that invoke with Boolean false returns true for negate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanProcessor();
      const method = Class.from<BooleanProcessor>().getInstanceMethod("negate");
      const args: FixedArray<Any> = [false];
      const result = method!.invoke(obj, args) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1200
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1200
     * @tc.desc    Verify that invoke with Number + String + Boolean multi-type parameters returns correct result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new MultiProcessor();
      const method = Class.from<MultiProcessor>().getInstanceMethod("process");
      let n: number = 42;
      let s: string = "arkts";
      const args: FixedArray<Any> = [n, s, true];
      const result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("42_arkts_true");
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1300
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1300
     * @tc.desc    Verify that invoke with two String parameters returns correct concatenation for append
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new StringProcessor();
      const method = Class.from<StringProcessor>().getInstanceMethod("append");
      let a: string = "hello";
      let b: string = " world";
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1400
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1400
     * @tc.desc    Verify invoke idempotency: same Number parameter returns consistent result each time
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("multiplyByTwo");
      let n: number = 5;
      const args: FixedArray<Any> = [n];
      for (let i = 0; i < 5; i++) {
        const result = method!.invoke(obj, args) as number;
        expect(result).assertEqual(10);
      }
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1500
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1500
     * @tc.desc    Verify that invoke on child class method with String parameter returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new ChildClass();
      const method = Class.from<ChildClass>().getInstanceMethod("greet");
      let name: string = "ArkTS";
      const args: FixedArray<Any> = [name];
      const result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("hello ArkTS");
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1600
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1600
     * @tc.desc    Verify that isFiniteVal correctly identifies finite numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("isFiniteVal");

      let finiteNum: number = 42;
      const args1: FixedArray<Any> = [finiteNum];
      const result1 = method!.invoke(obj, args1) as boolean;
      expect(result1).assertTrue();

      let infiniteNum: number = Infinity;
      const args2: FixedArray<Any> = [infiniteNum];
      const result2 = method!.invoke(obj, args2) as boolean;
      expect(result2).assertFalse();

      let nanNum: number = NaN;
      const args3: FixedArray<Any> = [nanNum];
      const result3 = method!.invoke(obj, args3) as boolean;
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1700
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1700
     * @tc.desc    Verify that invoke with Number.MAX_VALUE returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = Number.MAX_VALUE;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1800
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1800
     * @tc.desc    Verify that invoke with Number.MIN_VALUE returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodInvokeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = Number.MIN_VALUE;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest1900
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_1900
     * @tc.desc    Verify that invoke with Number.MIN_SAFE_INTEGER returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = Number.MIN_SAFE_INTEGER;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest2000
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_2000
     * @tc.desc    Verify that invoke with negative zero returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("passthrough");
      let n: number = -0;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest2100
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_2100
     * @tc.desc    Verify that invoke with large number multiplication returns correct result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberProcessor();
      const method = Class.from<NumberProcessor>().getInstanceMethod("multiplyByTwo");
      let n: number = Number.MAX_SAFE_INTEGER;
      const args: FixedArray<Any> = [n];
      const result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER * 2);
    });

    /**
     * @tc.name    BuiltinsInstanceMethodInvokeTest2200
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_INVOKE_TEST_2200
     * @tc.desc    Verify that invoke with long string returns correct concatenation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodInvokeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new StringProcessor();
      const method = Class.from<StringProcessor>().getInstanceMethod("append");
      let a: string = "a".repeat(1000);
      let b: string = "";
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(obj, args) as string;
      expect(result.length).assertEqual(1000);
    });
  });
}
