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

class User {
  public name: string = "User";
}

class Base {
  public value: User[] = [new User(), new User()];
}

class Derived extends Base {}

class Base1 {
  protected value: number[];

  constructor() {
    this.value = [1, 2, 3];
  }
}

class Derived1 extends Base1 {
  public value1: number[];
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base2 {
  protected value: number;

  constructor() {
    this.value = 10;
  }
}

class Derived2 extends Base2 {
  public value1: number;
  constructor() {
    super();
    this.value1 = this.value
  }
}

class Base3 {
  protected value: undefined;

  constructor() {
    this.value = undefined;
  }
}

class Derived3 extends Base3 {
  public value1: undefined;
  constructor() {
    super();
    this.value1 = undefined;
  }
}

class Base4 {
  protected value: null;

  constructor() {
    this.value = null;
  }
}

class Derived4 extends Base4 {
  public value1: null;
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base5 {
  protected value: number;

  constructor() {
    this.value = 3.14;
  }
}

class Derived5 extends Base5 {
  public value1: number;
  constructor() {
    super();
    this.value1 = this.value;
  }
}

const date = new Date(2023, 10, 1);

class Base6 {
  public value: Date = date;
}

class Derived6 extends Base6 {}

class Base7 {
  public value: string = "Hello";
}

class Derived7 extends Base7 {}

class Base8 {
  protected value: string;

  constructor() {
    this.value = "Hello";
  }
}

class Derived8 extends Base8 {
  public value1: string;
  constructor() {
    super();
    this.value1 = String(this.value);
  }

}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Base9 {
  protected value: SomeInterface[];

  constructor() {
    this.value = [obj1, obj2];
  }
}

class Derived9 extends Base9 {
  public value1: SomeInterface[];
  constructor() {
    super();
    this.value1 = this.value;
  }
}

const date1 = new Date(2023, 10, 1);
const date2 = new Date(2023, 10, 2);

class Base10 {
  protected value: Date[];

  constructor() {
    this.value = [date1, date2];
  }
}

class Derived10 extends Base10 {
  public value1: Date[];
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base11 {
  public value: string[] = ["a", "b", "c"];
}

class Derived11 extends Base11 {}

class Base12 {
  protected value: string[];

  constructor() {
    this.value = ["a", "b", "c"];
  }
}

class Derived12 extends Base12 {
  public value1: string[]
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base13 {
  public value: number = 10;
}

class Derived13 extends Base13 {}

class UserClass {
  public name: string = "User";
}

class Base14 {
  public value: UserClass = new UserClass();
}

class Derived14 extends Base14 {}

class Base15 {
  public value: number[] = [1, 2, 3];
}

class Derived15 extends Base15 {}

class Base16 {
  public value: Date[] = [date1, date2];
}

class Derived16 extends Base16 {}

class Base17 {
  protected value: Date;

  constructor() {
    this.value = date;
  }
}

class Derived17 extends Base17 {
  public value1: Date;
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base18 {
  public value: SomeInterface[] = [obj1, obj2];
}

class Derived18 extends Base18 {}

class Base19 {
  protected value: UserClass;

  constructor() {
    this.value = new UserClass();
  }
}

class Derived19 extends Base19 {
  public value1: UserClass;
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base20 {
  public value: boolean[] = [true, false, true];
}

class Derived20 extends Base20 {}

class Base21 {
  protected value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

class Derived21 extends Base21 {
  public value1: boolean[];
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base22 {
  protected value: boolean;
  constructor() {
    this.value = true;
  }
}

class Derived22 extends Base22 {
  public value1: boolean;
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base23 {
  public value: number = 3.14;
}

class Derived23 extends Base23 {}

class Base24 {
  public value: boolean = true;
}

class Derived24 extends Base24 {}

class Base25 {
  protected value: User[];

