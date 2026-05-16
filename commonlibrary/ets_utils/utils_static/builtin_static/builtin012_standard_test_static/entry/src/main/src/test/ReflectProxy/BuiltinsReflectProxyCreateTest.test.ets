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

export default function ReflectProxyCreateTest(): void {
  describe('ReflectProxyCreateTest', () => {
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
     * @tc.name    ReflectProxyCreateTest0100
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0100
     * @tc.desc    Verify proxy instance creation returns non-null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectProxyCreateTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      expect(proxy !== undefined).assertTrue();
      expect(proxy !== null).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyCreateTest0200
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0200
     * @tc.desc    Verify created proxy has correct type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectProxyCreateTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const proxyClass = Class.of(proxy);
      expect(proxyClass.isSubtypeOf(Class.from<reflect.Proxy>())).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyCreateTest0300
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0300
     * @tc.desc    Verify proxy contains correct handler
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectProxyCreateTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      expect(proxy.getHandler()).assertEqual(handler);
    });

    /**
     * @tc.name    ReflectProxyCreateTest0400
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0400
     * @tc.desc    Verify multiple proxy instances creation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler);
      expect(proxy1.getHandler()).assertEqual(proxy2.getHandler());
    });

    /**
     * @tc.name    ReflectProxyCreateTest0500
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0500
     * @tc.desc    Verify proxies with different handlers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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
     * @tc.name    ReflectProxyCreateTest0600
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0600
     * @tc.desc    Verify proxy instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyCreateTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
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
     * @tc.name    ReflectProxyCreateTest0700
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0700
     * @tc.desc    Verify getHandler returns consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyCreateTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const h1 = proxy.getHandler();
      const h2 = proxy.getHandler();
      expect(h1).assertEqual(h2);
      expect(h1).assertEqual(handler);
    });

    /**
     * @tc.name    ReflectProxyCreateTest0800
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0800
     * @tc.desc    Verify batch creation of proxy instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyCreateTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxies: reflect.Proxy[] = [];
      const count = 10;
      for (let i = 0; i < count; i++) {
        const proxy = reflect.Proxy.create(linker, interfaces, handler);
        proxies.push(proxy);
      }
      expect(proxies.length).assertEqual(count);
      for (let i = 0; i < count; i++) {
        expect(proxies[i].getHandler()).assertEqual(handler);
      }
    });

    /**
     * @tc.name    ReflectProxyCreateTest0900
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_0900
     * @tc.desc    Verify large number of proxy instances creation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyCreateTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
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
     * @tc.name    ReflectProxyCreateTest1000
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1000
     * @tc.desc    Verify proxy with maximum safe integer handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyCreateTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      const handler3 = new TestInvocationHandler();
      handler1.invokeCount = 0;
      handler2.invokeCount = Number.MAX_SAFE_INTEGER;
      handler3.invokeCount = 0;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2);
      const proxy3 = reflect.Proxy.create(linker, interfaces, handler3);

      expect(proxy1.getHandler()).assertEqual(handler1);
      expect(proxy2.getHandler()).assertEqual(handler2);
      expect(proxy3.getHandler()).assertEqual(handler3);
      expect((proxy1.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
      expect((proxy2.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((proxy3.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1100
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1100
     * @tc.desc    Verify proxy with Number.MAX_VALUE handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = Number.MAX_VALUE;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1200
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1200
     * @tc.desc    Verify proxy with Number.MIN_VALUE handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = Number.MIN_VALUE;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1300
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1300
     * @tc.desc    Verify proxy with Infinity handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = Infinity;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Infinity);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1400
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1400
     * @tc.desc    Verify proxy with negative Infinity handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = -Infinity;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(-Infinity);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1500
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1500
     * @tc.desc    Verify proxy with NaN handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = NaN;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      const count = (proxy.getHandler() as TestInvocationHandler).invokeCount;
      expect(Number.isNaN(count)).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyCreateTest1600
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1600
     * @tc.desc    Verify proxy with Number.MIN_SAFE_INTEGER handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyCreateTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = Number.MIN_SAFE_INTEGER;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1700
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1700
     * @tc.desc    Verify proxy with zero handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyCreateTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = 0;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
    });

    /**
     * @tc.name    ReflectProxyCreateTest1800
     * @tc.number  SUB_REFLECT_PROXY_CREATE_TEST_1800
     * @tc.desc    Verify proxy with negative zero handler value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyCreateTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      handler.invokeCount = -0;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);

      expect((proxy.getHandler() as TestInvocationHandler).invokeCount).assertEqual(0);
    });
  });
}
