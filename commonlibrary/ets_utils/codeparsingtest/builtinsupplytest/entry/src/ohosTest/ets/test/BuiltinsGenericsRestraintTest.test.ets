/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License,Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

class Animal {
  speak() {
    throw new Error('Method not implemented.');
  }

  name: string;

  constructor(name: string) {
    this.name = name;
  }

  makeSound(): void {
    console.log(`${this.name} makes a sound.`);
  }
}

class Dog extends Animal {
  breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  bark(): void {
    console.log(`${this.name} (${this.breed}) barks: Woof!`);
  }
}

class GoldenRetriever extends Dog {
  constructor(name: string) {
    super(name, 'Golden Retriever');
  }

  fetch(): void {
    console.log(`${this.name} fetches the ball.`);
  }
}

class Cat extends Animal {
  color: string;

  constructor(name: string, color: string) {
    super(name);
    this.color = color;
  }

  meow(): void {
    console.log(`${this.name} (${this.color}) meows: Meow!`);
  }
}

class Vehicle {
  type: string;

  constructor(type: string) {
    this.type = type;
  }
}

function printAnimalDetails<T extends Animal>(animal: T): string {
  let result = `Animal Name: ${animal.name}\n`;
  animal.makeSound();

  if (animal instanceof Dog) {
    animal.bark();
    result += `${animal.name} (${animal.breed}) barks: Woof!\n`;
    if (animal instanceof GoldenRetriever) {
      animal.fetch();
      result += `${animal.name} fetches the ball.\n`;
    }
  } else if (animal instanceof Cat) {
    animal.meow();
    result += `${animal.name} (${animal.color}) meows: Meow!\n`;
  }

  return animal.name;
}

class Mammal extends Animal {
  public age: number;

  constructor(name: string, age: number) {
    super(name);
    this.age = age;
  }

  move(): void {
    console.log(`${this.name} moves around.`);
  }

  speak(): void {
    console.log(`${this.name} speaks.`);
  }

  push<T extends Mammal>(animal: T): void {
    console.log(`Pushing ${animal.name} into the zoo.`);
  }
}

class Bird extends Animal {
  public wingspan: number;

  constructor(name: string, wingspan: number) {
    super(name);
    this.wingspan = wingspan;
  }

  speak() {
    console.log(`${this.name} chirps.`);
  }

  fly() {
    console.log(`${this.name} flies with a wingspan of ${this.wingspan} cm.`);
  }
}

class Zoo<T extends Mammal> {
  public animal: T;

  constructor(animal: T) {
    this.animal = animal;
  }

  addAnimal(animal: T): void {
    this.animal.push(animal);
  }

  showAnimal(): string {
    console.log(`Animal: ${this.animal.name}, Age: ${this.animal.age}`);
    this.animal.speak();
    this.animal.move();
    return `${this.animal.name}:${this.animal.age}`;
  }
}

class Zoo2<T extends Animal> {
  public animals: T[] = [];

  constructor() {
  }

  addAnimal(animal: T): void {
    this.animals.push(animal);
  }

  showAnimal(): string {
    if (this.animals.length === 0) {
      throw new Error('No animal in the zoo!');
    }
    const animal = this.animals[0];
    console.log(`Animal: ${animal.name}`);
    animal.speak();
    return `${animal.name}`;
  }
}

class Item {
  public id: number;
  public name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  display(): void {
    console.log(`Item: ${this.name} (ID: ${this.id})`);
  }
}

class Book extends Item {
  public author: string;

  constructor(id: number, name: string, author: string) {
    super(id, name);
    this.author = author;
  }

  display(): void {
    console.log(`Book: ${this.name} by ${this.author} (ID: ${this.id})`);
  }
}

class Movie extends Item {
  public director: string;

  constructor(id: number, name: string, director: string) {
    super(id, name);
    this.director = director;
  }

  display(): void {
    console.log(`Movie: ${this.name} directed by ${this.director} (ID: ${this.id})`);
  }
}

class Collection<T extends Item> {
  private items: T[] = [];

