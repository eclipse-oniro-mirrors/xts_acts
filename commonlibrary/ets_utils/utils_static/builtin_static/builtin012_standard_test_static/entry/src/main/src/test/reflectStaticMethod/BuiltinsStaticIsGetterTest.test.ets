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

class TestClassWithStaticGetter {
  private static _value: number = 0;

  static get value(): number {
    return TestClassWithStaticGetter._value;
  }

  static set value(val: number) {
    TestClassWithStaticGetter._value = val;
  }
}

class TestClassWithoutStaticGetter {
  private static _value: number = 0;

  static set value(val: number) {
    TestClassWithoutStaticGetter._value = val;
  }

  static normalMethod(): void {}
}

class TestClassWithMultipleStaticGetters {
  private static _name: string = "";
  private static _age: number = 0;

  static get name(): string {
    return TestClassWithMultipleStaticGetters._name;
  }

  static set name(val: string) {
    TestClassWithMultipleStaticGetters._name = val;
  }

  static get age(): number {
    return TestClassWithMultipleStaticGetters._age;
  }

  static set age(val: number) {
    TestClassWithMultipleStaticGetters._age = val;
  }
}

export default function BuiltinsStaticIsGetterTest(): void {
  describe('BuiltinsStaticIsGetterTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0100
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0100
     * @tc.desc    Verify isGetter with static getter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsGetterTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const getterMethod = cls.getStaticMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0200
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0200
     * @tc.desc    Verify isGetter with static setter method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsGetterTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const setterMethod = cls.getStaticMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0300
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0300
     * @tc.desc    Verify isGetter with normal static method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsGetterTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithoutStaticGetter>();
      const normalMethod = cls.getStaticMethod("normalMethod");
      expect(normalMethod !== undefined).assertTrue();
      expect(normalMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0400
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0400
     * @tc.desc    Verify isGetter with multiple static getters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsGetterTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleStaticGetters>();
      const nameGetter = cls.getStaticMethod("%%get-name");
      const ageGetter = cls.getStaticMethod("%%get-age");
      expect(nameGetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0500
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0500
     * @tc.desc    Verify isGetter with multiple static setters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsGetterTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleStaticGetters>();
      const nameSetter = cls.getStaticMethod("%%set-name");
      const ageSetter = cls.getStaticMethod("%%set-age");
      expect(nameSetter !== undefined).assertTrue();
      expect(ageSetter !== undefined).assertTrue();
      expect(nameSetter!.isGetter()).assertFalse();
      expect(ageSetter!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0600
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0600
     * @tc.desc    Verify isGetter with static setter without getter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsGetterTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithoutStaticGetter>();
      const setterMethod = cls.getStaticMethod("%%set-value");
      expect(setterMethod !== undefined).assertTrue();
      expect(setterMethod!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0700
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0700
     * @tc.desc    Verify idempotency of isGetter calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsGetterTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const getterMethod = cls.getStaticMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
      expect(getterMethod!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0800
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0800
     * @tc.desc    Verify isGetter with same getter from different class instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsGetterTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithStaticGetter>();
      const cls2 = Class.from<TestClassWithStaticGetter>();
      const getter1 = cls1.getStaticMethod("%%get-value");
      const getter2 = cls2.getStaticMethod("%%get-value");
      expect(getter1 !== undefined).assertTrue();
      expect(getter2 !== undefined).assertTrue();
      expect(getter1!.isGetter()).assertTrue();
      expect(getter2!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest0900
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_0900
     * @tc.desc    Verify isGetter with different static getters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsGetterTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleStaticGetters>();
      const nameGetter = cls.getStaticMethod("%%get-name");
      const ageGetter = cls.getStaticMethod("%%get-age");
      expect(nameGetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
      expect(nameGetter!.getName() !== ageGetter!.getName()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest1000
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1000
     * @tc.desc    Verify isGetter with multiple repeated calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const getterMethod = cls.getStaticMethod("%%get-value");
      expect(getterMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(getterMethod!.isGetter()).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest1100
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1100
     * @tc.desc    Verify isGetter with static getter and setter together
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const getter = cls.getStaticMethod("%%get-value");
      const setter = cls.getStaticMethod("%%set-value");
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(getter!.isGetter() !== setter!.isGetter()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest1200
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1200
     * @tc.desc    Verify isGetter with getter, setter and normal static methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clsGetter = Class.from<TestClassWithStaticGetter>();
      const clsNormal = Class.from<TestClassWithoutStaticGetter>();
      const getter = clsGetter.getStaticMethod("%%get-value");
      const setter = clsGetter.getStaticMethod("%%set-value");
      const normal = clsNormal.getStaticMethod("normalMethod");
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(normal !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(normal!.isGetter()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest1300
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1300
     * @tc.desc    Verify isGetter with multiple static methods in loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticGetters>();
      const methods: string[] = ["%%get-name", "%%set-name", "%%get-age", "%%set-age"];
      const expectedResults: boolean[] = [true, false, true, false];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getStaticMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.isGetter()).assertEqual(expectedResults[i]);
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsGetterTest1400
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1400
     * @tc.desc    Verify isGetter by iterating all static methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const methods = cls.getStaticMethods();
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
     * @tc.name    BuiltinsStaticIsGetterTest1500
     * @tc.number  SUB_REFLECT_STATIC_METHOD_IS_GETTER_TEST_1500
     * @tc.desc    Verify isGetter with same static getter retrieved twice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsGetterTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticGetter>();
      const getter1 = cls.getStaticMethod("%%get-value");
      const getter2 = cls.getStaticMethod("%%get-value");
      expect(getter1 !== undefined).assertTrue();
      expect(getter2 !== undefined).assertTrue();
      expect(getter1!.isGetter()).assertTrue();
      expect(getter2!.isGetter()).assertTrue();
    });
  });
}
