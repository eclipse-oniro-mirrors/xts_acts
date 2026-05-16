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
interface NamedObject {
  strArr: string[];
}

interface IndexedObject {
  strArr: string[];
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectIndexTest() {
  describe('objectIndexTest', () => {
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
     * @tc.number SUB_OBJECT_INDEX_TEST_0100
     * @tc.name objectIndexTest0100
     * @tc.desc The properties defined by the test name can only be accessed through the name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectIndexTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const obj: Record<string, string | number> = { ['name']: 'test', ['age']: 20 };

        expect(obj.name).assertEqual('test');
        expect(obj['age']).assertEqual(20);

        expect(obj[0]).assertUndefined();
        expect(obj[1]).assertUndefined();
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0200
     * @tc.name objectIndexTest0200
     * @tc.desc The properties defined by the test index can only be accessed through the index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectIndexTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const obj: IndexedObject = { strArr: [] };
        obj.strArr[0] = 'first';
        obj.strArr[1] = 'second';

        expect(obj.strArr[0]).assertEqual('first');
        expect(obj.strArr[1]).assertEqual('second');
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0300
     * @tc.name objectIndexTest0300
     * @tc.desc Test the attribute access constraints of mixed definition (name+index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectIndexTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface ExtendsI extends NamedObject, IndexedObject {
          id?: string;
        }

        const obj: ExtendsI = {
          strArr: []
        };
        obj.id = '1001';
        obj.strArr[2] = 'value2';

        expect(obj.id).assertEqual('1001');
        expect(obj.strArr[0]).assertUndefined();

        expect(obj.strArr[2]).assertEqual('value2');
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0400
     * @tc.name objectIndexTest0400
     * @tc.desc Test that simulated HTML forms objects can be accessed by name and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectIndexTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface MockFrom {
          name: string;
        }

        const mockForm1: MockFrom = { name: 'userForm' };
        const mockForm2: MockFrom = { name: 'searchForm' };
        const forms = [mockForm1, mockForm2];
        forms['userForm'] = mockForm1;
        forms['searchForm'] = mockForm2;

        expect(forms[0]).assertEqual(mockForm1);
        expect(forms[1]).assertEqual(mockForm2);

        expect(forms['userForm']).assertEqual(mockForm1);
        expect(forms['searchForm']).assertEqual(mockForm2);

        expect(forms[0]).assertEqual(forms['userForm']);
        expect(forms[1]).assertEqual(forms['searchForm']);
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0500
     * @tc.name objectIndexTest0500
     * @tc.desc Test that the properties added to the prototype are visible to all instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectIndexTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class Book {
          title: string;

          constructor(title: string) {
            this.title = title;
          }
          author: string = 'unknown';
        }

        const book1 = new Book('JavaScript Guide');
        const book2 = new Book('TypeScript Handbook');

        expect(book1.author).assertEqual('unknown');
        expect(book2.author).assertEqual('unknown');
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0600
     * @tc.name objectIndexTest0600
     * @tc.desc Testing that modifying the prototype property of a single instance does not affect other instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectIndexTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Animal {
          type: string;

          constructor(type: string) {
            this.type = type;
          }
          legs = 4;
        }

        const dog = new Animal('dog');
        const bird = new Animal('bird');

        dog.legs = 3;

        expect(dog.legs).assertEqual(3);
        expect(bird.legs).assertEqual(4);
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0700
     * @tc.name objectIndexTest0700
     * @tc.desc Test the impact of the prototype addition method on all instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectIndexTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Fruit {
          name: string;
          constructor(name: string) {
            this.name = name;
          }
          getInfo():string{
            return `Fruit: ${this.name}`
          }
        }

        const apple = new Fruit('apple');
        const banana = new Fruit('banana');

        expect(apple.getInfo()).assertEqual('Fruit: apple');
        expect(banana.getInfo()).assertEqual('Fruit: banana');
        expect(apple.getInfo).assertEqual(banana.getInfo);
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0800
     * @tc.name objectIndexTest0800
     * @tc.desc Test the impact of modifying the prototype on existing instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectIndexTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Device {
          brand: string;

          constructor(brand: string) {
            this.brand = brand;
          }
          type?: string;
          getType?: () => string | undefined;
        }

        const phone = new Device('Apple');
        phone.type = 'electronic'
        expect(phone.type).assertEqual('electronic');

        phone.getType = (): string | undefined => {
          return phone.type;
        };
        expect(phone.getType()).assertEqual('electronic');
      });

    /**
     * @tc.number SUB_OBJECT_INDEX_TEST_0900
     * @tc.name objectIndexTest0900
     * @tc.desc Mixed scenario of testing attribute indexing rules and prototype extension
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectIndexTest0900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class Product {
          id: number;

          constructor(id: number) {
            this.id = id
          }
          category = 'general';
        }

        const product = new Product(100);
        expect(product.id).assertEqual(100);
        expect(product.category).assertEqual('general');

        product.category = 'electronics';
        expect(product.category).assertEqual('electronics');

        const product2 = new Product(101);
        expect(product2.category).assertEqual('general');
      });
  });
}
