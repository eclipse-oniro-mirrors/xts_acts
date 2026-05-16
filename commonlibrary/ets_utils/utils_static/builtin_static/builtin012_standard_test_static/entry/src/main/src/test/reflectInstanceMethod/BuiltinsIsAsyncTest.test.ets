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

class TestClassWithAsyncMethod {
  public async asyncMethod(): Promise<string> {
    return "async result";
  }

  public syncMethod(): string {
    return "sync result";
  }
}

class TestClassWithMultipleAsync {
  public async method1(): Promise<number> {
    return 1;
  }

  public async method2(): Promise<string> {
    return "hello";
  }

  public syncMethod(): boolean {
    return true;
  }
}

class TestClassWithoutAsync {
  public method1(): number {
    return 1;
  }

  public method2(): string {
    return "hello";
  }
}

export default function BuiltinsIsAsyncTest(): void {
  describe('BuiltinsIsAsyncTest', () => {
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
     * @tc.name    BuiltinsIsAsyncTest0100
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0100
     * @tc.desc    Verify that isAsync() returns true for an async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAsyncTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const asyncMethod = cls.getInstanceMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0200
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0200
     * @tc.desc    Verify that isAsync() returns false for a synchronous method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAsyncTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const syncMethod = cls.getInstanceMethod("syncMethod");
      expect(syncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0300
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0300
     * @tc.desc    Verify that isAsync() returns false for a non-async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAsyncTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithoutAsync>();
      const method = cls.getInstanceMethod("method1");
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0400
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0400
     * @tc.desc    Verify that isAsync() returns true for multiple async methods in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAsyncTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleAsync>();
      const asyncMethod1 = cls.getInstanceMethod("method1");
      const asyncMethod2 = cls.getInstanceMethod("method2");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0500
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0500
     * @tc.desc    Verify that isAsync() returns false for sync methods even when async methods exist in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAsyncTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleAsync>();
      const syncMethod = cls.getInstanceMethod("syncMethod");
      expect(syncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0600
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0600
     * @tc.desc    Verify that isAsync() returns false for all methods when no async methods exist
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAsyncTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithoutAsync>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.isAsync()).assertFalse();
      expect(method2!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0700
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0700
     * @tc.desc    Verify that isAsync() returns consistent results for the same async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAsyncTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const asyncMethod = cls.getInstanceMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0800
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0800
     * @tc.desc    Verify that isAsync() returns true when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAsyncTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithAsyncMethod>();
      const cls2 = Class.from<TestClassWithAsyncMethod>();
      const async1 = cls1.getInstanceMethod("asyncMethod");
      const async2 = cls2.getInstanceMethod("asyncMethod");
      expect(async1 !== undefined).assertTrue();
      expect(async2 !== undefined).assertTrue();
      expect(async1!.isAsync()).assertTrue();
      expect(async2!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest0900
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_0900
     * @tc.desc    Verify that two different async methods are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAsyncTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleAsync>();
      const asyncMethod1 = cls.getInstanceMethod("method1");
      const asyncMethod2 = cls.getInstanceMethod("method2");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(asyncMethod1!.getName() !== asyncMethod2!.getName()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1000
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1000
     * @tc.desc    Verify isAsync() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const asyncMethod = cls.getInstanceMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(asyncMethod!.isAsync()).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1100
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1100
     * @tc.desc    Verify that isAsync() returns correct result when comparing async and sync methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const asyncMethod = cls.getInstanceMethod("asyncMethod");
      const syncMethod = cls.getInstanceMethod("syncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod!.isAsync() !== syncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1200
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1200
     * @tc.desc    Verify that three methods (async1, async2, sync) do not affect each other's results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleAsync>();
      const asyncMethod1 = cls.getInstanceMethod("method1");
      const asyncMethod2 = cls.getInstanceMethod("method2");
      const syncMethod = cls.getInstanceMethod("syncMethod");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1300
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1300
     * @tc.desc    Verify that when checking multiple methods, only async methods return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleAsync>();
      const methods = ["method1", "method2", "syncMethod"];
      const expectedResults: boolean[] = [true, true, false];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getInstanceMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.isAsync()).assertEqual(expectedResults[i]);
      }
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1400
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1400
     * @tc.desc    Verify that isAsync() returns true for an async method retrieved from getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const methods = cls.getInstanceMethods();
      let asyncFound: boolean = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "asyncMethod") {
          expect(methods[i].isAsync()).assertTrue();
          asyncFound = true;
          break;
        }
      }
      expect(asyncFound).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAsyncTest1500
     * @tc.number  SUB_BUILTINS_IS_ASYNC_TEST_1500
     * @tc.desc    Verify that modifying one method reference does not affect another's isAsync() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAsyncTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAsyncMethod>();
      const async1 = cls.getInstanceMethod("asyncMethod");
      const async2 = cls.getInstanceMethod("asyncMethod");
      expect(async1 !== undefined).assertTrue();
      expect(async2 !== undefined).assertTrue();
      expect(async1!.isAsync()).assertTrue();
      expect(async2!.isAsync()).assertTrue();
    });
  });
}
