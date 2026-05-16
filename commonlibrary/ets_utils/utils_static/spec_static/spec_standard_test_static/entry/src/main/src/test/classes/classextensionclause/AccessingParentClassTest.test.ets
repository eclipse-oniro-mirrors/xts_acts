/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Base {
  protected value: boolean[];
  constructor() {
    this.value = [true, false, true];
  }
}

let check_value: boolean;

class Sub extends Base {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value = this.value[0];
  }
}

class Base1 {
  protected readonly value: boolean[];
  constructor() {
    this.value = [true, false, true];
  }
}

let check_value1: boolean;

class Sub1 extends Base1 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value1 = this.value[0];
  }
}

class User {
  name: string;
  constructor() {
    this.name = "test_name";
  }
}

class Base2 {
  protected value: User[];
  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value2: User | undefined;

class Sub2 extends Base2 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value2 = this.value[0];
  }
}

class Base3 {
  protected readonly value: User
  constructor() {
    this.value = new User();
  }
}

let check_value3: User | undefined;

class Sub3 extends Base3 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value3 = this.value;
  }
}

const date = new Date(2023, 10, 1);

class Base4 {
  protected value: Date;
  constructor() {
    this.value = date;
  }
}

let check_value4: Date | undefined;

class Sub4 extends Base4 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value4 = this.value;
  }
}

class Base5 {
  protected readonly value: Date;
  constructor() {
    this.value = date;
  }
}

let check_value5: Date | undefined;

class Sub5 extends Base5 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value5 = this.value;
  }
}

class Base6 {
  public value: int;
  constructor() {
    this.value = 1;
  }

  protected changeMembers(): void {
    this.value = 2;
  }
}

class Sub6 extends Base6 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base7 {
  protected value: int;
  constructor() {
    this.value = 10;
  }
}

let check_value6: int;

class Sub7 extends Base7 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value6 = this.value;
  }
}

class Base8 {
  protected readonly value: int;
  constructor() {
    this.value = 10;
  }
}

let check_value7: int;

class Sub8 extends Base8 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value7 = this.value;
  }
}

class Base9 {
  protected value: null;
  constructor() {
    this.value = null;
  }
}

let check_value8: null;

class Sub9 extends Base9 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value8 = this.value;
  }
}

class Base10 {
  protected readonly value: null;
  constructor() {
    this.value = null;
  }
}

let check_value9: null;

class Sub10 extends Base10 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value9 = this.value;
  }
}

class Base11 {
  protected value: number;
  constructor() {
    this.value = 10;
  }
}

let check_value10: number;

class Sub11 extends Base11 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value10 = this.value;
  }
}

class Base12 {
  protected readonly value: number;
  constructor() {
    this.value = 10;
  }
}

let check_value11: number;

class Sub12 extends Base12 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value11 = this.value;
  }
}

class Base13 {
  protected value: string;
  constructor() {
    this.value = "hello,world";
  }
}

let check_value12: string | undefined;

class Sub13 extends Base13 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value12 = this.value;
  }
}

class Base14 {
  protected readonly value: string;
  constructor() {
    this.value = "hello,world";
  }
}

let check_value13: string | undefined;

class Sub14 extends Base14 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value13 = this.value;
  }
}

class Base15 {
  protected value: undefined;
  constructor() {
    this.value = undefined;
  }
}

let check_value14: undefined;

class Sub15 extends Base15 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value14 = this.value;
  }
}

class Base16 {
  protected readonly value: undefined;
  constructor() {
    this.value = undefined;
  }
}

let check_value15: undefined;

class Sub16 extends Base16 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value15 = this.value;
  }
}

class Base17 {
  public value: boolean[];
  constructor() {
    this.value = [true, false, true];
  }
}

let check_value16: boolean;

class Sub17 extends Base17 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value16 = this.value[0];
  }
}

class Base18 {
  public readonly value: boolean[];
  constructor() {
    this.value = [true, false, true];
  }
}

let check_value17: boolean;

class Sub18 extends Base18 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value17 = this.value[0];
  }
}

class Base19 {
  public value: User[];
  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value18: User | undefined;

class Sub19 extends Base19 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value18 = this.value[0];
  }
}

class Base20 {
  public readonly value: User[];
  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value19: User | undefined;

class Sub20 extends Base20 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value19 = this.value[0];
  }
}

class Base21 {
  public value: Date[];
  constructor() {
    this.value = [date, date];
  }
}

let check_value20: Date | undefined;

class Sub21 extends Base21 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value20 = this.value[0];
  }
}

class Base22 {
  public readonly value: Date[];
  constructor() {
    this.value = [date, date];
  }
}

