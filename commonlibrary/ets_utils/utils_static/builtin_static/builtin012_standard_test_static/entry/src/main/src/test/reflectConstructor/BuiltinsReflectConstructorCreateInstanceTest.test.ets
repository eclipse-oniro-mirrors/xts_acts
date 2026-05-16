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

class NumberClass {
  value: number = 0;
  constructor(n: number) {
    this.value = n;
  }
}

class StringClass {
  text: string = "";
  constructor(s: string) {
    this.text = s;
  }
}

class BooleanClass {
  flag: boolean = false;
  constructor(b: boolean) {
    this.flag = b;
  }
}

class MultiClass {
  n: number = 0;
  s: string = "";
  b: boolean = false;
  constructor(n: number, s: string, b: boolean) {
    this.n = n;
    this.s = s;
    this.b = b;
  }
}

class ChildNumberClass extends NumberClass {
  extra: string = "";
  constructor(n: number, extra: string) {
    super(n);
    this.extra = extra;
  }
}

export default function BuiltinsReflectConstructorCreateInstanceTest(): void {
  describe("BuiltinsReflectConstructorCreateInstanceTest", () => {
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
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0100
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0100
     * @tc.desc    Verify createInstance with basic integer parameter, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = 42;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(42);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0200
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0200
     * @tc.desc    Verify createInstance with 0, instance field value is 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = 0;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0300
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0300
     * @tc.desc    Verify createInstance with negative integer, instance field value is negative
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = -1;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0400
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0400
     * @tc.desc    Verify createInstance with NaN, instance field is NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = NaN;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(isNaN(instance.value)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0500
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0500
     * @tc.desc    Verify createInstance with Infinity, instance field is Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = Infinity;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(Infinity);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0600
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0600
     * @tc.desc    Verify createInstance with -Infinity, instance field is -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = -Infinity;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(-Infinity);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0700
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0700
     * @tc.desc    Verify createInstance with MAX_SAFE_INTEGER, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = Number.MAX_SAFE_INTEGER;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0800
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0800
     * @tc.desc    Verify createInstance with empty string, instance field is ""
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let s: string = "";
      const args: FixedArray<Any> = [s];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text).assertEqual("");
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest0900
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_0900
     * @tc.desc    Verify createInstance with normal string, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let s: string = "hello world";
      const args: FixedArray<Any> = [s];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text).assertEqual("hello world");
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1000
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1000
     * @tc.desc    Verify createInstance with string containing escape characters, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let s: string = "line1\nline2\ttab";
      const args: FixedArray<Any> = [s];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1100
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1100
     * @tc.desc    Verify createInstance with boolean true, instance field is true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<BooleanClass>().getConstructors()[0];
      const args: FixedArray<Any> = [true];
      const instance = ctor.createInstance(args) as BooleanClass;
      expect(instance.flag).assertTrue();
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1200
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1200
     * @tc.desc    Verify createInstance with boolean false, instance field is false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<BooleanClass>().getConstructors()[0];
      const args: FixedArray<Any> = [false];
      const instance = ctor.createInstance(args) as BooleanClass;
      expect(instance.flag).assertFalse();
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1300
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1300
     * @tc.desc    Verify createInstance with Number + String + Boolean multi-type parameters, each field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<MultiClass>().getConstructors()[0];
      let num: number = 99;
      let str: string = "arkts";
      const args: FixedArray<Any> = [num, str, true];
      const instance = ctor.createInstance(args) as MultiClass;
      expect(instance.n).assertEqual(99);
      expect(instance.s).assertEqual("arkts");
      expect(instance.b).assertTrue();
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1400
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1400
     * @tc.desc    Verify multiple createInstance calls with same constructor return independent instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n1: number = 10;
      let n2: number = 20;
      const inst1 = ctor.createInstance([n1] as FixedArray<Any>) as NumberClass;
      const inst2 = ctor.createInstance([n2] as FixedArray<Any>) as NumberClass;
      expect(inst1.value).assertEqual(10);
      expect(inst2.value).assertEqual(20);
      expect(inst1 !== inst2).assertTrue();
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1500
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1500
     * @tc.desc    Verify createInstance with subclass parameterized constructor, both parent and subclass fields are correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ctor = Class.from<ChildNumberClass>().getConstructors()[0];
      let n: number = 7;
      let extra: string = "child";
      const args: FixedArray<Any> = [n, extra];
      const instance = ctor.createInstance(args) as ChildNumberClass;
      expect(instance instanceof ChildNumberClass).assertTrue();
      expect(instance instanceof NumberClass).assertTrue();
      expect(instance.value).assertEqual(7);
      expect(instance.extra).assertEqual("child");
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1600
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1600
     * @tc.desc    Verify createInstance with MIN_SAFE_INTEGER, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = Number.MIN_SAFE_INTEGER;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1700
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1700
     * @tc.desc    Verify createInstance with very long string, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let longString: string = "a".repeat(10000);
      const args: FixedArray<Any> = [longString];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text.length).assertEqual(10000);
      expect(instance.text[0]).assertEqual("a");
      expect(instance.text[9999]).assertEqual("a");
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1800
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1800
     * @tc.desc    Verify createInstance with special Unicode characters, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let unicodeString: string = "Hello👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴世界";
      const args: FixedArray<Any> = [unicodeString];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text).assertEqual(unicodeString);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest1900
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_1900
     * @tc.desc    Verify createInstance with special characters string, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let specialString: string = "!@#$%^&*()_+-=[]{}|;':\",./<>?";
      const args: FixedArray<Any> = [specialString];
      const instance = ctor.createInstance(args) as StringClass;
      expect(instance.text).assertEqual(specialString);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest2000
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_2000
     * @tc.desc    Verify createInstance with Number.EPSILON, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = Number.EPSILON;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.name   BuiltinsReflectConstructorCreateInstanceTest2100
     * @tc.number SUB_BUILTINS_REFLECT_CONSTRUCTOR_CREATE_INSTANCE_TEST_2100
     * @tc.desc    Verify createInstance with Number.MIN_VALUE, instance field value is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorCreateInstanceTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let n: number = Number.MIN_VALUE;
      const args: FixedArray<Any> = [n];
      const instance = ctor.createInstance(args) as NumberClass;
      expect(instance.value).assertEqual(Number.MIN_VALUE);
    });
  });
}