  constructor() {
    this.value = [new User(), new User()];
  }
}

class Derived25 extends Base25 {
  public value1: User[];
  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base26 {
  public value: null = null;
}

class Derived26 extends Base26 {}

class Base27 {
  public value: undefined = undefined;
}

class Derived27 extends Base27 {}


export default function ClassInheritsParentMembersTest() {
  describe('ClassInheritsParentMembersTest', () => {
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
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0100
     * @tc.name      testClassInheritsParentMembers0001
     * @tc.desc      Ensure that a subclass inherits the initial value of a User[] type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0001';
      console.log(TAG + ' start');

      let instance = new Derived();
      expect(instance.value[0].name).assertEqual("User");
      expect(instance.value[1].name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0200
     * @tc.name      testClassInheritsParentMembers0002
     * @tc.desc      Ensure that a subclass inherits the initial value of a number[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0002';
      console.log(TAG + ' start');

      let instance = new Derived1();
      expect(instance.value1[0]).assertEqual(1);
      expect(instance.value1[1]).assertEqual(2);
      expect(instance.value1[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0300
     * @tc.name      testClassInheritsParentMembers0003
     * @tc.desc      Ensure that a subclass inherits the initial value of an int type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0003';
      console.log(TAG + ' start');

      let instance = new Derived2();
      expect(instance.value1).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0400
     * @tc.name      testClassInheritsParentMembers0004
     * @tc.desc      Ensure that a subclass inherits the initial value of an undefined type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0004';
      console.log(TAG + ' start');

      let instance = new Derived3();
      expect(instance.value1).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0500
     * @tc.name      testClassInheritsParentMembers0005
     * @tc.desc      Ensure that a subclass inherits the initial value of a null type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0005';
      console.log(TAG + ' start');

      let instance = new Derived4();
      expect(instance.value1).assertEqual(null);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0600
     * @tc.name      testClassInheritsParentMembers0006
     * @tc.desc      Ensure that a subclass inherits the initial value of a number type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0006';
      console.log(TAG + ' start');

      let instance = new Derived5();
      expect(instance.value1).assertEqual(3.14);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0700
     * @tc.name      testClassInheritsParentMembers0007
     * @tc.desc      Ensure that a subclass inherits the initial value of a Date type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0007';
      console.log(TAG + ' start');

      let instance = new Derived6();
      expect(instance.value).assertEqual(date);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0800
     * @tc.name      testClassInheritsParentMembers0008
     * @tc.desc      Ensure that a subclass inherits the initial value of a string type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0008';
      console.log(TAG + ' start');

      let instance = new Derived7();
      expect(instance.value).assertEqual("Hello");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_0900
     * @tc.name      testClassInheritsParentMembers0009
     * @tc.desc      Ensure that a subclass inherits the initial value of a string type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0009';
      console.log(TAG + ' start');

      let instance = new Derived8();
      expect(instance.value1).assertEqual("Hello");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1000
     * @tc.name      testClassInheritsParentMembers0010
     * @tc.desc      Ensure that a subclass inherits the initial value of a SomeInterface[] type
     * member variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0010';
      console.log(TAG + ' start');

      let instance = new Derived9();
      expect(instance.value1[0].name).assertEqual("Object1");
      expect(instance.value1[1].name).assertEqual("Object2");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1100
     * @tc.name      testClassInheritsParentMembers0011
     * @tc.desc      Ensure that a subclass inherits the initial value of a Date[] type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0011';
      console.log(TAG + ' start');

      let instance = new Derived10();
      expect(instance.value1[0]).assertEqual(date1);
      expect(instance.value1[1]).assertEqual(date2);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1200
     * @tc.name      testClassInheritsParentMembers0012
     * @tc.desc      Ensure that a subclass inherits the initial value of a string[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0012';
      console.log(TAG + ' start');

      let instance = new Derived11();
      expect(instance.value[0]).assertEqual("a");
      expect(instance.value[1]).assertEqual("b");
      expect(instance.value[2]).assertEqual("c");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1300
     * @tc.name      testClassInheritsParentMembers0013
     * @tc.desc      Ensure that a subclass inherits the initial value of a string[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0013';
      console.log(TAG + ' start');

      let instance = new Derived12();
      expect(instance.value1[0]).assertEqual("a");
      expect(instance.value1[1]).assertEqual("b");
      expect(instance.value1[2]).assertEqual("c");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1400
     * @tc.name      testClassInheritsParentMembers0014
     * @tc.desc      Ensure that a subclass inherits the initial value of a string[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0014';
      console.log(TAG + ' start');

      let instance = new Derived13();
      expect(instance.value).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1500
     * @tc.name      testClassInheritsParentMembers0015
     * @tc.desc      Ensure that a subclass inherits the initial value of a user class type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0015';
      console.log(TAG + ' start');

      let instance = new Derived14();
      expect(instance.value.name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1600
     * @tc.name      testClassInheritsParentMembers0016
     * @tc.desc      Ensure that a subclass inherits the initial value of a number[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0016';
      console.log(TAG + ' start');

      let instance = new Derived15();
      expect(instance.value[0]).assertEqual(1);
      expect(instance.value[1]).assertEqual(2);
      expect(instance.value[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1700
     * @tc.name      testClassInheritsParentMembers0017
     * @tc.desc      Ensure that a subclass inherits the initial value of a Date[] type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0017';
      console.log(TAG + ' start');

      let instance = new Derived16();
      expect(instance.value[0]).assertEqual(date1);
      expect(instance.value[1]).assertEqual(date2);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1800
     * @tc.name      testClassInheritsParentMembers0018
     * @tc.desc      Ensure that a subclass inherits the initial value of a Date type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0018';
      console.log(TAG + ' start');

      let instance = new Derived17();
      expect(instance.value1).assertEqual(date);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_1900
     * @tc.name      testClassInheritsParentMembers0019
     * @tc.desc      Ensure that a subclass inherits the initial value of a SomeInterface[] type
     * member variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0019';
      console.log(TAG + ' start');

      let instance = new Derived18();
      expect(instance.value[0].name).assertEqual("Object1");
      expect(instance.value[1].name).assertEqual("Object2");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2000
     * @tc.name      testClassInheritsParentMembers0020
     * @tc.desc      Ensure that a subclass inherits the initial value of a user class type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0020';
      console.log(TAG + ' start');

      let instance = new Derived19();
      expect(instance.value1.name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2100
     * @tc.name      testClassInheritsParentMembers0021
     * @tc.desc      Ensure that a subclass inherits the initial value of a boolean[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0021';
      console.log(TAG + ' start');

      let instance = new Derived20();
      expect(instance.value[0]).assertEqual(true);
      expect(instance.value[1]).assertEqual(false);
      expect(instance.value[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2200
     * @tc.name      testClassInheritsParentMembers0022
     * @tc.desc      Ensure that a subclass inherits the initial value of a boolean[] type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0022';
      console.log(TAG + ' start');

      let instance = new Derived21();
      expect(instance.value1[0]).assertEqual(true);
      expect(instance.value1[1]).assertEqual(false);
      expect(instance.value1[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2300
     * @tc.name      testClassInheritsParentMembers0023
     * @tc.desc      Ensure that a subclass inherits the initial value of a boolean type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0023';
      console.log(TAG + ' start');

      let instance = new Derived22();
      expect(instance.value1).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2400
     * @tc.name      testClassInheritsParentMembers0024
     * @tc.desc       Ensure that a subclass inherits the initial value of a number type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0024';
      console.log(TAG + ' start');

      let instance = new Derived23();
      expect(instance.value).assertEqual(3.14);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2500
     * @tc.name      testClassInheritsParentMembers0025
     * @tc.desc      Ensure that a subclass inherits the initial value of a boolean type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0025';
      console.log(TAG + ' start');

      let instance = new Derived24();
      expect(instance.value).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2600
     * @tc.name      testClassInheritsParentMembers0026
     * @tc.desc      Ensure that a subclass inherits the initial value of a User[] type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0026';
      console.log(TAG + ' start');

      let instance = new Derived25();
      expect(instance.value1[0].name).assertEqual("User");
      expect(instance.value1[1].name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2700
     * @tc.name      testClassInheritsParentMembers0027
     * @tc.desc      Ensure that a subclass inherits the initial value of a null type member variable
     * from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0027';
      console.log(TAG + ' start');

      let instance = new Derived26();
      expect(instance.value).assertEqual(null);
    });

    /**
     * @tc.number    SUB_CLASS_INHERITS_PARENT_MEMBERSTEST_2800
     * @tc.name      testClassInheritsParentMembers0028
     * @tc.desc      Ensure that a subclass inherits the initial value of an undefined type member
     * variable from the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInheritsParentMembers0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInheritsParentMembers0028';
      console.log(TAG + ' start');

      let instance = new Derived27();
      expect(instance.value).assertEqual(undefined);
    });


  })
}