let check_value21: Date | undefined;

class Sub22 extends Base22 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value21 = this.value[0];
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Base23 {
  public value: SomeInterface[];
  constructor() {
    this.value = [obj1, obj2];
  }
}

let check_value22: SomeInterface | undefined;

class Sub23 extends Base23 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value22 = this.value[0];
  }
}

class Base24 {
  public readonly value: SomeInterface[];
  constructor() {
    this.value = [obj1, obj2];
  }
}

let check_value23: SomeInterface | undefined;

class Sub24 extends Base24 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value23 = this.value[0];
  }
}

class Base25 {
  public value: number[];
  constructor() {
    this.value = [1, 2, 3];
  }
}

let check_value24: number;

class Sub25 extends Base25 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value24 = this.value[0];
  }
}

class Base26 {
  public readonly value: number[];
  constructor() {
    this.value = [1, 2, 3];
  }
}

let check_value25: number;

class Sub26 extends Base26 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value25 = this.value[0];
  }
}

class Base27 {
  public value: string[];
  constructor() {
    this.value = ["a", "b", "c"];
  }
}

let check_value26: string | undefined;

class Sub27 extends Base27 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value26 = this.value[0];
  }
}

class Base28 {
  public readonly value: string[];
  constructor() {
    this.value = ["a", "b", "c"];
  }
}

let check_value27: string | undefined;

class Sub28 extends Base28 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value27 = this.value[0];
  }
}

class Base29 {
  public value: boolean;
  constructor() {
    this.value = true;
  }
}

let check_value28: boolean;

class Sub29 extends Base29 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value28 = this.value;
  }
}

class Base30 {
  public readonly value: boolean;
  constructor() {
    this.value = true;
  }
}

let check_value29: boolean;

class Sub30 extends Base30 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value29 = this.value;
  }
}

class Base31 {
  public value: User
  constructor() {
    this.value = new User();
  }
}

let check_value30: User | undefined;

class Sub31 extends Base31 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value30 = this.value;
  }
}

class Base32 {
  public readonly value: User
  constructor() {
    this.value = new User();
  }
}

let check_value31: User | undefined;

class Sub32 extends Base32 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value31 = this.value;
  }
}

class Base33 {
  public value: Date;
  constructor() {
    this.value = date;
  }
}

let check_value32: Date | undefined;

class Sub33 extends Base33 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value32 = this.value;
  }
}

class Base34 {
  public readonly value: Date;
  constructor() {
    this.value = date;
  }
}

let check_value33: Date | undefined;

class Sub34 extends Base34 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value33 = this.value;
  }
}

class Base35 {
  public value: int;
  constructor() {
    this.value = 1;
  }

  public changeMembers(): void {
    this.value = 2;
  }
}

class Sub35 extends Base35 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base36 {
  public readonly value: int;
  public value1: int = 2;
  constructor() {
    this.value = 1;
  }

  public changeMembers(): void {
    this.value1 = this.value;
  }
}

class Sub36 extends Base36 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base37 {
  public value: int;
  constructor() {
    this.value = 10;
  }
}

let check_value34: int;

class Sub37 extends Base37 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value34 = this.value;
  }
}

class Base38 {
  public readonly value: int;
  constructor() {
    this.value = 10;
  }
}

let check_value35: int;

class Sub38 extends Base38 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value35 = this.value;
  }
}

class Base39 {
  public value: null;
  constructor() {
    this.value = null;
  }
}

let check_value36: null;

class Sub39 extends Base39 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value36 = this.value;
  }
}

class Base40 {
  public readonly value: null;
  constructor() {
    this.value = null;
  }
}

let check_value37: null;

class Sub40 extends Base40 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value37 = this.value;
  }
}

class Base41 {
  public value: number;
  constructor() {
    this.value = 10;
  }
}

let check_value38: number;

class Sub41 extends Base41 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value38 = this.value;
  }
}

class Base42 {
  public readonly value: number;
  constructor() {
    this.value = 10;
  }
}

let check_value39: number;

class Sub42 extends Base42 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value39 = this.value;
  }
}

class Base43 {
  public value: string;
  constructor() {
    this.value = "hello,world";
  }
}

let check_value40: string | undefined;

class Sub43 extends Base43 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value40 = this.value;
  }
}

class Base44 {
  public readonly value: string;
  constructor() {
    this.value = "hello,world";
  }
}

let check_value41: string | undefined;

class Sub44 extends Base44 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value41 = this.value;
  }
}

class Base45 {
  public value: undefined;
  constructor() {
    this.value = undefined;
  }
}

let check_value42: undefined;

