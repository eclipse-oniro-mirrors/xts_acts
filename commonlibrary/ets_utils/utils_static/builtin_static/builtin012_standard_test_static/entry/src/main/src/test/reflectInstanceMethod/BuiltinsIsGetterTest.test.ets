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

class TestClassWithGetter {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }
}

class TestClassWithoutGetter {
  private _value: number = 0;

  set value(val: number) {
    this._value = val;
  }

  public normalMethod(): void {}
}

class TestClassWithMultipleGetters {
  private _name: string = "";
  private _age: number = 0;

  get name(): string {
    return this._name;
  }

  set name(val: string) {
    this._name = val;
  }

  get age(): number {
    return this._age;
  }

  set age(val: number) {
    this._age = val;
  }
}

export default function BuiltinsIsGetterTest(): void {
  describe('BuiltinsIsGetterTest', () => {
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
     * @tc.name    BuiltinsIsGetterTest0100
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0100
     * @tc.desc    Verify that isGetter() returns true for a getter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsGetterTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithGetter>();
      const getterMethod = cls.getInstanceMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0200
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0200
     * @tc.desc    Verify that isGetter() returns false for a setter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsGetterTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithGetter>();
      const setterMethod = cls.getInstanceMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0300
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0300
     * @tc.desc    Verify that isGetter() returns false for a normal method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsGetterTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithoutGetter>();
      const normalMethod = cls.getInstanceMethod("normalMethod");
      expect(normalMethod !== undefined).assertTrue();
      expect(normalMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0400
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0400
     * @tc.desc    Verify that isGetter() returns true for multiple getters in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsGetterTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleGetters>();
      const nameGetter = cls.getInstanceMethod("%%get-name");
      const ageGetter = cls.getInstanceMethod("%%get-age");
      expect(nameGetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0500
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0500
     * @tc.desc    Verify that isGetter() returns false for setters even when getters exist in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsGetterTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleGetters>();
      const nameSetter = cls.getInstanceMethod("%%set-name");
      const ageSetter = cls.getInstanceMethod("%%set-age");
      expect(nameSetter !== undefined).assertTrue();
      expect(ageSetter !== undefined).assertTrue();
      expect(nameSetter!.isGetter()).assertFalse();
      expect(ageSetter!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0600
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0600
     * @tc.desc    Verify that isGetter() returns false for a setter when no getter exists for that property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsGetterTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithoutGetter>();
      const setterMethod = cls.getInstanceMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0700
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0700
     * @tc.desc    Verify that isGetter() returns consistent results for the same getter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsGetterTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithGetter>();
      const getterMethod = cls.getInstanceMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0800
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0800
     * @tc.desc    Verify that isGetter() returns true when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsGetterTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithGetter>();
      const cls2 = Class.from<TestClassWithGetter>();
      const getter1 = cls1.getInstanceMethod("%%get-value");
      const getter2 = cls2.getInstanceMethod("%%get-value");
      expect(getter1 !== undefined).assertTrue();
      expect(getter2 !== undefined).assertTrue();
      expect(getter1!.isGetter()).assertTrue();
      expect(getter2!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest0900
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_0900
     * @tc.desc    Verify that two different getter methods are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsGetterTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleGetters>();
      const nameGetter = cls.getInstanceMethod("%%get-name");
      const ageGetter = cls.getInstanceMethod("%%get-age");
      expect(nameGetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
      expect(nameGetter!.getName() !== ageGetter!.getName()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1000
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1000
     * @tc.desc    Verify isGetter() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithGetter>();
      const getterMethod = cls.getInstanceMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(getterMethod!.isGetter()).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1100
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1100
     * @tc.desc    Verify that isGetter() returns correct result when comparing getter and setter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithGetter>();
      const getter = cls.getInstanceMethod("%%get-value");
      const setter = cls.getInstanceMethod("%%set-value");
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(getter!.isGetter() !== setter!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1200
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1200
     * @tc.desc    Verify that three methods (getter, setter, normal) do not affect each other's results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clsGetter = Class.from<TestClassWithGetter>();
      const clsNormal = Class.from<TestClassWithoutGetter>();
      const getter = clsGetter.getInstanceMethod("%%get-value");
      const setter = clsGetter.getInstanceMethod("%%set-value");
      const normal = clsNormal.getInstanceMethod("normalMethod");
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(normal !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(normal!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1300
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1300
     * @tc.desc    Verify that when checking multiple methods, only getters return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleGetters>();
      const methods = ["%%get-name", "%%set-name", "%%get-age", "%%set-age"];
      const expectedResults: boolean[] = [true, false, true, false];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getInstanceMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.isGetter()).assertEqual(expectedResults[i]);
      }
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1400
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1400
     * @tc.desc    Verify that isGetter() returns true for a getter retrieved from getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithGetter>();
      const methods = cls.getInstanceMethods();
      let getterFound: boolean = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "%%get-value") {
          expect(methods[i].isGetter()).assertTrue();
          getterFound = true;
          break;
        }
      }
      expect(getterFound).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsGetterTest1500
     * @tc.number  SUB_BUILTINS_IS_GETTER_TEST_1500
     * @tc.desc    Verify that modifying one method reference does not affect another's isGetter() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsGetterTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithGetter>();
      const getter1 = cls.getInstanceMethod("%%get-value");
      const getter2 = cls.getInstanceMethod("%%get-value");
      expect(getter1 !== undefined).assertTrue();
      expect(getter2 !== undefined).assertTrue();
      expect(getter1!.isGetter()).assertTrue();
      expect(getter2!.isGetter()).assertTrue();
    });
  });
}
