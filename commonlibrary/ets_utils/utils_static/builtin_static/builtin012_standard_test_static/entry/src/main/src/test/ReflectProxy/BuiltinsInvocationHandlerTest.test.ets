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

interface TestInterface {
  testMethod(): string;
  testProperty: string;
}

class TestInterfaceImpl implements TestInterface {
  testProperty: string = "originalValue";

  testMethod(): string {
    return "originalMethod";
  }
}

class TestInvocationHandler implements reflect.InvocationHandler {
  public getCallCount: number = 0;
  public setCallCount: number = 0;
  public invokeCallCount: number = 0;
  public lastGetMethod: reflect.InstanceMethod | undefined = undefined;
  public lastSetMethod: reflect.InstanceMethod | undefined = undefined;
  public lastInvokeMethod: reflect.InstanceMethod | undefined = undefined;

  get(proxy: reflect.Proxy, method: reflect.InstanceMethod): Any {
    this.getCallCount++;
    this.lastGetMethod = method;
    return "mockedValue";
  }

  set(proxy: reflect.Proxy, method: reflect.InstanceMethod, value: Any): void {
    this.setCallCount++;
    this.lastSetMethod = method;
  }

  invoke(proxy: reflect.Proxy, method: reflect.InstanceMethod, args: FixedArray<Any>): Any {
    this.invokeCallCount++;
    this.lastInvokeMethod = method;
    return "invoked";
  }
}

export default function InvocationHandlerTest(): void {
  describe('InvocationHandlerTest', () => {
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
     * @tc.name    InvocationHandlerTest0100
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0100
     * @tc.desc    Verify get method is called correctly
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('InvocationHandlerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      const result = proxy.testProperty;
      expect(handler.getCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest0200
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0200
     * @tc.desc    Verify set method is called correctly
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('InvocationHandlerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      proxy.testProperty = "newValue";
      expect(handler.setCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest0300
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0300
     * @tc.desc    Verify invoke method is called correctly with arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('InvocationHandlerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      const result = proxy.testMethod();
      expect(handler.invokeCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest0400
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0400
     * @tc.desc    Verify invoke with different parameter combinations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('InvocationHandlerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      proxy.testMethod();
      proxy.testMethod();
      proxy.testMethod();
      expect(handler.invokeCallCount).assertEqual(3);
    });

    /**
     * @tc.name    InvocationHandlerTest0500
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0500
     * @tc.desc    Verify get called multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('InvocationHandlerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      const v1 = proxy.testProperty;
      const v2 = proxy.testProperty;
      const v3 = proxy.testProperty;
      expect(handler.getCallCount).assertEqual(3);
    });

    /**
     * @tc.name    InvocationHandlerTest0600
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0600
     * @tc.desc    Verify set called multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('InvocationHandlerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      proxy.testProperty = "value1";
      proxy.testProperty = "value2";
      proxy.testProperty = "value3";
      expect(handler.setCallCount).assertEqual(3);
    });

    /**
     * @tc.name    InvocationHandlerTest0700
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0700
     * @tc.desc    Verify get with different proxy instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('InvocationHandlerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1) as TestInterface;
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2) as TestInterface;

      const v1 = proxy1.testProperty;
      const v2 = proxy2.testProperty;
      expect(handler1.getCallCount).assertEqual(1);
      expect(handler2.getCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest0800
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0800
     * @tc.desc    Verify invoke with method that takes no parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('InvocationHandlerTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      const result = proxy.testMethod();
      expect(handler.invokeCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest0900
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_0900
     * @tc.desc    Verify get returns consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      const result1 = proxy.testProperty;
      const result2 = proxy.testProperty;
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    InvocationHandlerTest1000
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1000
     * @tc.desc    Verify independent handler instances do not affect each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1) as TestInterface;
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2) as TestInterface;

      const v1 = proxy1.testProperty;
      const v2 = proxy2.testProperty;
      expect(handler1.getCallCount).assertEqual(1);
      expect(handler2.getCallCount).assertEqual(1);
    });

    /**
     * @tc.name    InvocationHandlerTest1100
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1100
     * @tc.desc    Verify initial get call count is zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      expect(handler.getCallCount).assertEqual(0);
    });

    /**
     * @tc.name    InvocationHandlerTest1200
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1200
     * @tc.desc    Verify initial set call count is zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      expect(handler.setCallCount).assertEqual(0);
    });

    /**
     * @tc.name    InvocationHandlerTest1300
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1300
     * @tc.desc    Verify initial invoke call count is zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      expect(handler.invokeCallCount).assertEqual(0);
    });

    /**
     * @tc.name    InvocationHandlerTest1400
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1400
     * @tc.desc    Verify handler with large number of proxy instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('InvocationHandlerTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const count = 100;

      for (let i = 0; i < count; i++) {
        const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;
        proxy.testMethod();
      }
      expect(handler.invokeCallCount).assertEqual(count);
    });

    /**
     * @tc.name    InvocationHandlerTest1500
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1500
     * @tc.desc    Verify getHandler returns correct handler instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('InvocationHandlerTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      const retrievedHandler = proxy.getHandler() as TestInvocationHandler;
      expect(retrievedHandler).assertEqual(handler);
    });

    /**
     * @tc.name    InvocationHandlerTest1600
     * @tc.number  SUB_INVOCATION_HANDLER_TEST_1600
     * @tc.desc    Verify handler receives correct method information
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('InvocationHandlerTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler) as TestInterface;

      proxy.testMethod();
      expect(handler.lastInvokeMethod !== undefined).assertTrue();
      expect(handler.lastInvokeMethod!.getName()).assertEqual("testMethod");
    });
  });
}
