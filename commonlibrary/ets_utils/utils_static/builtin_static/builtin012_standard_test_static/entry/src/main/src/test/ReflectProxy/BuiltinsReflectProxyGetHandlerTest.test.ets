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
  public invokeCount: number = 0;

  get(proxy: reflect.Proxy, method: reflect.InstanceMethod): Any {
    return "mockedValue";
  }

  set(proxy: reflect.Proxy, method: reflect.InstanceMethod, value: Any): void {
  }

  invoke(proxy: reflect.Proxy, method: reflect.InstanceMethod, args: FixedArray<Any>): Any {
    this.invokeCount++;
    return "invoked";
  }
}

export default function ReflectProxyGetHandlerTest(): void {
  describe('ReflectProxyGetHandlerTest', () => {
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
     * @tc.name    ReflectProxyGetHandlerTest0100
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0100
     * @tc.desc    Verify getHandler returns correct handler
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectProxyGetHandlerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const retrievedHandler = proxy.getHandler();
      expect(retrievedHandler).assertEqual(handler);
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0200
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0200
     * @tc.desc    Verify different proxies return their respective handlers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyGetHandlerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      handler1.invokeCount = 0;
      handler2.invokeCount = 1;
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2);
      expect(proxy1.getHandler()).assertEqual(handler1);
      expect(proxy2.getHandler()).assertEqual(handler2);
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0300
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0300
     * @tc.desc    Verify multiple calls to getHandler return same instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyGetHandlerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const retrievedHandler1 = proxy.getHandler();
      const retrievedHandler2 = proxy.getHandler();
      expect(retrievedHandler1).assertEqual(retrievedHandler2);
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0400
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0400
     * @tc.desc    Verify handlers of different proxies do not affect each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyGetHandlerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      handler1.invokeCount = 0;
      handler2.invokeCount = 0;
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2);
      handler1.invokeCount = 100;
      expect((proxy1.getHandler() as TestInvocationHandler).invokeCount).assertEqual(100);
      expect((proxy2.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0500
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0500
     * @tc.desc    Verify reference consistency: return updated value after modifying handler property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyGetHandlerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
      handler.invokeCount = 100;
      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(100);
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0600
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0600
     * @tc.desc    Verify handler retrieval for large number of proxy instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyGetHandlerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const proxies: reflect.Proxy[] = [];
      const handlers: TestInvocationHandler[] = [];
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const count = 100;
      for (let i = 0; i < count; i++) {
        const handler = new TestInvocationHandler();
        handler.invokeCount = i;
        handlers.push(handler);
        const proxy = reflect.Proxy.create(linker, interfaces, handler);
        proxies.push(proxy);
      }
      for (let i = 0; i < count; i++) {
        expect(proxies[i].getHandler()).assertEqual(handlers[i]);
        expect((proxies[i].getHandler() as TestInvocationHandler).invokeCount).assertEqual(i);
      }
    });

    /**
     * @tc.name    ReflectProxyGetHandlerTest0700
     * @tc.number  SUB_REFLECT_PROXY_GET_HANDLER_TEST_0700
     * @tc.desc    Verify boundary values for handler properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyGetHandlerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      const handler3 = new TestInvocationHandler();
      handler1.invokeCount = Number.MAX_SAFE_INTEGER;
      handler2.invokeCount = 0;
      handler3.invokeCount = -1;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2);
      const proxy3 = reflect.Proxy.create(linker, interfaces, handler3);

      expect((proxy1.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((proxy2.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
      expect((proxy3.getHandler() as TestInvocationHandler).invokeCount).assertEqual(-1);
    });
  });
}
