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

interface GetterSetterObj {
  a: number;
  get b(): number;
  set c(x: number);
  record?: Record<string, object>;
}

interface ExtendedDate extends Date {
  get year(): number;
  set year(y: number);
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectGetSetTest() {
  describe('objectGetSetTest', () => {
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
     * @tc.number SUB_OBJECT_GET_SET_TEST_0100
     * @tc.name objectGetSetTest0100
     * @tc.desc Define Getter for testing object initialization and verify that the return value depends on the associated properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectGetSetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const obj: GetterSetterObj = {
          a: 7,
          get b() {
            return obj.a + 1; 
          },
          set c(x: number) {
            obj.a = x / 2;
          }
        };

        expect(obj.b).assertEqual(8);
        obj.a = 10;
        expect(obj.b).assertEqual(11);
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0200
     * @tc.name objectGetSetTest0200
     * @tc.desc Define Setter for Test Object Initialize and verify the effect of modifying associated properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectGetSetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
        const obj: GetterSetterObj = {
          a: 7,
          get b() {
            return obj.a + 1;
          },
          set c(x: number) {
            obj.a = x / 2;
          }
        };

        obj.c = 50;
        expect(obj.a).assertEqual(25);
        expect(obj.b).assertEqual(26);
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0300
     * @tc.name objectGetSetTest0300
     * @tc.desc Test Object. FineProperty to define Getter separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectGetSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface ObjI{
          base: number;
          get double(): number;
        }
        const obj: ObjI = {
          base: 10,
          get double(){
            return obj.base * 2;
          }
        };

        expect(obj.double).assertEqual(20);
        obj.base = 20;
        expect(obj.double).assertEqual(40);
        expect(Object.keys(obj)).assertContain('double');
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0400
     * @tc.name objectGetSetTest0400
     * @tc.desc Test Object. FineProperty defines Getter/Setter and constrains configurable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectGetSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface ObjI{
          count: number;
          get adjust(): number;
          set adjust(val: number);
        }
        const obj: ObjI = {
          count: 10,
          get adjust(){
            return obj.count;
          },
          set adjust(val: number) {
            obj.count = val > 0 ? val : 0;
          }
        };

        obj.adjust = -5;
        expect(obj.count).assertEqual(0);
        obj.adjust = 15;
        expect(obj.count).assertEqual(15);
        expect(obj.adjust).assertEqual(15);

      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0500
     * @tc.name objectGetSetTest0500
     * @tc.desc Test Object. FineProperties Batch Define Getter/Setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectGetSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface ObjI{
          a: number;
          get b(): number;
          set c(x: number);
          d?: string;
        }
        const obj: ObjI = {
          a: 0,
          get b() {
            return obj.a + 1;
          },
          set c(x: number) {
            obj.a = x / 2;
          },
          d: 'static'
        };
        console.log(Object.keys(obj).toString())

        obj.c = 10;
        expect(obj.a).assertEqual(5);
        expect(obj.b).assertEqual(6);
        expect(obj.d).assertEqual('static');
        obj.d = 'updated';
        expect(obj.d).assertEqual('updated');
        expect(Object.keys(obj)).assertDeepEquals(['a', 'b', 'c', 'd']);
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0700
     * @tc.name objectGetSetTest0700
     * @tc.desc Test extended Date prototype, add year Getter/Setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectGetSetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class DateObj extends Date implements ExtendedDate{
          get year(): number {
            return this.getFullYear();
          }

          set year(y: number) {
            this.setFullYear(y);
          }
        }

        const now = new DateObj('2024-01-01') as ExtendedDate;
        expect(now.year).assertEqual(2024);
        now.year = 2025;
        expect(now.getFullYear()).assertEqual(2025);
        expect(now.toISOString().startsWith('2025')).assertEqual(true);
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0800
     * @tc.name objectGetSetTest0800
     * @tc.desc Getter/Setter inheritance for testing custom prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectGetSetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class ProductProto{
          price: number;
          constructor(price: number) {
            this.price = price;
          }
          get tax() {
            return this.price * 0.1;
          };
          set discount(rate: number) {
            this.price = this.price * (1 - rate);
          }
        }

        const productProto: ProductProto = new ProductProto(100);

        const product1 = new ProductProto(productProto.price);
        const product2 = new ProductProto(productProto.price);

        expect(product1.tax).assertEqual(10);
        expect(product2.tax).assertEqual(10);

        product1.discount = 0.2;
        expect(product1.price).assertEqual(80);
        expect(product1.tax).assertEqual(8);
        expect(product2.price).assertEqual(100);
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_0900
     * @tc.name objectGetSetTest0900
     * @tc.desc Exception handling when testing Getter dependency attribute missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectGetSetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class ObjI{
          missingProp?: string;
          get riskyGet(): string{
            return this.missingProp!.toUpperCase();
          }
        }
        const obj: ObjI = new ObjI();

        expect(() => obj.riskyGet).assertThrowError(TypeError);

        obj.missingProp = 'test';
        expect(obj.riskyGet).assertEqual('TEST');
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_1000
     * @tc.name objectGetSetTest1000
     * @tc.desc Testing an uncountable Getter/Setter cannot be traversed through for... in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectGetSetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class ObjI{
          visible: string;
          constructor(visible: string) {
            this.visible = visible;
          }
          get hiddenGet(){
            return 'hiddenValue';
          };
          set hiddenSet(val: string){
            this.visible = val;
          }
        }
        const obj: ObjI = new ObjI('hello');

        const enumeratedProps: string[] = [];
        let strArr = Object.keys(obj)
        for (let i = 0; i < strArr.length; i++) {
          enumeratedProps.push(strArr[i]);
        }
        expect(enumeratedProps).assertDeepEquals(['visible']);
        expect(obj.hiddenGet).assertEqual('hiddenValue');
        obj.hiddenSet = 'world';
        expect(obj.visible).assertEqual('world');
      });

    /**
     * @tc.number SUB_OBJECT_GET_SET_TEST_1100
     * @tc.name objectGetSetTest1100
     * @tc.desc Comprehensive testing defines Getter/Setter collaboration in multiple ways
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectGetSetTest1100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class Shop{
          basePrice: number;
          discountAmount: number;
          constructor(basePrice: number, discountAmount: number) {
            this.basePrice = basePrice;
            this.discountAmount = discountAmount;
          }
          get tax() {
            return this.basePrice * 0.08;
          }
          get totalPrice() {
            return this.basePrice + this.tax - this.discountAmount;
          };
          set discount(rate: number){
            this.discountAmount = this.basePrice * rate;
          }
        }
        const shop = new Shop(500, 0);

        expect(shop.totalPrice).assertEqual(540);

        shop.discount = 0.1;
        expect(shop.discountAmount).assertEqual(50);
        expect(shop.totalPrice).assertEqual(490);

        shop.basePrice = 600;
        expect(shop.totalPrice).assertEqual(598);
      });
  });
}