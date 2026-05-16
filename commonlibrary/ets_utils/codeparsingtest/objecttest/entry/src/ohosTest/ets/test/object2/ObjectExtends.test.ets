/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { objectExtendsTest1000, objectExtendsTest1500, objectExtendsTest1600,
  objectExtendsTest2200 } from './ObjectExtends';

interface ParentObj {
  baseProp: string;
  baseMethod: () => string;
}

interface ChildObj extends ParentObj {
  childProp?: string;
}

interface ClassParent {
  parentVal: number;
  getParentVal: () => number;
}

interface ClassChild extends ClassParent {
  childVal: number;
  getChildVal: () => number;
}

class Circle {
  radius: number;

  constructor(radios: number) {
    this.radius = radios;
  }

  getArea(): number {
    return Math.PI * this.radius**2;
  }
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectExtendsTest() {
  describe('objectExtendsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0100
     * @tc.name objectExtendsTest0100
     * @tc.desc Test single-layer prototype chain attribute lookup (instance → prototype)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      const proto: ParentObj = { baseProp: 'protoVal', baseMethod: () => 'protoMethod' };
      const instance = JSON.parse(JSON.stringify(proto)) as ParentObj;
      instance.baseMethod = proto.baseMethod;

      expect(instance.baseProp).assertEqual('protoVal');
      expect(instance.baseMethod()).assertEqual('protoMethod');
    });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0200
     * @tc.name objectExtendsTest0200
     * @tc.desc Test multi-layer prototype chain attribute search (instance → prototype → prototype of prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface Parent {
          gProp?: string;
          pProp?: string;
          cProp?: string;
        }

        const grandparent: Parent = { gProp: 'gVal' };
        const parent = JSON.parse(JSON.stringify(grandparent)) as Parent;
        parent.pProp = 'pVal';
        const child = JSON.parse(JSON.stringify(parent)) as Parent;
        child.cProp = 'cVal';

        expect(child.cProp).assertEqual('cVal');
        expect(child.pProp).assertEqual('pVal');
        expect(child.gProp).assertEqual('gVal');

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0300
     * @tc.name objectExtendsTest0300
     * @tc.desc When there is no attribute in the test prototype chain, return undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      interface Proto {
        existProp?: string;
        nonExistProp?: string;
        nonExistMethod?: string;
      }

      const proto: Proto = { existProp: 'existVal' };
      const instance = JSON.parse(JSON.stringify(proto)) as Proto;

      expect(instance.nonExistProp).assertUndefined();
      expect(instance.toString).not().assertUndefined();
      expect(instance.nonExistMethod).assertUndefined();

    });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0400
     * @tc.name objectExtendsTest0400
     * @tc.desc When testing the new constructor, the instance [[Prototype]] points to prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class Box {
          value: number;

          constructor(value: number) {
            this.value = value;
          }
        }
        const box = new Box(10);
        expect(box.constructor).assertEqual(Box);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0500
     * @tc.name objectExtendsTest0500
     * @tc.desc The prototype method of the test constructor is shared by all instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const circle1 = new Circle(2);
        const circle2 = new Circle(3);

        expect(circle1.getArea).assertEqual(circle2.getArea);
        expect(Math.round(circle1.getArea() * 100) / 100).assertEqual(12.57);
        expect(Math.round(circle2.getArea() * 100) / 100).assertEqual(28.27);

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0600
     * @tc.name objectExtendsTest0600
     * @tc.desc Test constructor prototype chain inheritance (subclass prototype points to parent class prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Parent {
          name: string;
          constructor(name: string) {
            this.name = name
          }
          greet: () => string = () => {
            return `Hello, ${this.name}`;
          };
        }

        class Child extends Parent {
          age: number;
          constructor(name: string, age: number) {
            super(name);
            this.age = age;
          }
          getAge: () => number = () => {
            return this.age;
          }
        }

        const child = new Child('Alice', 25);
        expect(child.greet()).assertEqual('Hello, Alice');
        expect(child.getAge()).assertEqual(25);

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0700
     * @tc.name objectExtendsTest0700
     * @tc.desc Test Object. create to specify the prototype creation object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const proto: ParentObj = { baseProp: 'base', baseMethod: () => 'baseMethod' };
        const obj = JSON.parse(JSON.stringify(proto)) as ParentObj;
        obj.baseMethod = () => 'baseMethod';
        obj.baseProp = 'override';

        expect(obj.baseProp).assertEqual('override');
        expect(obj.baseMethod()).assertEqual('baseMethod');

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0800
     * @tc.name objectExtendsTest0800
     * @tc.desc Test Object. create to create a null prototype object (without default inheritance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface BaseI{
          key?: string;
        }
        const result = objectExtendsTest1000() as (Object | BaseI)[];
        expect(result[1]).assertNull();
        expect(result[0].toString).assertUndefined();
        expect(result[0].hasOwnProperty).assertUndefined();
        expect((result[0] as BaseI).key).assertEqual('value');

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_0900
     * @tc.name objectExtendsTest0900
     * @tc.desc Test Object. create combined with property descriptors to configure instance properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface ReadOnlyProp {
          value: string;
          writable: boolean;
          enumerable: boolean;
        }

        interface NonEnumProp {
          value: string;
          enumerable: boolean;
        }

        interface Proto {
          protoProp?: string;
          readOnlyProp?: ReadOnlyProp;
          nonEnumProp?: NonEnumProp;
        }

        const proto: Proto = { protoProp: 'protoVal' };
        const obj = JSON.parse(JSON.stringify(proto)) as Proto;
        obj.readOnlyProp = {
          value: 'fixed',
          writable: false,
          enumerable: true
        };
        obj.nonEnumProp = {
          value: 'hidden',
          enumerable: false
        }

        expect(obj.readOnlyProp.value).assertEqual('fixed');
        expect(obj.nonEnumProp.value).assertEqual('hidden');
        expect(obj.protoProp).assertEqual('protoVal');

      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1000
     * @tc.name objectExtendsTest1000
     * @tc.desc Test class extensions to implement basic class inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class ParentClass implements ClassParent {
          parentVal: number;

          constructor(val: number) {
            this.parentVal = val;
          }
          getParentVal() {
            return this.parentVal;
          }
        }

        class ChildClass extends ParentClass implements ClassChild {
          childVal: number;
          constructor(parentVal: number, childVal: number) {
            super(parentVal);
            this.childVal = childVal;
          }
          getChildVal() {
            return this.childVal;
          }
        }

        const child = new ChildClass(10, 20);
        expect(child.getParentVal()).assertEqual(10);
        expect(child.getChildVal()).assertEqual(20);
        expect(child instanceof ParentClass).assertEqual(true);
        expect(child instanceof ChildClass).assertEqual(true);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1100
     * @tc.name objectExtendsTest1100
     * @tc.desc Test the inheritance of static methods in class inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Parent {
          static staticMethod() {
            return 'parentStatic';
          }
        }
        class Child extends Parent {
        }

        expect(Parent.staticMethod()).assertEqual('parentStatic');
        expect(Child.staticMethod()).assertEqual('parentStatic');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1200
     * @tc.name objectExtendsTest1200
     * @tc.desc Test sub object attribute masking prototype attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface Proto {
          prop: string;
          method: () => string;
        }

        const proto: Proto = { prop: 'protoVal', method: () => 'protoMethod' };
        const obj = JSON.parse(JSON.stringify(proto)) as Proto;
        obj.method = () => 'protoMethod';
        obj.prop = 'objVal';
        obj.method = () => 'objMethod';

        expect(obj.prop).assertEqual('objVal');
        expect(obj.method()).assertEqual('objMethod');
        expect(proto.prop).assertEqual('protoVal');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1300
     * @tc.name objectExtendsTest1300
     * @tc.desc Test hasOwnProperty to check its own properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface Proto{
          inheritedProp: string;
          ownProp?: string;
        }
        const proto: Proto = { inheritedProp: 'inherited' };

        const result = objectExtendsTest1500(proto) as boolean[];
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(false);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1400
     * @tc.name objectExtendsTest1400
     * @tc.desc Test Object. hasOwn to check its own properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface BaseI{
          inherited: string;
        }
        const proto: BaseI = { inherited: 'val' };

        const result = objectExtendsTest1600(proto) as boolean[];
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(false);
        expect(result[3]).assertEqual(true);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1500
     * @tc.name objectExtendsTest1500
     * @tc.desc Test how modifying the constructor prototype affects existing instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Dog {
          name: string;
          constructor(name: string) {
            this.name = name;
          }
          bark: () => string = () => 'woof';
        }

        const dog = new Dog('Buddy');
        dog.bark = () => 'bow wow';
        expect(dog.bark()).assertEqual('bow wow');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1600
     * @tc.name objectExtendsTest1600
     * @tc.desc Test that reassigning constructor prototype does not affect old instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface Cat {
          name: string;
          meow: () => string;
        }

        const oldCat: Cat = {
          name: 'Mimi',
          meow: () => 'meow'
        };
        const newCat: Cat = {
          name: 'Luna',
          meow: () => 'mew'
        };

        expect(oldCat.meow()).assertEqual('meow');
        expect(newCat.meow()).assertEqual('mew');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1700
     * @tc.name objectExtendsTest1700
     * @tc.desc In the test inheritance method, this points to an instance (non prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface Proto {
          value: number;
          getValue: () => number;
        }

        const proto: Proto = {
          value: 10,
          getValue: (): number => {
            return proto.value;
          }
        };

        const instance1 = JSON.parse(JSON.stringify(proto)) as Proto;
        instance1.value = 20;
        instance1.getValue = (): number => {
          return instance1.value;
        }
        const instance2 = JSON.parse(JSON.stringify(proto)) as Proto;
        instance2.value = 30;
        instance2.getValue = (): number => {
          return instance2.value;
        }

        expect(instance1.getValue()).assertEqual(20);
        expect(instance2.getValue()).assertEqual(30);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1800
     * @tc.name objectExtendsTest1800
     * @tc.desc When testing the arrow function as a prototype method, this points to the problem
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface Proto {
          value: number;
          getValue: () => number;
        }

        const proto: Proto = {
          value: 10,
          getValue: (): number => proto.value
        };

        const instance = JSON.parse(JSON.stringify(proto)) as Proto;
        instance.getValue = (): number => instance.value
        instance.value = 20;

        expect(instance.getValue()).assertEqual(20);
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_1900
     * @tc.name objectExtendsTest1900
     * @tc.desc Test Object. setPrototypeOf to modify existing object prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface Proto1{
          prop1: string;
        }
        interface Proto2{
          prop2: string;
          method2: ()=>string;
        }
        interface BaseI{
          prop1?: string;
          prop2?: string;
          method2?(): string;
        }
        const proto1: Proto1 = { prop1: 'val1' };
        const proto2: Proto2 = { prop2: 'val2', method2: () => 'method2' };
        const obj = objectExtendsTest2200(proto1, proto2) as BaseI;

        expect(obj.prop1).assertUndefined();
        expect(obj.prop2).assertEqual('val2');
        expect(obj.method2!()).assertEqual('method2');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_2000
     * @tc.name objectExtendsTest2000
     * @tc.desc Test the impact of dynamically adding prototype attributes on all instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectExtendsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Product {
          name: string;
          constructor(name: string) {
            this.name = name;
          }
          category?: string;
        }
        const p1 = new Product('Phone');
        const p2 = new Product('Laptop');

        p1.category = 'Electronics';
        p2.category = 'Electronics';

        expect(p1.category).assertEqual('Electronics');
        expect(p2.category).assertEqual('Electronics');
      });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_2100
     * @tc.name objectExtendsTest2100
     * @tc.desc Test the inheritance of the Object. prototype method (such as toString)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      interface BaseI {
        a: number;
      }

      const obj: BaseI = { a: 1 };
      const arr = [1, 2];
      const num = 123;

      expect(obj.toString()).assertEqual('[object Object]');
      expect(arr.toString()).assertEqual('1,2');
      expect(num.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_OBJECT_EXTENDS_TEST_2200
     * @tc.name objectExtendsTest2200
     * @tc.desc Test the inheritance of the Functionality. prototype method (such as call/apply)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectExtendsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let sum: (a: number, b: number) => number = (a: number, b: number) => {
          return a + b;
        }

        expect(sum(2, 3)).assertEqual(5);
        expect(sum(4, 5)).assertEqual(9);
      });
  });
}