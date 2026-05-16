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
import { deleteBase, deleteNonConfigurable, createObj, symbolTest, symbolTest1,
  objectPropTest3200,
  objectPropTest3200Del,
  objectPropTest3200_1,
  objectPropTest3300,
  objectPropTest3300_1,
  objectPropTest3300_2,
  objectPropTest4600,
  objectPropTest4700,
  objectPropTest5500,
  objectPropTest6600} from './ObjectAndProp';

interface Electronic {
  brand: string;
  price: number;
  specs?: Record<string, Object>;
  objArr: Object[];
}

interface GeneratedTypeLiteralInterface_1 {
  name: string;
  email: string;
}

interface User {
  id: number;
  info: GeneratedTypeLiteralInterface_1;
}

interface Tool {
  type: string;
  use: () => string;
}

interface GeneratedTypeLiteralInterface_2 {
  start: string;
  end: string;
}

interface GeneratedObjectLiteralInterface_1 {
  orderId: string;
  product: string;
  validPeriod: GeneratedTypeLiteralInterface_2;
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectAndPropTest() {
  describe('objectAndPropTest', () => {
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
     * @tc.number SUB_OBJECT_PROP_0100
     * @tc.name objectPropTest0100
     * @tc.desc test Object creation via new Object()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const obj = new Object();
        expect(typeof obj).assertEqual('object');
        expect(obj.constructor).assertEqual(Object);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0200
     * @tc.name objectPropTest0200
     * @tc.desc test dot notation to set string property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          make: string;
        }
        const myCar: UserData = { "make": "Ford"}
        expect(myCar.make).assertEqual("Ford");
        expect(typeof myCar.make).assertEqual("string");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0300
     * @tc.name objectPropTest0300
     * @tc.desc test dot notation to set number property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          year: number;
        }

        const myCar: UserData = { "year": 1969}
        expect(myCar.year).assertEqual(1969);
        expect(typeof myCar.year).assertEqual("number");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0400
     * @tc.name objectPropTest0400
     * @tc.desc test undefined value of unassigned property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          make: string;
          noProperty?: object;
        }

