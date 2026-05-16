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

interface Car {
  make: string;
  model: string;
  year: number;
  displayCar?: () => string;
  record: Record<string, Function>;
}

interface Calculator {
  a: number;
  b: number;
  add?: () => number;
  multiply?: () => number;
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectFunctionTest() {
  describe('objectFunctionTest', () => {
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
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0100
     * @tc.name objectFunctionTest0100
     * @tc.desc Method for defining function expressions in test object literals
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectFunctionTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const calculator: Calculator = {
          a: 2,
          b: 3,
          add: (): number => {
            return calculator.a + calculator.b;
          }
        };

        expect(calculator.add).not().assertUndefined();
        expect(calculator.add!()).assertEqual(5);
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0200
     * @tc.name objectFunctionTest0200
     * @tc.desc Method Abbreviation Grammar Definition Method in Test Object Literals
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectFunctionTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const calculator: Calculator = {
          a: 4,
          b: 5,
          multiply() {
            return calculator.a * calculator.b;
          }
        };

        expect(calculator.multiply).not().assertUndefined();
        expect(calculator.multiply!()).assertEqual(20);
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0300
     * @tc.name objectFunctionTest0300
     * @tc.desc Test adding methods to objects dynamically
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectFunctionTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const car: Car = {
          make: 'Toyota',
          model: 'Camry',
          year: 2023,
          record: {}
        };

        let getCarAge = (car: Car) => {
          const currentYear = new Date().getFullYear();
          return currentYear - car.year;
        }

        car.record.getAge = getCarAge;

        expect(car.record.getAge).not().assertUndefined();
        expect(car.record.getAge(car)).assertEqual(new Date().getFullYear() - 2023);

      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0400
     * @tc.name objectFunctionTest0400
     * @tc.desc Test defining methods in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class Car1{
          make: string;
          model: string;
          year: number;
          constructor(make: string, model: string, year: number) {
            this.make = make;
            this.model = model;
            this.year = year;
          }
          displayCar?: (car1: Car1)=>string = displayCar;
        }
        let displayCar = (car1: Car1) => {
          return `A ${car1.year} ${car1.make} ${car1.model}`;
        }

        const car1 = new Car1('Honda', 'Civic', 2022);
        const car2 = new Car1('Ford', 'Mustang', 2024);

        expect(car1.displayCar!(car1)).assertEqual('A 2022 Honda Civic');
        expect(car2.displayCar!(car2)).assertEqual('A 2024 Ford Mustang');
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0500
     * @tc.name objectFunctionTest0500
     * @tc.desc In the testing method, this points to the calling object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface User{
          name: string;
          age: number;
          getUserInfo: ()=>string;
        }
        const user: User = {
          name: 'Alice',
          age: 30,
          getUserInfo: (): string => {
            return `Name: ${user.name}, Age: ${user.age}`;
          }
        };

        expect(user.getUserInfo()).assertEqual('Name: Alice, Age: 30');

        user.name = 'Bob';
        expect(user.getUserInfo()).assertEqual('Name: Bob, Age: 30');
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0600
     * @tc.name objectFunctionTest0600
     * @tc.desc Test the isolation of this when calling methods on different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        class Product {
          name: string;
          price: number;

          constructor(name: string, price: number) {
            this.name = name;
            this.price = price;
          }

          getPriceWithTax() {
            return this.price * 1.1; // 10% tax
          }
        }

        const product1 = new Product('Laptop', 1000);
        const product2 = new Product('Phone', 500);

        expect(product1.getPriceWithTax()).assertEqual(1100);
        expect(product2.getPriceWithTax()).assertEqual(550);

        product1.price = 1200;
        expect(product1.getPriceWithTax()).assertEqual(1320);
        expect(product2.getPriceWithTax()).assertEqual(550);

      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0700
     * @tc.name objectFunctionTest0700
     * @tc.desc Test the this difference between function calls and method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @level Level 2
     */
    it('objectFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Obj{
          value = 10;
          getValue() {
            return this ? this.value : undefined;
          }
        }
        const obj = new Obj();

        expect(obj.getValue()).assertEqual(10);

        const func = obj.getValue;
        expect(func()).assertUndefined();

      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0800
     * @tc.name objectFunctionTest0800
     * @tc.desc When testing arrow functions as methods, this points to
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectFunctionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Obj{
          value = 20;
          getValue = () => this.value
        }
        const obj = new Obj();

        expect(obj.getValue()).not().assertUndefined();
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_0900
     * @tc.name objectFunctionTest0900
     * @tc.desc Inheritance and Call of Methods in the Test Prototype Chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectFunctionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Animal{
          type: string;
          constructor(type: string) {
            this.type = type;
          }
          speak(){
            return `${this.type} makes a sound`;
          }
        }

        class Dog extends Animal{
          name: string;
          constructor(name: string) {
            super('dog');
            this.name = name;
          }
          speak(){
            return `${this.name} barks`;
          }
        }

        const animal = new Animal('cat');
        const dog = new Dog('Buddy');

        expect(animal.speak()).assertEqual('cat makes a sound');
        expect(dog.speak()).assertEqual('Buddy barks');
      });

    /**
     * @tc.number SUB_OBJECT_FUNCTION_TEST_1000
     * @tc.name objectFunctionTest1000
     * @tc.desc Comprehensive scenario of testing method definition, invocation, and inheritance
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectFunctionTest1000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class BaseShape{
          color: string;
          constructor(color: string) {
            this.color = color;
          }
          getColor() {
            return this.color;
          }
        }
        const baseShape: BaseShape = new BaseShape('black');

        class CirCle extends BaseShape{
          radius: number;
          constructor(bashShape: BaseShape, raduis: number) {
            super(bashShape.color);
            this.radius = raduis;
          }
          getArea(){
            return Math.PI * this.radius**2;
          }
        }
        const circle = new CirCle(baseShape, 5);

        class Rectangle{
          width: number;
          height: number;
          constructor(width: number, height: number) {
            this.width = width;
            this.height = height;
          }
          getArea(){
            return this.width * this.height;
          }
          setDimensions(width: number, height: number) {
            this.width = width;
            this.height = height;
          }
        }

        const rect = new Rectangle(4, 6);

        expect(circle.getColor()).assertEqual('black');
        expect(Math.round(circle.getArea() * 100) / 100).assertEqual(78.54);

        expect(rect.getArea()).assertEqual(24);
        rect.setDimensions(5, 5);
        expect(rect.getArea()).assertEqual(25);
      });
  });
}