  addItem(item: T): void {
    this.items.push(item);
  }

  showItems(): void {
    if (this.items.length === 0) {
      console.log('No items in the collection.');
      return;
    }

    this.items.forEach((item) => {
      item.display();
    });
  }

  getFirstItemName(): string {
    if (this.items.length === 0) {
      throw new Error('No items in the collection.');
    }
    return this.items[0].name;
  }
}

class UserWithAge {
  age: number;

  constructor(age: number) {
    this.age = age;
  }
}

function processValue<T>(value: T): string {
  console.log(`Received value of type: ${typeof value}, value: ${value}`);
  return `${value}`
}


function findFirstMatch<T, U extends T>(array: T[], target: U): T | undefined {
  for (let element of array) {
    if (element === target) {
      return element;
    }
  }
  return undefined;
}

function isAgeValid<T extends UserWithAge, U extends TypeLiteralInterface_1>(
  user: T,
  config: U
): boolean {
  return user.age >= config.minAge && user.age <= config.maxAge;
}

interface TypeLiteralInterface_1 {
  minAge: number;
  maxAge: number;
}

interface GeneratedObjectLiteralInterface_1 {
  minAge: number;
  maxAge: number;
}


interface TypeLiteralInterface_2 {
  value: string;
}

interface TypeLiteralInterface_3 {
  key: string;
}

