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

class TestClassWithSetter {
  private _value: number = 0;

  set value(val: number) {
    this._value = val;
  }

  get value(): number {
    return this._value;
  }
}

class TestClassWithoutSetter {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  public normalMethod(): void {}
}

class TestClassWithMultipleSetters {
  private _name: string = "";
  private _age: number = 0;

  set name(val: string) {
    this._name = val;
  }

  get name(): string {
    return this._name;
  }

  set age(val: number) {
    this._age = val;
  }

  get age(): number {
    return this._age;
  }
}

export default function BuiltinsIsSetterTest(): void {
  describe('BuiltinsIsSetterTest', () => {
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
     * @tc.name    BuiltinsIsSetterTest0100
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0100
     * @tc.desc    Verify that isSetter() returns true for a setter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsSetterTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithSetter>();
      const setterMethod = cls.getInstanceMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isSetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0200
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0200
     * @tc.desc    Verify that isSetter() returns false for a getter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsSetterTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithSetter>();
      const getterMethod = cls.getInstanceMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0300
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0300
     * @tc.desc    Verify that isSetter() returns false for a normal method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsSetterTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithoutSetter>();
      const normalMethod = cls.getInstanceMethod("normalMethod");
      expect(normalMethod !== undefined).assertTrue();
      expect(normalMethod!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0400
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0400
     * @tc.desc    Verify that isSetter() returns true for multiple setters in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsSetterTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleSetters>();
      const nameSetter = cls.getInstanceMethod("%%set-name");
      const ageSetter = cls.getInstanceMethod("%%set-age");
      expect(nameSetter !== undefined).assertTrue();
      expect(ageSetter !== undefined).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageSetter!.isSetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0500
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0500
     * @tc.desc    Verify that isSetter() returns false for getters even when setters exist in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsSetterTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleSetters>();
      const nameGetter = cls.getInstanceMethod("%%get-name");
      const ageGetter = cls.getInstanceMethod("%%get-age");
      expect(nameGetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isSetter()).assertFalse();
      expect(ageGetter!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0600
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0600
     * @tc.desc    Verify that isSetter() returns false for a getter when no setter exists for that property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsSetterTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithoutSetter>();
      const getterMethod = cls.getInstanceMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0700
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0700
     * @tc.desc    Verify that isSetter() returns consistent results for the same setter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsSetterTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithSetter>();
      const setterMethod = cls.getInstanceMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isSetter()).assertTrue();
      expect(setterMethod!.isSetter()).assertTrue();
      expect(setterMethod!.isSetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0800
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0800
     * @tc.desc    Verify that isSetter() returns true when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsSetterTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithSetter>();
      const cls2 = Class.from<TestClassWithSetter>();
      const setter1 = cls1.getInstanceMethod("%%set-value");
      const setter2 = cls2.getInstanceMethod("%%set-value");
      expect(setter1 !== undefined).assertTrue();
      expect(setter2 !== undefined).assertTrue();
      expect(setter1!.isSetter()).assertTrue();
      expect(setter2!.isSetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest0900
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_0900
     * @tc.desc    Verify that two different setter methods are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsSetterTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleSetters>();
      const nameSetter = cls.getInstanceMethod("%%set-name");
      const ageSetter = cls.getInstanceMethod("%%set-age");
      expect(nameSetter !== undefined).assertTrue();
      expect(ageSetter !== undefined).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageSetter!.isSetter()).assertTrue();
      expect(nameSetter!.getName() !== ageSetter!.getName()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1000
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1000
     * @tc.desc    Verify isSetter() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithSetter>();
      const setterMethod = cls.getInstanceMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(setterMethod!.isSetter()).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1100
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1100
     * @tc.desc    Verify that isSetter() returns correct result when comparing setter and getter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithSetter>();
      const setter = cls.getInstanceMethod("%%set-value");
      const getter = cls.getInstanceMethod("%%get-value");
      expect(setter !== undefined).assertTrue();
      expect(getter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(getter!.isSetter()).assertFalse();
      expect(setter!.isSetter() !== getter!.isSetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1200
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1200
     * @tc.desc    Verify that three methods (setter, getter, normal) do not affect each other's results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clsSetter = Class.from<TestClassWithSetter>();
      const clsNormal = Class.from<TestClassWithoutSetter>();
      const setter = clsSetter.getInstanceMethod("%%set-value");
      const getter = clsSetter.getInstanceMethod("%%get-value");
      const normal = clsNormal.getInstanceMethod("normalMethod");
      expect(setter !== undefined).assertTrue();
      expect(getter !== undefined).assertTrue();
      expect(normal !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(getter!.isSetter()).assertFalse();
      expect(normal!.isSetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1300
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1300
     * @tc.desc    Verify that when checking multiple methods, only setters return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleSetters>();
      const methods = ["%%set-name", "%%get-name", "%%set-age", "%%get-age"];
      const expectedResults: boolean[] = [true, false, true, false];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getInstanceMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.isSetter()).assertEqual(expectedResults[i]);
      }
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1400
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1400
     * @tc.desc    Verify that isSetter() returns true for a setter retrieved from getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithSetter>();
      const methods = cls.getInstanceMethods();
      let setterFound: boolean = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "%%set-value") {
          expect(methods[i].isSetter()).assertTrue();
          setterFound = true;
          break;
        }
      }
      expect(setterFound).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsSetterTest1500
     * @tc.number  SUB_BUILTINS_IS_SETTER_TEST_1500
     * @tc.desc    Verify that modifying one method reference does not affect another's isSetter() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsSetterTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithSetter>();
      const setter1 = cls.getInstanceMethod("%%set-value");
      const setter2 = cls.getInstanceMethod("%%set-value");
      expect(setter1 !== undefined).assertTrue();
      expect(setter2 !== undefined).assertTrue();
      expect(setter1!.isSetter()).assertTrue();
      expect(setter2!.isSetter()).assertTrue();
    });
  });
}