class Sub45 extends Base45 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value42 = this.value;
  }
}

class Base46 {
  public readonly value: undefined;
  constructor() {
    this.value = undefined;
  }
}

let check_value43: undefined;

class Sub46 extends Base46 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value43 = this.value;
  }
}








export default function AccessingParentClassTest() {
  describe('AccessingParentClassTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0100
     * @tc.name      testAccessingParentClass0001
     * @tc.desc      Subclasses accessing the initialization boolean[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0001';
      console.log(TAG + ' start');

      const instanceB = new Sub();
      instanceB.checkAccess();
      expect(check_value).assertTrue()


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0200
     * @tc.name      testAccessingParentClass0002
     * @tc.desc      Subclasses accessing the initialization readonly boolean[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0002';
      console.log(TAG + ' start');

      const instanceB = new Sub1();
      instanceB.checkAccess();
      expect(check_value1).assertTrue()


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0300
     * @tc.name      testAccessingParentClass0003
     * @tc.desc      Subclasses accessing the initialization User[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0003';
      console.log(TAG + ' start');

      const instanceB = new Sub2();
      instanceB.checkAccess();
      expect(check_value2!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0400
     * @tc.name      testAccessingParentClass0004
     * @tc.desc      Subclasses accessing the initialization User[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0004';
      console.log(TAG + ' start');

      const instanceB = new Sub3();
      instanceB.checkAccess();
      expect(check_value3!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0500
     * @tc.name      testAccessingParentClass0005
     * @tc.desc      Subclasses accessing the initialization Date of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0005';
      console.log(TAG + ' start');

      const instanceB = new Sub4();
      instanceB.checkAccess();
      expect(check_value4).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0600
     * @tc.name      testAccessingParentClass0006
     * @tc.desc      Subclasses accessing the initialization readonly Date of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0006';
      console.log(TAG + ' start');

      const instanceB = new Sub5();
      instanceB.checkAccess();
      expect(check_value5).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0700
     * @tc.name      testAccessingParentClass0007
     * @tc.desc      Subclasses accessing the initialization function of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0007';
      console.log(TAG + ' start');

      const instanceB = new Sub6();
      instanceB.checkAccess();
      expect(instanceB.value).assertEqual(2);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0800
     * @tc.name      testAccessingParentClass0008
     * @tc.desc      Subclasses accessing the initialization readonly function of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0008';
      console.log(TAG + ' start');

      const instanceB = new Sub6();
      instanceB.checkAccess();
      expect(instanceB.value).assertEqual(2);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_0900
     * @tc.name      testAccessingParentClass0009
     * @tc.desc      Subclasses accessing the initialization int of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0009';
      console.log(TAG + ' start');

      const instanceB = new Sub7();
      instanceB.checkAccess();
      expect(check_value6).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1000
     * @tc.name      testAccessingParentClass0010
     * @tc.desc      Subclasses accessing the initialization readonly int of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0010';
      console.log(TAG + ' start');

      const instanceB = new Sub8();
      instanceB.checkAccess();
      expect(check_value7).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1100
     * @tc.name      testAccessingParentClass0011
     * @tc.desc      Subclasses accessing the initialization null of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0011';
      console.log(TAG + ' start');

      const instanceB = new Sub9();
      instanceB.checkAccess();
      expect(check_value8).assertNull;


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1200
     * @tc.name      testAccessingParentClass0012
     * @tc.desc      Subclasses accessing the initialization readonly null of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0012';
      console.log(TAG + ' start');

      const instanceB = new Sub10();
      instanceB.checkAccess();
      expect(check_value9).assertEqual(null);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1300
     * @tc.name      testAccessingParentClass0013
     * @tc.desc      Subclasses accessing the initialization number of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0013';
      console.log(TAG + ' start');

      const instanceB = new Sub11();
      instanceB.checkAccess();
      expect(check_value10).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1400
     * @tc.name      testAccessingParentClass0014
     * @tc.desc      Subclasses accessing the initialization readonly number of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0014';
      console.log(TAG + ' start');

      const instanceB = new Sub12();
      instanceB.checkAccess();
      expect(check_value11).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1500
     * @tc.name      testAccessingParentClass0015
     * @tc.desc      Subclasses accessing the initialization string of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0015';
      console.log(TAG + ' start');

      const instanceB = new Sub13();
      instanceB.checkAccess();
      expect(check_value12).assertEqual("hello,world");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1600
     * @tc.name      testAccessingParentClass0016
     * @tc.desc      Subclasses accessing the initialization readonly string of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0016';
      console.log(TAG + ' start');

      const instanceB = new Sub14();
      instanceB.checkAccess();
      expect(check_value13).assertEqual("hello,world");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1700
     * @tc.name      testAccessingParentClass0017
     * @tc.desc      Subclasses accessing the initialization undefined of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0017';
      console.log(TAG + ' start');

      const instanceB = new Sub15();
      instanceB.checkAccess();
      expect(check_value14).assertEqual(undefined);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1800
     * @tc.name      testAccessingParentClass0018
     * @tc.desc      Subclasses accessing the initialization readonly undefined of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0018';
      console.log(TAG + ' start');

      const instanceB = new Sub16();
      instanceB.checkAccess();
      expect(check_value15).assertEqual(undefined);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_1900
     * @tc.name      testAccessingParentClass0019
     * @tc.desc      Subclasses accessing the initialization boolean[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0019';
      console.log(TAG + ' start');

      const instanceB = new Sub17();
      instanceB.checkAccess();
      expect(check_value16).assertTrue();


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2000
     * @tc.name      testAccessingParentClass0020
     * @tc.desc      Subclasses accessing the initialization readonly boolean[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0020';
      console.log(TAG + ' start');

      const instanceB = new Sub18();
      instanceB.checkAccess();
      expect(check_value17).assertTrue();


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2100
     * @tc.name      testAccessingParentClass0021
     * @tc.desc      Subclasses accessing the initialization User[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0021';
      console.log(TAG + ' start');

      const instanceB = new Sub19();
      instanceB.checkAccess();
      expect(check_value18!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2200
     * @tc.name      testAccessingParentClass0022
     * @tc.desc      Subclasses accessing the initialization readonly User[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0022';
      console.log(TAG + ' start');

      const instanceB = new Sub20();
      instanceB.checkAccess();
      expect(check_value19!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2300
     * @tc.name      testAccessingParentClass0023
     * @tc.desc      Subclasses accessing the initialization Date[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0023';
      console.log(TAG + ' start');

      const instanceB = new Sub21();
      instanceB.checkAccess();
      expect(check_value20).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2400
     * @tc.name      testAccessingParentClass0024
     * @tc.desc      Subclasses accessing the initialization readonly Date[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0024';
      console.log(TAG + ' start');

      const instanceB = new Sub22();
      instanceB.checkAccess();
      expect(check_value21).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2500
     * @tc.name      testAccessingParentClass0025
     * @tc.desc      Subclasses accessing the initialization interface[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0025';
      console.log(TAG + ' start');

      const instanceB = new Sub23();
      instanceB.checkAccess();
      expect(check_value22!.name).assertEqual("Object1");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2600
     * @tc.name      testAccessingParentClass0026
     * @tc.desc      Subclasses accessing the initialization readonly SomeInterface[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0026';
      console.log(TAG + ' start');

      const instanceB = new Sub24();
      instanceB.checkAccess();
      expect(check_value23!.name).assertEqual("Object1");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2700
     * @tc.name      testAccessingParentClass0027
     * @tc.desc      Subclasses accessing the initialization number[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0027';
      console.log(TAG + ' start');

      const instanceB = new Sub25();
      instanceB.checkAccess();
      expect(check_value24).assertEqual(1);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2800
     * @tc.name      testAccessingParentClass0028
     * @tc.desc      Subclasses accessing the initialization readonly number[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0028';
      console.log(TAG + ' start');

      const instanceB = new Sub26();
      instanceB.checkAccess();
      expect(check_value25).assertEqual(1);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_2900
     * @tc.name      testAccessingParentClass0029
     * @tc.desc      Subclasses accessing the initialization string[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0029';
      console.log(TAG + ' start');

      const instanceB = new Sub27();
      instanceB.checkAccess();
      expect(check_value26).assertEqual("a");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3000
     * @tc.name      testAccessingParentClass0030
     * @tc.desc      Subclasses accessing the initialization readonly string[] of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0030';
      console.log(TAG + ' start');

      const instanceB = new Sub28();
      instanceB.checkAccess();
      expect(check_value27).assertEqual("a");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3100
     * @tc.name      testAccessingParentClass0031
     * @tc.desc      Subclasses accessing the initialization boolean of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0031';
      console.log(TAG + ' start');

      const instanceB = new Sub29();
      instanceB.checkAccess();
      expect(check_value28).assertTrue();


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3200
     * @tc.name      testAccessingParentClass0032
     * @tc.desc      Subclasses accessing the initialization readonly boolean of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0032';
      console.log(TAG + ' start');

      const instanceB = new Sub30();
      instanceB.checkAccess();
      expect(check_value29).assertTrue();


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3300
     * @tc.name      testAccessingParentClass0033
     * @tc.desc      Subclasses accessing the initialization UserClass of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0033';
      console.log(TAG + ' start');

      const instanceB = new Sub31();
      instanceB.checkAccess();
      expect(check_value30!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3400
     * @tc.name      testAccessingParentClass0034
     * @tc.desc      Subclasses accessing the initialization readonly UserClass of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0034';
      console.log(TAG + ' start');

      const instanceB = new Sub32();
      instanceB.checkAccess();
      expect(check_value31!.name).assertEqual("test_name");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3500
     * @tc.name      testAccessingParentClass0035
     * @tc.desc      Subclasses accessing the initialization Date of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0035';
      console.log(TAG + ' start');

      const instanceB = new Sub33();
      instanceB.checkAccess();
      expect(check_value32).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3600
     * @tc.name      testAccessingParentClass0036
     * @tc.desc      Subclasses accessing the initialization readonly Date of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0036';
      console.log(TAG + ' start');

      const instanceB = new Sub34();
      instanceB.checkAccess();
      expect(check_value33).assertEqual(date);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3700
     * @tc.name      testAccessingParentClass0037
     * @tc.desc      Subclasses accessing the initialization function of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0037';
      console.log(TAG + ' start');

      const instanceB = new Sub35();
      instanceB.checkAccess();
      expect(instanceB.value).assertEqual(2);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3800
     * @tc.name      testAccessingParentClass0038
     * @tc.desc      Subclasses accessing the initialization readonly function of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0038';
      console.log(TAG + ' start');

      const instanceB = new Sub36();
      instanceB.checkAccess();
      expect(instanceB.value1).assertEqual(1);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_3900
     * @tc.name      testAccessingParentClass0039
     * @tc.desc      Subclasses accessing the initialization int of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0039';
      console.log(TAG + ' start');

      const instanceB = new Sub37();
      instanceB.checkAccess();
      expect(check_value34).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4000
     * @tc.name      testAccessingParentClass0040
     * @tc.desc      Subclasses accessing the initialization readonly int of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0040';
      console.log(TAG + ' start');

      const instanceB = new Sub38();
      instanceB.checkAccess();
      expect(check_value35).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4100
     * @tc.name      testAccessingParentClass0041
     * @tc.desc      Subclasses accessing the initialization null of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0041';
      console.log(TAG + ' start');

      const instanceB = new Sub39();
      instanceB.checkAccess();
      expect(check_value36).assertEqual(null);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4200
     * @tc.name      testAccessingParentClass0042
     * @tc.desc      Subclasses accessing the initialization readonly null of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0042';
      console.log(TAG + ' start');

      const instanceB = new Sub40();
      instanceB.checkAccess();
      expect(check_value37).assertEqual(null);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4300
     * @tc.name      testAccessingParentClass0043
     * @tc.desc      Subclasses accessing the initialization number of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0043';
      console.log(TAG + ' start');

      const instanceB = new Sub41();
      instanceB.checkAccess();
      expect(check_value38).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4400
     * @tc.name      testAccessingParentClass0044
     * @tc.desc      Subclasses accessing the initialization readonly number of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0044';
      console.log(TAG + ' start');

      const instanceB = new Sub42();
      instanceB.checkAccess();
      expect(check_value39).assertEqual(10);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4500
     * @tc.name      testAccessingParentClass0045
     * @tc.desc      Subclasses accessing the initialization string of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0045';
      console.log(TAG + ' start');

      const instanceB = new Sub43();
      instanceB.checkAccess();
      expect(check_value40).assertEqual("hello,world");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4600
     * @tc.name      testAccessingParentClass0046
     * @tc.desc      Subclasses accessing the initialization readonly string of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0046';
      console.log(TAG + ' start');

      const instanceB = new Sub44();
      instanceB.checkAccess();
      expect(check_value41).assertEqual("hello,world");


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4700
     * @tc.name      testAccessingParentClass0047
     * @tc.desc      Subclasses accessing the initialization undefined of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0047';
      console.log(TAG + ' start');

      const instanceB = new Sub45();
      instanceB.checkAccess();
      expect(check_value42).assertEqual(undefined);


    });

    /**
     * @tc.number    SUB_ACCESSING_PARENT_CLASSTEST_4800
     * @tc.name      testAccessingParentClass0048
     * @tc.desc      Subclasses accessing the initialization readonly undefined of parent class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessingParentClass0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAccessingParentClass0048';
      console.log(TAG + ' start');

      const instanceB = new Sub46();
      instanceB.checkAccess();
      expect(check_value43).assertEqual(undefined);


    });

  })
}