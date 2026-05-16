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

class NormalClass {
  public method(): void {}
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

export default function ReflectProxyIsProxyClassTest(): void {
  describe('ReflectProxyIsProxyClassTest', () => {
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
     * @tc.name    ReflectProxyIsProxyClassTest0100
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0100
     * @tc.desc    Verify proxy class returns true for isProxyClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('ReflectProxyIsProxyClassTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const proxyClass = Class.of(proxy);
      const isProxy = reflect.Proxy.isProxyClass(proxyClass);
      expect(isProxy).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0200
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0200
     * @tc.desc    Verify multiple proxy instances all return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyIsProxyClassTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler);
      const class1 = Class.of(proxy1);
      const class2 = Class.of(proxy2);
      expect(reflect.Proxy.isProxyClass(class1)).assertTrue();
      expect(reflect.Proxy.isProxyClass(class2)).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0300
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0300
     * @tc.desc    Verify idempotency: multiple calls return same result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyIsProxyClassTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy = reflect.Proxy.create(linker, interfaces, handler);
      const proxyClass = Class.of(proxy);
      const result1 = reflect.Proxy.isProxyClass(proxyClass);
      const result2 = reflect.Proxy.isProxyClass(proxyClass);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0400
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0400
     * @tc.desc    Verify large number of proxy instances all return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyIsProxyClassTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler = new TestInvocationHandler();
      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const count = 100;
      for (let i = 0; i < count; i++) {
        const proxy = reflect.Proxy.create(linker, interfaces, handler);
        const proxyClass = Class.of(proxy);
        expect(reflect.Proxy.isProxyClass(proxyClass)).assertTrue();
      }
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0500
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0500
     * @tc.desc    Verify proxy with different handler values all return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('ReflectProxyIsProxyClassTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const handler1 = new TestInvocationHandler();
      const handler2 = new TestInvocationHandler();
      const handler3 = new TestInvocationHandler();
      handler1.invokeCount = 0;
      handler2.invokeCount = Number.MAX_SAFE_INTEGER;
      handler3.invokeCount = -1;

      const linker = Class.from<TestInterfaceImpl>().getLinker();
      const interfaces: FixedArray<Class> = [Class.from<TestInterface>()];
      const proxy1 = reflect.Proxy.create(linker, interfaces, handler1);
      const proxy2 = reflect.Proxy.create(linker, interfaces, handler2);
      const proxy3 = reflect.Proxy.create(linker, interfaces, handler3);

      expect(reflect.Proxy.isProxyClass(Class.of(proxy1))).assertTrue();
      expect(reflect.Proxy.isProxyClass(Class.of(proxy2))).assertTrue();
      expect(reflect.Proxy.isProxyClass(Class.of(proxy3))).assertTrue();
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0600
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0600
     * @tc.desc    Verify normal class returns false for isProxyClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyIsProxyClassTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const normalClass = Class.from<NormalClass>();
      expect(reflect.Proxy.isProxyClass(normalClass)).assertFalse();
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0700
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0700
     * @tc.desc    Verify interface class returns false for isProxyClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ReflectProxyIsProxyClassTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(reflect.Proxy.isProxyClass(interfaceClass)).assertFalse();
    });

    /**
     * @tc.name    ReflectProxyIsProxyClassTest0800
     * @tc.number  SUB_REFLECT_PROXY_IS_PROXY_CLASS_TEST_0800
     * @tc.desc    Verify Proxy base class returns false for isProxyClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('ReflectProxyIsProxyClassTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const proxyBaseClass = Class.from<reflect.Proxy>();
      expect(reflect.Proxy.isProxyClass(proxyBaseClass)).assertFalse();
    });
  });
}
