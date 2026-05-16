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

class Animal {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Dog extends Animal {
  public breed: string;

  constructor(name: string, age: number, breed: string) {
    super(name, age);
    this.breed = breed;
  }
}

class Animal1 {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Dog1 extends Animal1 {
  constructor(value: string) {
    super(value);
  }
}

class Parent {
  public constructorPublicVar: string;

  constructor(initialValue: string) {
    this.constructorPublicVar = initialValue;
  }
}

class Child extends Parent {
  constructor() {
    super('abc');
  }
}

class Parent1 {
  public constructorPublicVar: number[];

  constructor(initialValue: number[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child1 extends Parent1 {
  constructor(childValue: number[]) {
    super(childValue);
  }
}

class Parent2 {
  public constructorPublicVar: undefined;

  constructor(initialValue: undefined) {
    this.constructorPublicVar = initialValue;
  }
}

class Child2 extends Parent2 {
  constructor(childValue: undefined) {
    super(childValue);
  }
}

class Parent3 {
  public constructorPublicVar: boolean[];

  constructor(initialValue: boolean[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child3 extends Parent3 {
  constructor(childValue: boolean[]) {
    super(childValue);
  }
}

class Parent4 {
  public value: int;

  constructor(value: int) {
    this.value = value;
  }
}

class Child4 extends Parent4 {
  constructor(value: int) {
    super(value);
  }
}

class Parent5 {
  public value: number[];

  constructor(value: number[]) {
    this.value = value;
  }
}

class Child5 extends Parent5 {
  constructor(value: number[]) {
    super(value);
  }
}

class Parent6 {
  public value: string[];

  constructor(value: string[]) {
    this.value = value;
  }
}

class Child6 extends Parent6 {
  constructor(value: string[]) {
    super(value);
  }
}

class Parent7 {
  public value: undefined;

  constructor(value: undefined) {
    this.value = value;
  }
}

class Child7 extends Parent7 {
  constructor(value: undefined) {
    super(value);
  }
}

class Parent8 {
  public value: boolean[];

  constructor(value: boolean[]) {
    this.value = value;
  }
}

class Child8 extends Parent8 {
  constructor(value: boolean[]) {
    super(value);
  }
}

class Parent9 {
  public value: null;

  constructor(value: null) {
    this.value = value;
  }
}

class Child9 extends Parent9 {
  constructor(value: null) {
    super(value);
  }
}

class Parent10 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

class Child10 extends Parent10 {
  constructor(value: number) {
    super(value);
  }
}

const date1 = new Date(2023, 10, 1);
const date2 = new Date(2023, 10, 2);

class Parent11 {
  public value: Date[];

  constructor(value: Date[]) {
    this.value = value;
  }
}

class Child11 extends Parent11 {
  constructor(value: Date[]) {
    super(value);
  }
}

class User {
  public name: string = "User";
}

class Parent12 {
  public value: User[];

  constructor(value: User[]) {
    this.value = value;
  }
}

class Child12 extends Parent12 {
  constructor(value: User[]) {
    super(value);
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Parent13 {
  public value: SomeInterface[];

  constructor(value: SomeInterface[]) {
    this.value = value;
  }
}

class Child13 extends Parent13 {
  constructor(value: SomeInterface[]) {
    super(value);
  }
}





export default function InitializeMembersTest() {
  describe('InitializeMembersTest', () => {
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
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0100
     * @tc.name      testInitializeMembers0001
     * @tc.desc      Create a subclass instance and initialize its member variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0001';
      console.log(TAG + ' start');

      const myDog = new Dog("Buddy", 5, "Golden Retriever");
      expect(myDog.name).assertEqual("Buddy");
      expect(myDog.age).assertEqual(5);
      expect(myDog.breed).assertEqual("Golden Retriever");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0200
     * @tc.name      testInitializeMembers0002
     * @tc.desc      To verify that the parent class member variables whose type is string are correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0002';
      console.log(TAG + ' start');

      const myAnimal = new Animal1('def');
      expect(myAnimal.value).assertEqual('def');
      const myDog = new Dog1('abc');
      expect(myDog.value).assertEqual('abc');

    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0300
     * @tc.name      testInitializeMembers0003
     * @tc.desc       The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0003';
      console.log(TAG + ' start');

      let child = new Child();
      let x: string = child.constructorPublicVar;
      expect(x).assertEqual('abc');
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0400
     * @tc.name      testInitializeMembers0004
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being number[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0004';
      console.log(TAG + ' start');

      const y : number[] = [1, 2, 3];
      let child = new Child1(y);
      let x: number[] = child.constructorPublicVar;
      expect(x[0]).assertEqual(1);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0500
     * @tc.name      testInitializeMembers0005
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0005';
      console.log(TAG + ' start');

      let child = new Child2(undefined);
      let x: undefined = child.constructorPublicVar;
      expect(x).assertEqual(undefined);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0600
     * @tc.name      testInitializeMembers0006
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being boolean[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0006';
      console.log(TAG + ' start');

      const y : boolean[] = [true, false, true];
      let child = new Child3(y);
      let x: boolean[] = child.constructorPublicVar;
      expect(x[0]).assertEqual(true);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0700
     * @tc.name      testInitializeMembers0007
     * @tc.desc      To verify that the parent class member variable (type int) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0007';
      console.log(TAG + ' start');

      const myChild = new Child4(1);
      expect(myChild.value).assertEqual(1);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0800
     * @tc.name      testInitializeMembers0008
     * @tc.desc      To verify that the parent class member variable (type number[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0008';
      console.log(TAG + ' start');

      const myChild = new Child5([1, 2, 3]);
      expect(myChild.value[0]).assertEqual(1);
      expect(myChild.value[1]).assertEqual(2);
      expect(myChild.value[2]).assertEqual(3);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_0900
     * @tc.name      testInitializeMembers0009
     * @tc.desc      To verify that the parent class member variable (type string[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0009';
      console.log(TAG + ' start');

      const myChild = new Child6(['a', 'b', 'c']);
      expect(myChild.value[0]).assertEqual('a');
      expect(myChild.value[1]).assertEqual('b');
      expect(myChild.value[2]).assertEqual('c');
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1000
     * @tc.name      testInitializeMembers0010
     * @tc.desc      To verify that the parent class member variable (type undefined) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0010';
      console.log(TAG + ' start');

      const myChild = new Child7(undefined);
      expect(myChild.value).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1100
     * @tc.name      testInitializeMembers0011
     * @tc.desc      To verify that the parent class member variable (type boolean[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0011';
      console.log(TAG + ' start');

      const myChild = new Child8([true, false, true]);
      expect(myChild.value[0]).assertEqual(true);
      expect(myChild.value[1]).assertEqual(false);
      expect(myChild.value[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1200
     * @tc.name      testInitializeMembers0012
     * @tc.desc      To verify that the parent class member variable (type null) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0012';
      console.log(TAG + ' start');

      const myChild = new Child9(null);
      expect(myChild.value).assertEqual(null);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1300
     * @tc.name      testInitializeMembers0013
     * @tc.desc      To verify that the parent class member variable (type number) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0013';
      console.log(TAG + ' start');

      const myChild = new Child10(3.14);
      expect(myChild.value).assertEqual(3.14);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1400
     * @tc.name      testInitializeMembers0014
     * @tc.desc      To verify that the parent class member variable (type Date) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0014';
      console.log(TAG + ' start');

      const myChild = new Child11([date1, date2]);
      expect(myChild.value[0]).assertEqual(date1);
      expect(myChild.value[1]).assertEqual(date2);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1500
     * @tc.name      testInitializeMembers0015
     * @tc.desc      To verify that the parent class member variable (type Custom class object array) is correctly
     * initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0015';
      console.log(TAG + ' start');

      const users: User[] = [new User(), new User()];
      const myChild = new Child12(users);
      expect(myChild.value[0].name).assertEqual("User");
      expect(myChild.value[1].name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERSTEST_1600
     * @tc.name      testInitializeMembers0016
     * @tc.desc      To verify that the parent class member variable (type Interface object array) is correctly
     * initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInitializeMembers0016';
      console.log(TAG + ' start');

      const interface1: SomeInterface[] = [obj1, obj2];
      const myChild = new Child13(interface1);
      expect(myChild.value[0].name).assertEqual("Object1");
      expect(myChild.value[1].name).assertEqual("Object2");

    });

  })
}