        const myCar: UserData = { "make": "Ford"}
        expect(myCar.noProperty).assertEqual(undefined);
        expect(myCar.noProperty!= null).assertEqual(false);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0500
     * @tc.name objectPropTest0500
     * @tc.desc test case sensitivity of property names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          model: string;
          MODEL: string;
        }

        const myCar: UserData = { "model": "Mustang", "MODEL": "F-150"};
        expect(myCar.model).assertEqual("Mustang");
        expect(myCar.MODEL).assertEqual("F-150");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0600
     * @tc.name objectPropTest0600
     * @tc.desc test bracket notation to set string property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myCar: UserData = { obj : {['make']:"Ford"}}
        expect(myCar.obj["make"]).assertEqual("Ford");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0700
     * @tc.name objectPropTest0700
     * @tc.desc test bracket notation to set number property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string | number>;
        }
        const myCar: UserData = { obj : {['year'] : 1969}};
        expect(myCar.obj["year"]).assertEqual(1969);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0800
     * @tc.name objectPropTest0800
     * @tc.desc test property name with space (bracket only)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : {['date created']: "2024-01-01"}}
        expect(myObj.obj["date created"]).assertEqual("2024-01-01");
        expect(myObj.obj["dateCreated"]).assertEqual(undefined);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_0900
     * @tc.name objectPropTest0900
     * @tc.desc test property name with hyphen (bracket only)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : { "user-name": "john_doe" }};
        expect(myObj.obj["user-name"]).assertEqual("john_doe");
        expect(myObj.obj["userName"]).assertEqual(undefined);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1000
     * @tc.name objectPropTest1000
     * @tc.desc test property name starting with number (bracket only)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, number>;
        }
        const myObj: UserData = { obj : {"123-id": 123} };
        expect(myObj.obj["123-id"]).assertEqual(123);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1100
     * @tc.name objectPropTest1100
     * @tc.desc test empty string as property name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : { "": "empty-value"} }
        expect(myObj.obj[""]).assertEqual("empty-value");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1200
     * @tc.name objectPropTest1200
     * @tc.desc test variable as property name (bracket notation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myCar: UserData = { obj : {} };
        const propName = "make";
        myCar.obj[propName] = "Ford";
        expect(myCar.obj[propName]).assertEqual("Ford");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1300
     * @tc.name objectPropTest1300
     * @tc.desc test random number as property name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<number, string>;
        }
        const myObj: UserData = { obj : {} };
        const rand = Math.random();
        myObj.obj[rand] = "random-value";
        const randStr = rand.toString();
        expect(myObj.obj[rand]).assertEqual("random-value");
        expect(myObj.obj[randStr]).assertEqual("random-value");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1400
     * @tc.name objectPropTest1400
     * @tc.desc test object as property name (toString conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : {} };
        const keyObj = new Object();
        myObj.obj[String(keyObj)] = "object-key-value";
        const keyStr = keyObj.toString();
        expect(myObj.obj[keyStr]).assertEqual("object-key-value");
        expect(myObj.obj[String(keyObj)]).assertEqual("object-key-value");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1500
     * @tc.name objectPropTest1500
     * @tc.desc test dynamic property name assignment via variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myCar: UserData = { obj : {} };
        let propertyName = "make";
        myCar.obj[propertyName] = "Ford";
        propertyName = "model";
        myCar.obj[propertyName] = "Mustang";
        expect(myCar.obj["make"]).assertEqual("Ford");
        expect(myCar.obj["model"]).assertEqual("Mustang");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1600
     * @tc.name objectPropTest1600
     * @tc.desc test for...in loop to enumerate properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string | number>;
        }
        const myCar: UserData = { obj : {} };
        myCar.obj["make"] = "Ford";
        myCar.obj["model"] = "Mustang";
        myCar.obj["year"] = 1969;
        const props: (string | number)[] = [];
        Object.entries(myCar.obj).forEach((one: (string | number)[]) => {
          props.push(one[0]);
        })
        expect(props).assertDeepEquals(["make", "model", "year"]);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1700
     * @tc.name objectPropTest1700
     * @tc.desc test hasOwnProperty to filter own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData{
          obj : Record<string, string>;
        }
        const myCar : UserData = { obj : {} };
        myCar.obj["make"] = "Ford";
        myCar.obj.extra = "proto-prop";
        const ownProps: string[] = [];
        Object.entries(myCar.obj).forEach((one: string[]) => {
          ownProps.push(one[0]);
        })
        expect(ownProps).assertContain("make");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1800
     * @tc.name objectPropTest1800
     * @tc.desc test showProps function output format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string | number>;
        }
        const myCar: UserData = { obj : {} };
        myCar.obj["make"] = "Ford";
        myCar.obj["model"] = "Mustang";
        myCar.obj["year"] = 1969;
        let showProps: (obj: object, objName: string) => string = (obj: object, objName: string): string => {
          let result = "";
          Object.entries(myCar.obj).forEach((one: (string|number)[]) => {
            result += `${objName}.${one[0]} = ${one[1]}\n`;
          })
          return result;
        }
        const expected = "myCar.make = Ford\nmyCar.model = Mustang\nmyCar.year = 1969\n";
        const result = showProps(myCar.obj, "myCar");
        expect(result).assertEqual(expected);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_1900
     * @tc.name objectPropTest1900
     * @tc.desc test number as property name (auto-convert to string)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : {} };
        myObj.obj[123] = "number-key";
        expect(myObj.obj[123]).assertEqual("number-key");
        expect(myObj.obj["123"]).assertEqual("number-key");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2000
     * @tc.name objectPropTest2000
     * @tc.desc test boolean as property name (auto-convert to string)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myObj: UserData = { obj : {} };
        myObj.obj["true"] = "bool-key";
        expect(myObj.obj["true"]).assertEqual("bool-key");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2100
     * @tc.name objectPropTest2100
     * @tc.desc test reassign property via dot notation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          make: string;
        }

        const myCar: UserData = { "make": "Ford" }
        myCar.make = "Ford";
        myCar.make = "Toyota";
        expect(myCar.make).assertEqual("Toyota");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2200
     * @tc.name objectPropTest2200
     * @tc.desc test reassign property via bracket notation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          year: number;
        }

        const myCar: UserData = { "year": 1969 }
        myCar.year = 1969;
        myCar.year = 2024;
        expect(myCar.year).assertEqual(2024);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2300
     * @tc.name objectPropTest2300
     * @tc.desc test Symbol as unique property name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const myObj = symbolTest();
        let sym1 = myObj[0];
        let sym2 = myObj[1];
        expect(myObj[2][sym1]).assertEqual("sym1-val");
        expect(myObj[2][sym2]).assertEqual("sym2-val");
        expect(sym1).not().assertDeepEquals(sym2);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2400
     * @tc.name objectPropTest2400
     * @tc.desc test global Symbol (Symbol.for) as property name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const myObj = symbolTest1();
        let sym1 = myObj[0];
        let sym2 = myObj[1];
        expect(myObj[2][sym2]).assertEqual("global-val");
        expect(sym1).assertDeepEquals(sym2);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2500
     * @tc.name objectPropTest2500
     * @tc.desc test property name with special char ($, _)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          $price: number;
          user_name: string;
        }

        const obj: UserData = { "$price": 19.99, "user_name": "jane" }
        expect(obj.$price).assertEqual(19.99);
        expect(obj.user_name).assertEqual("jane");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2600
     * @tc.name objectPropTest2600
     * @tc.desc test empty Object property enumeration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const emptyObj: UserData = { obj: { } };
        const props: string[] = [];
        Object.entries(emptyObj.obj).forEach((one: string[]) => {
          props.push(one[1]);
        })
        expect(props.length).assertEqual(0);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2700
     * @tc.name objectPropTest2700
     * @tc.desc test boolean type property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          isActive: boolean;
        }

        const config: UserData = { "isActive": true }
        expect(config.isActive).assertTrue();
        expect(typeof config.isActive).assertEqual("boolean");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2800
     * @tc.name objectPropTest2800
     * @tc.desc test null vs undefined property value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          undefProp?: object;
          nullProp?: object | null;
        }

        const data: UserData = { "nullProp": null }
        expect(data.nullProp).assertEqual(null);
        expect(data.undefProp).assertEqual(undefined);
        expect(data.nullProp).not().assertEqual(data.undefProp);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_2900
     * @tc.name objectPropTest2900
     * @tc.desc test nested Object as property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          info: Record<string, string>;
        }
        const user: UserData = { info: { ['name'] : "Alice"} };
        expect(user.info["name"]).assertEqual("Alice");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_3000
     * @tc.name objectPropTest3000
     * @tc.desc test Array as property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string[]>;
        }
        const cart: UserData = { obj: {} };
        cart.obj["items"] = ["apple", "banana"];
        expect(cart.obj["items"].length).assertEqual(2);
        expect(cart.obj["items"][0]).assertEqual("apple");
        cart.obj["items"].push("orange");
        expect(cart.obj["items"].length).assertEqual(3);
      })

    /**
     * @tc.number SUB_OBJECT_PROP_3100
     * @tc.name objectPropTest3100
     * @tc.desc test function as Object property (method)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, Function>;
        }
        const calc: UserData = { obj: {} };
        calc.obj["add"] = (a: number, b: number) => a + b;
        expect(calc.obj["add"](2, 3)).assertEqual(5);
        expect(typeof calc.obj["add"]).assertEqual("function");
      })

    /**
     * @tc.number SUB_OBJECT_PROP_3200
     * @tc.name objectPropTest3200
     * @tc.desc test delete operator for own property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface BaseI{
          prop?: string;
        }
        const obj: BaseI = objectPropTest3200() as BaseI;
        expect(obj.prop).assertEqual("value");
        objectPropTest3200Del(obj);
        expect(obj.prop).assertEqual(undefined);
        expect(objectPropTest3200_1(obj)).assertFalse();
      })

    /**
     * @tc.number SUB_OBJECT_PROP_3300
     * @tc.name objectPropTest3300
     * @tc.desc test delete operator cannot delete prototype property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(objectPropTest3300()).assertTrue();
        expect(objectPropTest3300_1()).assertEqual("proto-val");
        expect(objectPropTest3300_2()).assertUndefined();
    })

    /**
     * @tc.number SUB_OBJECT_PROP_3400
     * @tc.name objectPropTest3400
     * @tc.desc test NaN as property value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          invalid?: number;
        }

        const math: UserData = { }
        math.invalid = NaN;
        expect(Number.isNaN(math.invalid)).assertTrue();
        expect(math.invalid).not().assertEqual(math.invalid);

      })

    /**
     * @tc.number SUB_OBJECT_PROP_3500
     * @tc.name objectPropTest3500
     * @tc.desc test Infinity as property value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          upper?: number;
          lower?: number;
        }

        const limit: UserData = { }
        limit.upper = Infinity;
        limit.lower = -Infinity;
        expect(limit.upper).assertEqual(Infinity);
        expect(limit.lower).assertEqual(-Infinity);

      })

    /**
     * @tc.number SUB_OBJECT_PROP_3600
     * @tc.name objectPropTest3600
     * @tc.desc test runtime-generated dynamic property name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const userData: UserData = { obj: {} };
        const prefix = "item_";
        const id = "456";
        const dynamicKey = `${prefix}${id}`;
        userData.obj[dynamicKey] = "dynamic-val";
        expect(userData.obj[dynamicKey]).assertEqual("dynamic-val");
        expect(userData.obj["item_456"]).assertEqual("dynamic-val");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_3700
     * @tc.name objectPropTest3700
     * @tc.desc test Object.keys() to get own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myCar: UserData = { obj: {} };
        myCar.obj.make = "Ford";
        myCar.obj.model = "Mustang";
        myCar.obj.extra = "proto-val";
        const keys = Object.keys(myCar.obj);
        expect(keys).assertDeepEquals(["make", "model", "extra"]);

      })

    /**
     * @tc.number SUB_OBJECT_PROP_3800
     * @tc.name objectPropTest3800
     * @tc.desc test Date object as property value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          date?: Date;
        }
        const event: UserData = {}
        event.date = new Date("2024-05-20");
        expect(event.date instanceof Date).assertTrue();
        expect(event.date.getFullYear()).assertEqual(2024);

      })

    /**
     * @tc.number SUB_OBJECT_PROP_3900
     * @tc.name objectPropTest3900
     * @tc.desc test frozen property value (Object.freeze)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface Frozen{
          val: string;
        }
        interface UserData {
          obj: Record<string, Frozen | string>;
        }
        const myCar: UserData = { obj: {} };
        const frozen: Frozen = { val: "frozen" };
        myCar.obj.data = frozen;
        myCar.obj.data.val = "modified";
        expect(myCar.obj.data.val).assertEqual("modified");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4000
     * @tc.name objectPropTest4000
     * @tc.desc test comprehensive property operation (create/access/modify/delete)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, () => {
        interface UserData {
          name: string;
          price: number | undefined;
        }
        const product: UserData = { "name" : "Laptop", "price" : 999 }
        expect(product.name).assertEqual("Laptop");
        expect(product.price).assertEqual(999);
        // Modify
        product.price = 899;
        expect(product.price).assertEqual(899);
        // Delete
        product.price = undefined;
        expect(product.price).assertEqual(undefined);

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4100
     * @tc.name objectPropTest4100
     * @tc.desc test property name with special chars (e.g. #, @)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          obj: Record<string, string>;
        }
        const myCar: UserData = { obj: {} };
        myCar.obj["#tag"] = "test";
        myCar.obj["@user"] = "alice";
        expect(myCar.obj["#tag"]).assertEqual("test");
        expect(myCar.obj["@user"]).assertEqual("alice");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4200
     * @tc.name objectPropTest4200
     * @tc.desc test multi-level nested Object access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface Address {
          city : string;
        }
        interface User {
          address : Address;
        }
        interface UserData {
          user: User;
        }
        const data: UserData = { "user" : { "address" : { "city" : "Beijing" }} }
        expect(data.user.address.city).assertEqual("Beijing");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4300
     * @tc.name objectPropTest4300
     * @tc.desc test Array of Objects as property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface User {
          name : string;
        }
        interface UserData {
          users: User[];
        }
        const list: UserData = { "users" : [{ "name": "Alice" }, { "name": "Bob" }] }
        expect(list.users.length).assertEqual(2);
        expect(list.users[0].name).assertEqual("Alice");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4400
     * @tc.name objectPropTest4400
     * @tc.desc test property value as null (explicit assignment)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          nullVal: object | null;
        }
        const obj: UserData = { "nullVal" : null }
        expect(obj.nullVal).assertEqual(null);
        expect(obj.nullVal).not().assertUndefined();

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4500
     * @tc.name objectPropTest4500
     * @tc.desc test property name with Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface UserData {
          中文属性: string;
          éclairage : string;
        }
        const obj: UserData = { "中文属性" : "测试", "éclairage" : "light" }
        expect(obj.中文属性).assertEqual("测试");
        expect(obj.éclairage).assertEqual("light");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4600
     * @tc.name objectPropTest4600
     * @tc.desc test for...in loop includes inherited enumerable properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(objectPropTest4600()).assertEqual(2); // own + inherited
      })

    /**
     * @tc.number SUB_OBJECT_PROP_4700
     * @tc.name objectPropTest4700
     * @tc.desc test hasOwnProperty returns false for inherited properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const result = objectPropTest4700() as boolean[];
        expect(result[0]).assertTrue();
        expect(result[1]).assertFalse();
      })

    /**
     * @tc.number SUB_OBJECT_PROP_4800
     * @tc.name objectPropTest4800
     * @tc.desc test modifying nested Object property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface BaseData {
          prop? : string;
        }
        interface UserData {
          nested: BaseData;
        }
        const obj: UserData = { "nested" : { } }
        obj.nested.prop = "old";
        obj.nested.prop = "new";
        expect(obj.nested.prop).assertEqual("new");

      })

    /**
     * @tc.number SUB_OBJECT_PROP_4900
     * @tc.name objectPropTest4900
     * @tc.desc test reassigning nested Object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface BaseData {
          prop : string;
        }
        interface UserData {
          nested: BaseData;
        }
        const obj: UserData = { "nested" : { "prop" : "val" } }
        obj.nested.prop = "val1";
        const oldNested = obj.nested;
        expect(oldNested.prop).assertEqual("val1");
        obj.nested.prop = "val2";
        expect(obj.nested.prop).assertEqual("val2");

      })
    /**
     * @tc.number SUB_OBJECT_PROP_5000
     * @tc.name objectPropTest5000
     * @tc.desc object init use Record
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const device: Electronic = {
          brand: 'Apple',
          price: 5999,
          specs: { ['symId']: 'dev-001', ['symConfig']: '256GB' },
          objArr: []
        };

        expect(device.brand).assertEqual('Apple');
        expect(device.specs!['symId']).assertEqual('dev-001');
        expect(device.specs!['symConfig']).assertEqual('256GB');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5100
     * @tc.name objectPropTest5100
     * @tc.desc object prop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        interface Student{
          name: string;
          scores: number[];
        }
        interface ClassRoom{
          grade: string;
          students: Student[];
          teachers: string[];
        }
        const classroom: ClassRoom = {
          grade: '3年级',
          students: [
            { name: '张三', scores: [95, 88, 92] },
            { name: '李四', scores: [89, 91, 94] }
          ],
          teachers: ['王老师', '李老师']
        };

        expect(classroom.grade).assertEqual('3年级');
        expect(classroom.students[0].scores[0]).assertEqual(95);
        expect(classroom.teachers.length).assertEqual(2);
        expect(classroom.students.filter(s => s.scores.includes(95)).length).assertEqual(1);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5200
     * @tc.name objectPropTest5200
     * @tc.desc object prop
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface Calculator{
          num1: number;
          num2: number;
          add?: ()=>number;
          multiply?: ()=>number;
        }
        const calculator: Calculator = {
          num1: 10,
          num2: 20
        };
        calculator.add = () => calculator.num1 + calculator.num2;
        calculator.multiply = () => calculator.num1 * calculator.num2;

        expect(calculator.add()).assertEqual(30);
        expect(calculator.multiply()).assertEqual(200);
        calculator.num1 = 15;
        expect(calculator.add()).assertEqual(35);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5300
     * @tc.name objectPropTest5300
     * @tc.desc object prop
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const user: User = {} as User;
        user.id = 1001;
        user.info = { name: 'Alice', email: 'alice@test.com' };

        expect(user.id).assertEqual(1001);
        expect(user.info.name).assertEqual('Alice');
        expect(user.info.email).assertEqual('alice@test.com');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5400
     * @tc.name objectPropTest5400
     * @tc.desc object prop class in class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class DateRange implements GeneratedTypeLiteralInterface_2{
          start: string;
          end: string;
          constructor(start: string, end: string) {
            this.start = start;
            this.end = end;
          }
        }

        const order: GeneratedObjectLiteralInterface_1 = {
          orderId: 'ORD-001',
          product: 'Laptop',
          validPeriod: new DateRange('2024-01-01', '2024-12-31')
        };

        expect(order.orderId).assertEqual('ORD-001');
        expect(order.validPeriod.start).assertEqual('2024-01-01');
        expect(order.validPeriod.end).assertEqual('2024-12-31');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5500
     * @tc.name objectPropTest5500
     * @tc.desc object prop use Object.create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const toolBox = objectPropTest5500();
        expect(toolBox.name).assertEqual('Hand Tool Box');
        expect(toolBox.tools[0].weight).assertEqual('1kg');
        expect(toolBox.tools[1].use()).assertEqual('cut materials');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5600
     * @tc.name objectPropTest5600
     * @tc.desc object prop default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class Phone{
          brand: string;
          model: string;
          color: string;
          constructor(brand: string, model: string, color: string = 'Black') {
            this.brand = brand;
            this.model = model;
            this.color = color;
          }
        }

        const phone1 = new Phone('Samsung', 'S24');
        const phone2 = new Phone('Xiaomi', '14', 'White');

        expect(phone1.color).assertEqual('Black');
        expect(phone2.color).assertEqual('White');
        expect(phone1.brand).assertEqual('Samsung');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5700
     * @tc.name objectPropTest5700
     * @tc.desc object prop change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Counter{
          count: number;
          constructor(count: number) {
            this.count = count;
          }
          increment(step: number = 1) {
            this.count += step;
          }
          reset(){
            this.count = 0;
          }
        }

        const counter = new Counter(5);
        counter.increment(3);
        expect(counter.count).assertEqual(8);
        counter.reset();
        expect(counter.count).assertEqual(0);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5800
     * @tc.name objectPropTest5800
     * @tc.desc object prop static change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Product{
          static totalCount: number = 0;
          name: string;
          constructor(name: string) {
            this.name = name;
            Product.totalCount = (Product.totalCount || 0) + 1;
          }
        }

        Product.totalCount = 0;

        new Product('Shirt');
        new Product('Pants');
        new Product('Shoes');

        expect(Product.totalCount).assertEqual(3);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_5900
     * @tc.name objectPropTest5900
     * @tc.desc object prop change other prop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class Address{
          city: string;
          street: string;
          constructor(city: string, street: string) {
            this.city = city;
            this.street = street;
          }
        }
        class Customer{
          name: string;
          address: Address;
          constructor(name: string, address: Address) {
            this.name = name;
            this.address = address;
          }
        }

        const customer = new Customer('Bob', new Address('Guangzhou', 'Tianhe Rd'));

        expect(customer.name).assertEqual('Bob');
        expect(customer.address.city).assertEqual('Guangzhou');
        expect(customer.address.street).assertEqual('Tianhe Rd');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6000
     * @tc.name objectPropTest6000
     * @tc.desc object prop  Object.create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface UserData{
          a: number;
          getA: ()=>number;
          b?: number;
          getB?: ()=>number;
          c?: number;
          getC?: ()=>number;
        }
        const grandparent: UserData = { a: 10, getA: () => grandparent.a };

        const parent = objectPropTest6600(grandparent) as UserData;
        parent.b = 20;
        const child = objectPropTest6600(parent) as UserData;
        child.c = 30;
        child.getA = () => child.a;
        child.getB = () => child.b!;
        child.getC = () => child.c!;

        expect(child.a).assertEqual(10);
        expect(child.getB!()).assertEqual(20);
        expect(child.getC()).assertEqual(30);
        expect(child.getA()).assertEqual(10);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6100
     * @tc.name objectPropTest6100
     * @tc.desc object prop Object.create can not delete prop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        interface BaseI{
          base?: string;
          nonConfigurable?: string;
        }
        const obj = createObj() as BaseI;

        expect(obj.nonConfigurable).assertEqual('cannotDelete');
        expect(deleteNonConfigurable(obj)).assertFalse();
        expect(obj.nonConfigurable).assertEqual('cannotDelete');
        expect(deleteBase(obj)).assertEqual(true);
        expect(obj.base).assertUndefined();

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6200
     * @tc.name objectPropTest6200
     * @tc.desc object prop Object.create override function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const toolProto: Tool = {
          type: 'Basic Tool',
          use: () => 'use basic function'
        };

        const hammer = objectPropTest6600(toolProto) as Tool;
        hammer.type = 'Hammer';
        hammer.use = () => 'drive nails';

        const screwdriver = objectPropTest6600(toolProto) as Tool;
        screwdriver.use = () => 'use basic function'
        screwdriver.type = 'Screwdriver';

        expect(hammer.use()).assertEqual('drive nails');
        expect(screwdriver.use()).assertEqual('use basic function');
        expect(hammer.type).assertEqual('Hammer');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6300
     * @tc.name objectPropTest6300
     * @tc.desc object prop（NaN/Infinity）
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        interface SpecialObj{
          nanVal: number;
          infVal: number;
          negInfVal: number;
          isNan: (val: number) => boolean;
        }
        const specialObj: SpecialObj = {
          nanVal: NaN,
          infVal: Infinity,
          negInfVal: -Infinity,
          isNan: (val: number) => isNaN(val)
        };

        expect(isNaN(specialObj.nanVal)).assertEqual(true);
        expect(specialObj.infVal).assertEqual(Infinity);
        expect(specialObj.negInfVal).assertEqual(-Infinity);
        expect(specialObj.isNan(specialObj.nanVal)).assertEqual(true);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6400
     * @tc.name objectPropTest6400
     * @tc.desc When testing the constructor without a new call, this points to (boundary scenario)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectPropTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        class TestThis{
          name: string;
          constructor(name: string) {
            this.name = name;
          }
        }

        // use new
        const testWithNew = new TestThis('Instance Test');
        expect(testWithNew.name).assertEqual('Instance Test');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6500
     * @tc.name objectPropTest6500
     * @tc.desc Test Object. create creates an object that accesses non-existent prototype properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectPropTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        interface Proto{
          existProp: string;
          nonExistProp?: object;
        }
        const proto: Proto = { existProp: 'value' };
        const obj = objectPropTest6600(proto) as Proto;

        expect(obj.existProp).assertEqual('value');
        expect(obj.nonExistProp).assertUndefined();

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6600
     * @tc.name objectPropTest6600
     * @tc.desc constructor+Object.create
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectPropTest6600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class Shop{
          name: string;
          products: string[];
          addProduct: (product: string)=>void = (product: string)=>{this.products.push(product)}
          constructor(name: string) {
            this.name = name;
            this.products =[];
          }
        }
        const techShop = new Shop('Tech Mall');

        expect(techShop.name).assertEqual('Tech Mall');
        techShop.addProduct('Dell');
        expect(techShop.products.length).assertEqual(1);

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6700
     * @tc.name objectPropTest6700
     * @tc.desc object init+constructor+Object.create
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectPropTest6700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class ConfigProto{
          theme: string;
          fontSize: string;
          constructor(theme: string, fontSize: string) {
            this.theme = theme;
            this.fontSize = fontSize;
          }
          updateFontSize(size: string){
            this.fontSize = size;
          };
        }
        const configProto = new ConfigProto('light', '16px');

        class User{
          id: number;
          name: string;
          config: ConfigProto;
          constructor(id: number, name: string) {
            this.id = id;
            this.name = name;
            this.config = new ConfigProto(configProto.theme, configProto.fontSize);
          }
        }

        interface AppData{
          version: string;
          activeUser: User;
          lastUpdate: string;
        }
        const appData: AppData = {
          version: 'v2.1.0',
          activeUser: new User(101, 'Charlie'),
          lastUpdate: '2024-05-01'
        };

        appData.activeUser.config.updateFontSize('14px');
        expect(appData.version).assertEqual('v2.1.0');
        expect(appData.activeUser.name).assertEqual('Charlie');
        expect(appData.activeUser.config.fontSize).assertEqual('14px');
        expect(appData.activeUser.config.theme).assertEqual('light');

      });

    /**
     * @tc.number SUB_OBJECT_PROP_6800
     * @tc.name objectPropTest6800
     * @tc.desc 3 cases to create object
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectPropTest6800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        class OrderItem{
          name: string;
          price: number;
          quantity: number;
          constructor(name: string, price: number, quantity: number) {
            this.name = name;
            this.price = price;
            this.quantity = quantity;
          }
          getTotal(): number{
            return this.price;
          }
        }

        interface OrderStatus{
          status: string;
          updateStatus:(newStatus: string)=>void;
          getStatusDesc: ()=>string;
        }
        const orderStatusProto: OrderStatus = {
          status: 'pending',
          updateStatus: (newStatus: string)=> {
            orderStatusProto.status = newStatus;
          },
          getStatusDesc: ()=> {
            const descMap: Record<string, string> = { ['pending']: '待支付', ['paid']: '已支付', ['shipped']: '已发货' };
            return descMap[orderStatusProto.status] || '未知状态';
          }
        };

        interface User{
          id: number;
          name: string;
        }
        interface Order{
          orderId: string;
          user: User;
          items: OrderItem[];
          orderStatus: OrderStatus;
          getOrderTotal: ()=>number;
        }
        const order: Order = {
          orderId: 'ORD-20240501-001',
          user: { id: 202, name: 'David' },
          items: [
            new OrderItem('Mouse', 29.9, 1),
            new OrderItem('Keyboard', 99, 1)
          ],
          orderStatus: orderStatusProto,
          getOrderTotal: ()=> {
            return order.items.reduce((sum, item): number => sum + item.getTotal(), 0);
          }
        };

        order.orderStatus.updateStatus('paid');
        const itemTotal = order.items[0].getTotal() + order.items[1].getTotal();

        expect(order.orderId).assertEqual('ORD-20240501-001');
        expect(order.orderStatus.getStatusDesc()).assertEqual('已支付');
        expect(order.getOrderTotal()).assertEqual(itemTotal);
        expect(order.getOrderTotal()).assertEqual(128.9);
      });
  })
}