export default function builtinsGenericsRestraintTest() {
  describe('BuiltinsGenericsRestraintTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
      // Presets an action,which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action,which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action,which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   builtinsGenericsRestraintTest0100
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0100
     * @tc.desc   test Generic no constrained parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0100';
        console.info(`${caseName} test start`);

        class G<T> {
          private data: T;

          constructor(initialData: T) {
            this.data = initialData;
          }

          getData(): T {
            return this.data;
          }

          setData(newData: T): void {
            this.data = newData;
          }

          transformData<U>(transformer: (data: T) => U): G<U> {
            const transformedData = transformer(this.data);
            return new G<U>(transformedData);
          }

          compareData(other: T): boolean {
            return JSON.stringify(this.data) === JSON.stringify(other);
          }

          printData(): void {
            console.log('Current Data:', this.data);
          }
        }

        const numberContainer = new G<number>(42);
        numberContainer.printData();
        const doubledNumberContainer = numberContainer.transformData((num) => num * 2);
        doubledNumberContainer.printData();
        expect(numberContainer.compareData(42)).assertTrue();
        expect(numberContainer.compareData(100)).assertFalse();
        const stringContainer = new G<string>('Hello, TypeScript!');
        stringContainer.printData();
        const upperCaseContainer = stringContainer.transformData((str) => str.toUpperCase());
        upperCaseContainer.printData();
        let a = stringContainer.compareData('Hello, TypeScript!')
        expect(a).assertTrue();
        let b = stringContainer.compareData('hello, typescript!')
        expect(b).assertFalse();
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0200
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0200
     * @tc.desc   test The encapsulation type of the base type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0200';
        console.info(`${caseName} test start`);

        class Wrapper<T extends string | number | boolean> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          setValue(newValue: T): void {
            this.value = newValue;
          }

          toString(): string {
            return String(this.value);
          }

          isEqual(other: T): boolean {
            return this.value === other;
          }
        }

        const stringWrapper = new Wrapper<string>('Hello, TypeScript!');
        console.log(stringWrapper.getValue());
        console.log(stringWrapper.toString());
        expect(stringWrapper.toString()).assertEqual('Hello, TypeScript!');
        const numberWrapper = new Wrapper<number>(42);
        console.log(numberWrapper.getValue().toString());
        expect(numberWrapper.getValue()).assertEqual(42);
        expect(numberWrapper.isEqual(42)).assertTrue();
        expect(numberWrapper.isEqual(100)).assertFalse();
        const booleanWrapper = new Wrapper<boolean>(true);
        expect(booleanWrapper.getValue()).assertTrue();
        console.log(booleanWrapper.toString());
        expect(booleanWrapper.toString()).assertEqual('true');
        expect(booleanWrapper.isEqual(true)).assertTrue();
        expect(booleanWrapper.isEqual(false)).assertFalse();
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0300
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0300
     * @tc.desc   test An object of a single type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0300';
        console.info(`${caseName} test start`);

        interface HasName {
          name: string;
        }

        interface Person {
          name: string;
          age: number;
        }

        class G<T extends HasName> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          printName(): string {
            console.log(`Name: ${this.value.name}`);
            return this.value.name;
          }
        }

        const obj = new G<Person>({
          name: 'Alice', age: 25
        });
        let a = obj.printName();
        expect(a).assertEqual('Alice')
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0400
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0400
     * @tc.desc   test Custom type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0400';
        console.info(`${caseName} test start`);

        interface Person {
          name: string;
          age: number;
        }

        class G<T extends Person> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          printPersonDetails(): number {
            console.log(`Name: ${this.value.name}, Age: ${this.value.age}`);
            return this.value.age
          }
        }

        const person = new G<Person>({
          name: 'Alice', age: 25
        });
        let a = person.printPersonDetails();
        expect(a).assertEqual(25)
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0500
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0500
     * @tc.desc   test Define the type itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0500';
        console.info(`${caseName} test start`);

        interface Person {
          name: string;
          age: number;
        }

        class G<T extends Person> {
          private data: T;

          constructor(initialData: T) {
            this.data = initialData;
          }

          printName(): string {
            console.log(`Name: ${this.data.name}`);
            return this.data.name;
          }

          printAge(): number {
            console.log(`Age: ${this.data.age}`);
            return this.data.age;
          }
        }

        const person = new G<Person>({
          name: 'John', age: 28
        });
        expect(person.printName()).assertEqual('John');
        expect(person.printAge()).assertEqual(28);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0600
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0600
     * @tc.desc   test The base type and package type are converted to each other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0600';
        console.info(`${caseName} test start`);
        type BasicType = string | number | boolean;

        class Wrapper<T extends BasicType> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          setValue(value: T): void {
            this.value = value;
          }
        }

        class Converter<T extends BasicType> {
          private basicValue: T;
          private wrappedValue: Wrapper<T>;

          constructor(value: T) {
            this.basicValue = value;
            this.wrappedValue = new Wrapper(value);
          }

          wrap(): Wrapper<T> {
            return new Wrapper(this.basicValue);
          }

          unwrap(wrapped: Wrapper<T>): T {
            return wrapped.getValue();
          }

          print(): BasicType {
            console.log(`Basic Value: ${this.basicValue}`);
            console.log(`Wrapped Value: ${this.wrappedValue.getValue()}`);
            return this.wrappedValue.getValue()
          }
        }

        const converter = new Converter<string>('Hello, TypeScript!');
        const wrapped = converter.wrap();
        console.log(wrapped.getValue());
        expect(wrapped.getValue()).assertEqual('Hello, TypeScript!')
        const basicValue = converter.unwrap(wrapped);
        console.log(basicValue);
        expect(basicValue).assertEqual('Hello, TypeScript!')
        let a = converter.print();
        expect(a).assertEqual('Hello, TypeScript!')
        const numberConverter = new Converter<number>(42);
        const numberWrapped = numberConverter.wrap();
        console.log(numberWrapped.getValue().toString());
        expect(numberWrapped.getValue()).assertEqual(42);
        const numberBasicValue = numberConverter.unwrap(numberWrapped);
        console.log(numberBasicValue.toString());
        expect(numberBasicValue).assertEqual(42);
        let b = numberConverter.print();
        expect(b).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0700
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0700
     * @tc.desc   test Defines the child/grandchild class of the type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0700';
        console.info(`${caseName} test start`);
        const dog = new Dog('Buddy', 'Labrador');
        const goldenRetriever = new GoldenRetriever('Max');
        const cat = new Cat('Whiskers', 'Black');
        let a = printAnimalDetails(dog);
        expect(a).assertEqual('Buddy')
        printAnimalDetails(goldenRetriever);
        let b = printAnimalDetails(cat);
        expect(b).assertEqual('Whiskers')
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0800
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0800
     * @tc.desc   test Defines the parent/grandparent class of the type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0800';
        console.info(`${caseName} test start`);
        const lion = new Mammal('Lion', 5);
        const zoo = new Zoo(lion);
        let a = zoo.showAnimal();
        expect(a).assertEqual('Lion:5');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest0900
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_0900
     * @tc.desc   test Defines the sibling type of the type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest0900';
        console.info(`${caseName} test start`);
        const eagle = new Bird('Eagle', 200);
        const lion = new Mammal('Lion', 5);
        const zoo = new Zoo2<Animal>();
        zoo.addAnimal(eagle);
        zoo.addAnimal(lion);
        let a = zoo.showAnimal();
        expect(a).assertEqual('Eagle');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1000
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1000
     * @tc.desc   test Different types of values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1000';
        console.info(`${caseName} test start`);
        const book1 = new Book(1, 'The Great Gatsby', 'F. Scott Fitzgerald');
        const book2 = new Book(2, '2084', 'George Orwell');
        const movie1 = new Movie(3, 'Inception', 'Christopher Nolan');
        const movie2 = new Movie(4, 'The Matrix', 'Lana Wachowski');
        const bookCollection = new Collection<Book>();
        const movieCollection = new Collection<Movie>();
        bookCollection.addItem(book1);
        bookCollection.addItem(book2);
        movieCollection.addItem(movie1);
        movieCollection.addItem(movie2);
        console.log('Books:');
        bookCollection.showItems();
        console.log('\nMovies:');
        movieCollection.showItems();
        const firstBookName = bookCollection.getFirstItemName();
        expect(firstBookName).assertEqual('The Great Gatsby');
        const firstMovieName = movieCollection.getFirstItemName();
        expect(firstMovieName).assertEqual('Inception');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1100
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1100
     * @tc.desc   test Common-type union
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1100';
        console.info(`${caseName} test start`);

        class DataProcessor<T extends string | number> {
          private data: T;

          constructor(data: T) {
            this.data = data;
          }

          process<U>(): U {
            if (typeof this.data === 'number') {
              return this.data * this.data as U;
            } else if (typeof this.data === 'string') {
              return this.data.length as U;
            } else {
              throw new Error('Unsupported data type');
            }
          }
        }

        const numberProcessor = new DataProcessor<number>(5);
        const stringProcessor = new DataProcessor<string>('Hello');
        const numberResult = numberProcessor.process<number>();
        console.log('Number result:', numberResult);
        expect(numberResult).assertEqual(25);
        const stringResult = stringProcessor.process<number>();
        console.log('String result:', stringResult);
        expect(stringResult).assertEqual(5);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1200
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1200
     * @tc.desc   test Mull, undefined, and other types of unions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1200';
        console.info(`${caseName} test start`);

        class DataProcessor<T extends string | number | null | undefined> {
          private data: T;

          constructor(data: T) {
            this.data = data;
          }

          process(): number | null {
            if (this.data === null || this.data === undefined) {
              return null;
            } else if (typeof this.data === 'number') {
              return this.data * this.data;
            } else if (typeof this.data === 'string') {
              return this.data.length;
            } else {
              throw new Error('Unsupported data type');
            }
          }
        }

        const numberProcessor = new DataProcessor<number>(5);
        const stringProcessor = new DataProcessor<string>('Hello');
        const nullProcessor = new DataProcessor<null>(null);
        const undefinedProcessor = new DataProcessor<undefined>(undefined);
        const numberResult = numberProcessor.process();
        console.log('Number result:', numberResult);
        expect(numberResult).assertEqual(25);
        const stringResult = stringProcessor.process();
        console.log('String result:', stringResult);
        expect(stringResult).assertEqual(5);
        const nullResult = nullProcessor.process();
        console.log('Null result:', nullResult);
        expect(nullResult).assertEqual(null);
        const undefinedResult = undefinedProcessor.process();
        console.log('Undefined result:', undefinedResult);
        expect(undefinedResult).assertEqual(null);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1300
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1300
     * @tc.desc   test Multiple parameters separately
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1300';
        console.info(`${caseName} test start`);

        class Box<T> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          setValue(newValue: T): void {
            this.value = newValue;
          }
        }

        const stringBox = new Box<string>('TypeScript');
        console.log(stringBox.getValue());
        expect(stringBox.getValue()).assertEqual('TypeScript');
        const numberBox = new Box<number>(100);
        console.log(numberBox.getValue().toString());
        expect(numberBox.getValue()).assertEqual(100);
        const booleanBox = new Box<boolean>(true);
        expect(booleanBox.getValue()).assertTrue();
        console.info(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsGenericsRestraintTest1400
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1400
     * @tc.desc   test Multiple parameters separately
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1400';
        console.info(`${caseName} test start`);
        let a =
          processValue<string>('Hello, TypeScript!');
        expect(a).assertEqual('Hello, TypeScript!');
        let b = processValue<number>(42);
        expect(b.toString()).assertEqual('42');
        let c = processValue<boolean>(true);
        expect(c.toString()).assertEqual('true');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1500
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1500
     * @tc.desc   test The latter arguments depend on the preceding arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1500';
        console.info(`${caseName} test start`);
        const numbers: number[] = [1, 2, 3, 4, 5];
        const strings: string[] = ['apple', 'banana', 'cherry'];
        const foundNumber = findFirstMatch(numbers, 3);
        expect(foundNumber).assertEqual(3);
        const foundString = findFirstMatch(strings, 'banana');
        expect(foundString).assertEqual('banana');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1600
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1600
     * @tc.desc   test The preceding arguments depend on the following arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1600';
        console.info(`${caseName} test start`);

        interface TargetData {
          id: number;
          name: string;
        }

        interface SourceData extends ToTarget<TargetData> {
          id: string;
          name: string;
        }

        interface ToTarget<T> {
          toTarget: () => T;
        }

        class DataMapper<T, U extends ToTarget<T>> {
          private sourceData: U;

          constructor(sourceData: U) {
            this.sourceData = sourceData;
          }

          mapToTarget(): T {
            return this.sourceData.toTarget();
          }
        }

        const sourceData: SourceData = {
          id: '123',
          name: 'Source Item',
          toTarget: (): TargetData => {
            return {
              id: parseInt(sourceData.id, 10),
              name: sourceData.name
            };
          }
        };
        const dataMapper = new DataMapper<TargetData, SourceData>(sourceData);
        const targetData = dataMapper.mapToTarget();
        console.log('Mapped Target Data:', targetData);
        console.log('Target Data ID:', targetData.id);
        expect(targetData.id).assertEqual(123);
        console.log('Target Data Name:', targetData.name);
        expect(targetData.name).assertEqual('Source Item');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1700
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1700
     * @tc.desc   test There are interdependencies between multiple parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1700';
        console.info(`${caseName} test start`);

        class User extends UserWithAge {
          name: string;

          constructor(name: string, age: number) {
            super(age);
            this.name = name;
          }
        }

        const user = new User('Alice', 25);
        const config: GeneratedObjectLiteralInterface_1 = {
          minAge: 18,
          maxAge: 60,
        };
        const isValid = isAgeValid(user, config);
        expect(isValid).assertTrue()
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1800
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1800
     * @tc.desc   test Convert a boolean value to a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1800';
        console.info(`${caseName} test start`);

        class G<T extends boolean> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          toString(): string {
            return this.value.toString();
          }
        }

        const booleanWrapper = new G<boolean>(true);
        expect(booleanWrapper.toString()).assertEqual('true');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest1900
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_1900
     * @tc.desc   test Custom type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest1900';
        console.info(`${caseName} test start`);

        interface CustomType {
          id: number;
          name: string;
          value: boolean;
        }

        class G<T extends CustomType> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          getId(): number {
            return this.value.id;
          }

          getName(): string {
            return this.value.name;
          }
        }

        const customValue: CustomType = {
          id: 42, name: 'example', value: true
        };
        const wrapper = new G(customValue);
        expect(wrapper.getValue()).assertEqual(customValue);
        expect(wrapper.getId()).assertEqual(42);
        expect(wrapper.getName()).assertEqual('example');
        console.info(`${caseName} test end`);
        Done();
      })
    /**
     * @tc.name   builtinsGenericsRestraintTest2000
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2000
     * @tc.desc   test Convert a boolean value to a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2000';
        console.info(`${caseName} test start`);

        class G<T = string[]> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          concat(...items: T[]): T[] {
            return (this.value as T[]).concat(...items);
          }
        }

        const stringArrayWrapper = new G(['a', 'b', 'c']);
        const result = stringArrayWrapper.concat(['d', 'e']);
        expect(result.toString()).assertEqual('a,b,c,d,e');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2100
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2100
     * @tc.desc   test Convert Boolean values to numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2100';
        console.info(`${caseName} test start`);

        class G<T extends boolean> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          toNumber(): number {
            return this.value ? 1 : 0;
          }
        }

        const booleanWrapper = new G<boolean>(true);
        expect(booleanWrapper.toNumber()).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2200
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2200
     * @tc.desc   test Convert numbers to arraysConvert numbers to arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2200';
        console.info(`${caseName} test start`);

        class G<T extends number> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          toArray(): number[] {
            return [this.value];
          }
        }

        const numberWrapper = new G<number>(42);
        expect(JSON.stringify(numberWrapper.toArray())).assertEqual('[42]');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2300
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2300
     * @tc.desc   test Convert an array to a number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2300';
        console.info(`${caseName} test start`);

        class G<T extends number[]> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          toNumber(): number {
            return this.value.reduce((acc, curr) => acc + curr, 0);
          }
        }

        const numberArrayWrapper = new G<number[]>([1, 2, 3]);
        expect(numberArrayWrapper.toNumber()).assertEqual(6);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2400
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2400
     * @tc.desc   test Convert an array to a number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2400';
        console.info(`${caseName} test start`);

        interface MyObject {
          value: string
        }

        class G<T extends TypeLiteralInterface_2> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          toString(): string {
            return this.value.value;
          }
        }

        const objectWrapper = new G<TypeLiteralInterface_2>({
          value: 'hello'
        });
        expect(objectWrapper.toString()).assertEqual('hello');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2500
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2500
     * @tc.desc   test Returns the properties of the subclass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2500';
        console.info(`${caseName} test start`);

        class Dog extends Animal {
          breed: string;

          constructor(name: string, breed: string) {
            super(name);
            this.breed = breed;
          }
        }

        class G<T extends Animal> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          getName(): string {
            return this.value.name;
          }
        }

        const dogWrapper = new G<Dog>(new Dog('Buddy', 'Golden Retriever'));
        expect(dogWrapper.getName()).assertEqual('Buddy');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2600
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2600
     * @tc.desc   test Returns a list of properties for the subclass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2600';
        console.info(`${caseName} test start`);

        class Dog extends Animal {
          breed: string;

          constructor(name: string, breed: string) {
            super(name);
            this.breed = breed;
          }
        }

        class G<T extends Animal> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          getPropertyList(): string[] {
            return Object.keys(this.value);
          }
        }

        const dogWrapper = new G<Dog>(new Dog('Buddy', 'Golden Retriever'));
        expect(dogWrapper.getPropertyList().toString()).assertEqual('name,breed');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2700
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2700
     * @tc.desc   test Returns a list of properties for the subclass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2700';
        console.info(`${caseName} test start`);

        class Car extends Vehicle {
          brand: string;

          constructor(type: string, brand: string) {
            super(type);
            this.brand = brand;
          }
        }

        class G<T extends Vehicle> {
          value: T;

          constructor(value: T) {
            this.value = value;
          }

          getType(): string {
            return this.value.type;
          }
        }

        const carWrapper = new G<Car>(new Car('Sedan', 'Toyota'));
        expect(carWrapper.getType()).assertEqual('Sedan');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2800
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2800
     * @tc.desc   test Common-type union
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2800';
        console.info(`${caseName} test start`);

        class G<T extends string | number | boolean | object | null | undefined> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getValue(): T {
            return this.value;
          }

          getValueType(): string {
            return typeof this.value;
          }

          isValueTruthy(): boolean {
            return Boolean(this.value);
          }
        }

        const stringWrapper = new G<string>('hello');
        expect(stringWrapper.getValue()).assertEqual('hello');
        expect(stringWrapper.getValueType()).assertEqual('string');
        expect(stringWrapper.isValueTruthy()).assertEqual(true);
        const numberWrapper = new G<number>(42);
        expect(numberWrapper.getValue()).assertEqual(42);
        expect(numberWrapper.getValueType()).assertEqual('number');
        expect(numberWrapper.isValueTruthy()).assertEqual(true);
        expect(JSON.stringify(numberWrapper).toString()).assertContain('42');
        const booleanWrapper = new G<boolean>(true);
        expect(booleanWrapper.getValue()).assertEqual(true);
        expect(booleanWrapper.getValueType()).assertEqual('boolean');
        expect(booleanWrapper.isValueTruthy()).assertEqual(true);
        expect(JSON.stringify(booleanWrapper).toString()).assertContain('true');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest2900
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_2900
     * @tc.desc   test Common-type union
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest2900';
        console.info(`${caseName} test start`);

        class G<T extends string | number | boolean | object | null | undefined> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          toString(): string {
            return String(this.value);
          }

          toNumber(): number {
            return Number(this.value);
          }

          toBoolean(): boolean {
            return Boolean(this.value);
          }

          isArray(): boolean {
            return Array.isArray(this.value);
          }
        }

        const stringWrapper = new G<string>('hello');
        expect(stringWrapper.toString()).assertEqual('hello');
        expect(stringWrapper.toBoolean()).assertEqual(true);
        const numberWrapper = new G<number>(42);
        expect(numberWrapper.toString()).assertEqual('42');
        expect(numberWrapper.toNumber()).assertEqual(42);
        expect(numberWrapper.toBoolean()).assertEqual(true);
        const booleanWrapper = new G<boolean>(true);
        expect(booleanWrapper.toString()).assertEqual('true');
        expect(booleanWrapper.toNumber()).assertEqual(1);
        expect(booleanWrapper.toBoolean()).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsGenericsRestraintTest3000
     * @tc.number SUB_BUILTINS_GENERICS_RESTRAINT_TEST_3000
     * @tc.desc   test Common-type union
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsRestraintTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsGenericsRestraintTest3000';
        console.info(`${caseName} test start`);

        class G<T extends string | number | boolean | object | null | undefined> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          getLength(): number {
            if (typeof this.value === 'string' || Array.isArray(this.value)) {
              return (this.value as string | T[]).length;
            }
            throw new Error('Value is not a string or array');
          }

          getKeys(): string[] {
            if (typeof this.value === 'object' && this.value !== null) {
              return Object.keys(this.value as object);
            }
            throw new Error('Value is not an object');
          }

          getValues(): (string | number | boolean | object | null | undefined)[] {
            if (typeof this.value === 'object' && this.value !== null) {
              return Object.values(this.value as object);
            }
            throw new Error('Value is not an object');
          }

          getEntries(): [string, T][] {
            if (typeof this.value === 'object' && this.value !== null) {
              return Object.entries(this.value as object) as [string, T][];
            }
            throw new Error('Value is not an object');
          }
        }

        const objectWrapper = new G<TypeLiteralInterface_3>({
          key: 'value'
        });
        expect(objectWrapper.toString()).assertEqual('[object Object]');
        expect(objectWrapper.getKeys().toString()).assertEqual('key');
        expect(objectWrapper.getValues().toString()).assertEqual('value');
        expect(objectWrapper.getEntries().toString()).assertEqual('key,value');
        const arrayWrapper = new G<number[]>([1, 2, 3]);
        expect(JSON.stringify(arrayWrapper)).assertContain('[1,2,3]');
        expect(arrayWrapper.getLength()).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      })
  })
}