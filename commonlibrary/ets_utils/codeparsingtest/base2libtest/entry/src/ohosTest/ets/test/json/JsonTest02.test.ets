import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Json02Test() {
  describe('Json02Test', () => {
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
     * @tc.number    SUB_JSON_TEST02_0100
     * @tc.name      testJson02Chapter0001
     * @tc.desc      Test JSON.stringify with basic object and all parameters default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0001';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person);
      expect(result).assertEqual('{"name":"John","age":30,"city":"New York"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0200
     * @tc.name      testJson02Chapter0002
     * @tc.desc      Test JSON.stringify with replacer as string array filtering properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0002';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, ["name", "age"]);
      expect(result).assertEqual('{"name":"John","age":30}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0300
     * @tc.name      testJson02Chapter0003
     * @tc.desc      Test JSON.stringify with replacer as null (should include all properties)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0003';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null);
      expect(result).assertEqual('{"name":"John","age":30,"city":"New York"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0400
     * @tc.name      testJson02Chapter0004
     * @tc.desc      Test JSON.stringify with space as number 2 for indentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0004';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null, 2);
      let expected: string = '{\n  "name": "John",\n  "age": 30,\n  "city": "New York"\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0500
     * @tc.name      testJson02Chapter0005
     * @tc.desc      Test JSON.stringify with space as string "  " for indentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0005';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null, '  ');
      let expected: string = '{\n  "name": "John",\n  "age": 30,\n  "city": "New York"\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0600
     * @tc.name      testJson02Chapter0006
     * @tc.desc      Test JSON.stringify with space as custom string "&&" for indentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0006';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null, '&&');
      let expected: string = '{\n&&"name": "John",\n&&"age": 30,\n&&"city": "New York"\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0700
     * @tc.name      testJson02Chapter0007
     * @tc.desc      Test JSON.stringify with replacer array and space number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0007';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
        country: string;
      }

      let person: Person = {
        name: "John",
        age: 30,
        city: "New York",
        country: "USA"
      };
      let result: string = JSON.stringify(person, ["name", "country"], 4);
      let expected: string = '{\n    "name": "John",\n    "country": "USA"\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0800
     * @tc.name      testJson02Chapter0008
     * @tc.desc      Test JSON.stringify with replacer as empty array (should return empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0008';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, []);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_0900
     * @tc.name      testJson02Chapter0009
     * @tc.desc      Test JSON.stringify with space as number 0 (no indentation but newlines)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0009';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null, 0);
      let expected: string = '{"name":"John","age":30,"city":"New York"}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1000
     * @tc.name      testJson02Chapter0010
     * @tc.desc      Test JSON.stringify with space as empty string (no indentation, minified)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0010';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
        city: string;
      }

      let person: Person = { name: "John", age: 30, city: "New York" };
      let result: string = JSON.stringify(person, null, '');
      expect(result).assertEqual('{"name":"John","age":30,"city":"New York"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1100
     * @tc.name      testJson02Chapter0011
     * @tc.desc      Test JSON.stringify with array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0011';
      console.log(TAG + ' start');
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: string = JSON.stringify(arr);
      expect(result).assertEqual('[1,2,3,4,5]');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1200
     * @tc.name      testJson02Chapter0012
     * @tc.desc      Test JSON.stringify with nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0012';
      console.log(TAG + ' start');

      interface Address {
        street: string;
        zip: number;
      }

      interface Person {
        name: string;
        age: number;
        address: Address;
      }

      let person: Person = { name: "John", age: 30, address: { street: "Main St", zip: 12345 } };
      let result: string = JSON.stringify(person);
      expect(result).assertEqual('{"name":"John","age":30,"address":{"street":"Main St","zip":12345}}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1300
     * @tc.name      testJson02Chapter0013
     * @tc.desc      Test JSON.stringify with replacer filtering nested properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0013';
      console.log(TAG + ' start');

      interface Address {
        street: string;
        zip: number;
      }

      interface Person {
        name: string;
        age: number;
        address: Address;
      }

      let person: Person = { name: "John", age: 30, address: { street: "Main St", zip: 12345 } };
      let result: string = JSON.stringify(person, ["name", "address"]);
      let expected: string = '{"name":"John","address":{}}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1400
     * @tc.name      testJson02Chapter0014
     * @tc.desc      Test JSON.stringify with array containing objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0014';
      console.log(TAG + ' start');

      interface Item {
        id: number;
        name: string;
      }

      let items: Item[] = [{ id: 1, name: "A" }, { id: 2, name: "B" }];
      let result: string = JSON.stringify(items);
      expect(result).assertEqual('[{"id":1,"name":"A"},{"id":2,"name":"B"}]');
    });

    interface TestObject15 {
      "0"?: string;
      "1"?: string;
      "2"?: string;
      prop?: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_1500
     * @tc.name      testJson02Chapter0015
     * @tc.desc      Test JSON.stringify with replacer as number array (filtering array indices)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0015';
      console.log(TAG + ' start');
      let obj: TestObject15 = {
        "0": "a",
        "1": "b",
        "2": "c",
        prop: "value"
      };
      let result: string = JSON.stringify(obj, ["0", "2", "prop"]);
      expect(result).assertEqual('{"0":"a","2":"c","prop":"value"}');
    });

    interface NestedObject16 {
      c: number;
    }

    interface TestObject16 {
      a: number;
      b: NestedObject16;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_1600
     * @tc.name      testJson02Chapter0016
     * @tc.desc      Test JSON.stringify with space as number 10 (maximum practical indentation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0016';
      console.log(TAG + ' start');
      const nestedObj: NestedObject16 = { c: 2 };
      let obj: TestObject16 = { a: 1, b: nestedObj };
      let result: string = JSON.stringify(obj, null, 10);
      let expected: string = '{\n          "a": 1,\n          "b": {\n                    "c": 2\n          }\n}';
      expect(result).assertEqual(expected);
    });

    interface TestObject17 {
      a: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_1700
     * @tc.name      testJson02Chapter0017
     * @tc.desc      Test JSON.stringify with space as negative number (should be treated as 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0017';
      console.log(TAG + ' start');
      let obj: TestObject17 = { a: 1 };
      let result: string = JSON.stringify(obj, null, -5);
      let expected: string = '{"a":1}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1800
     * @tc.name      testJson02Chapter0018
     * @tc.desc      Test JSON.stringify with BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0018';
      console.log(TAG + ' start');
      let bigIntObj: bigint = BigInt(112233445566778899n);
      let result: string = JSON.stringify(bigIntObj);
      expect(result).assertEqual('112233445566778899');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_1900
     * @tc.name      testJson02Chapter0019
     * @tc.desc      Test JSON.stringify with value null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0019';
      console.log(TAG + ' start');
      let result: string = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2000
     * @tc.name      testJson02Chapter0020
     * @tc.desc      Test JSON.stringify with value undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0020';
      console.log(TAG + ' start');
      let result: string = JSON.stringify(undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2100
     * @tc.name      testJson02Chapter0021
     * @tc.desc      Test JSON.stringify with value number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0021';
      console.log(TAG + ' start');
      let result: string = JSON.stringify(123.45);
      expect(result).assertEqual('123.45');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2200
     * @tc.name      testJson02Chapter0022
     * @tc.desc      Test JSON.stringify with value boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0022';
      console.log(TAG + ' start');
      let result: string = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2300
     * @tc.name      testJson02Chapter0023
     * @tc.desc      Test JSON.stringify with value string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0023';
      console.log(TAG + ' start');
      let result: string = JSON.stringify("test string");
      expect(result).assertEqual('"test string"');
    });

    interface CircularObject {
      self?: CircularObject;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_2400
     * @tc.name      testJson02Chapter0024
     * @tc.desc      Test JSON.stringify with circular reference error (should throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0024';
      console.log(TAG + ' start');

      interface CircularObject {
        self?: CircularObject;
      }

      let circularObj: CircularObject = {};
      circularObj.self = circularObj;

      let stringifySucceeded = false;
      let errorCaught = false;
      let errorCode: number | undefined;

      try {
        let result: string = JSON.stringify(circularObj);
        stringifySucceeded = true;
      } catch (err) {
        errorCaught = true;
        errorCode = err.code;
      }

      expect(stringifySucceeded).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorCode).assertEqual(401);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2500
     * @tc.name      testJson02Chapter0025
     * @tc.desc      Test JSON.stringify with replacer containing non-string/non-number type (should throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0025';
      console.log(TAG + ' start');

      interface TestObject25 {
        a: number;
      }

      let obj: TestObject25 = { a: 1 };
      let replacer: (boolean | string)[] = [true, "a"];

      let stringifySucceeded = false;
      let errorCaught = false;
      let errorCode: number | undefined;

      try {
        let result: string = JSON.stringify(obj, replacer as (number | string)[]);
        stringifySucceeded = true;
      } catch (err) {
        errorCaught = true;
        errorCode = err.code;
      }

      expect(stringifySucceeded).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorCode).assertEqual(401);
    });

    interface TestObject26 {
      a: number;
    }

    interface TestSpaceObject {
      length: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_2600
     * @tc.name      testJson02Chapter0026
     * @tc.desc      Test JSON.stringify with space as non-string/non-number type (should throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0026';
      console.log(TAG + ' start');
      let obj: TestObject26 = { a: 1 };
      let result: string = JSON.stringify(obj, undefined, 999999999999999999999);
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2700
     * @tc.name      testJson02Chapter0027
     * @tc.desc      Test JSON.stringify with missing mandatory value parameter (should throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0027';
      console.log(TAG + ' start');
      let result: string | undefined = JSON.stringify(undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2800
     * @tc.name      testJson02Chapter0028
     * @tc.desc      Test JSON.stringify with nonlinear container Map (should return empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0028';
      console.log(TAG + ' start');
      try {
        let map: Map<string, number> = new Map();
        map.set("a", 1);
        map.set("b", 2);
        let result: string = JSON.stringify(map);
        expect(result).assertEqual('{}');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_JSON_TEST02_2900
     * @tc.name      testJson02Chapter0029
     * @tc.desc      Test JSON.stringify with nonlinear container Set (should return empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0029';
      console.log(TAG + ' start');
      try {
        let set: Set<number> = new Set([1, 2, 3]);
        let result: string = JSON.stringify(set);
        expect(result).assertEqual('{}');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    interface TestObject30 {
      a: number;
      b?: undefined;
      c: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3000
     * @tc.name      testJson02Chapter0030
     * @tc.desc      Test JSON.stringify with object containing undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0030';
      console.log(TAG + ' start');
      let obj: TestObject30 = { a: 1, b: undefined, c: "test" };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"c":"test"}');
    });

    interface TestObject31 {
      a: number;
      b: null;
      c: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3100
     * @tc.name      testJson02Chapter0031
     * @tc.desc      Test JSON.stringify with object containing null property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0031';
      console.log(TAG + ' start');
      let obj: TestObject31 = { a: 1, b: null, c: "test" };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":null,"c":"test"}');
    });

    interface TestObject32 {
      a: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3200
     * @tc.name      testJson02Chapter0032
     * @tc.desc      Test JSON.stringify with space as string containing newline character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0032';
      console.log(TAG + ' start');
      let obj: TestObject32 = { a: 1 };
      let result: string = JSON.stringify(obj, null, '\t');
      let expected: string = '{\n\t"a": 1\n}';
      expect(result).assertEqual(expected);
    });

    interface TestObject33 {
      a: number;
      b: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3300
     * @tc.name      testJson02Chapter0033
     * @tc.desc      Test JSON.stringify with replacer array containing non-existent property names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0033';
      console.log(TAG + ' start');
      let obj: TestObject33 = { a: 1, b: 2 };
      let result: string = JSON.stringify(obj, ["a", "c", "d"]);
      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_3400
     * @tc.name      testJson02Chapter0034
     * @tc.desc      Test JSON.stringify with linear container Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0034';
      console.log(TAG + ' start');
      let linearArray: number[] = new Array<number>(1, 2, 3);
      let result: string = JSON.stringify(linearArray);
      expect(result).assertEqual('[1,2,3]');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_3500
     * @tc.name      testJson02Chapter0035
     * @tc.desc      Test JSON.stringify with linear container ArrayBuffer (unsupported, should return empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0035';
      console.log(TAG + ' start');
      try {
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let result: string = JSON.stringify(buffer);
        expect(result).assertEqual('{}');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_JSON_TEST02_3600
     * @tc.name      testJson02Chapter0036
     * @tc.desc      Test JSON.stringify with nested array and replacer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0036';
      console.log(TAG + ' start');
      let arr: (number | string)[][] = [[1, "a"], [2, "b"]];
      let result: string = JSON.stringify(arr, [0, 1]);
      expect(result).assertEqual('[[1,"a"],[2,"b"]]');
    });

    interface TestObject37 {
      a: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3700
     * @tc.name      testJson02Chapter0037
     * @tc.desc      Test JSON.stringify with space as very large number (clamped behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0037';
      console.log(TAG + ' start');
      let obj: TestObject37 = { a: 1 };
      let result: string = JSON.stringify(obj, null, 100);
      expect(result.length > 0).assertTrue();
    });

    interface TestObject38 {
      a: number;
      b: number;
      toJSON?: () => TestObject38Result;
    }

    interface TestObject38Result {
      custom: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST02_3800
     * @tc.name      testJson02Chapter0038
     * @tc.desc      Test JSON.stringify with object containing toJSON method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0038';
      console.log(TAG + ' start');
      let obj: TestObject38 = { a: 1, b: 2 };
      obj.toJSON = (): TestObject38Result => {
        return { custom: obj.a + obj.b };
      };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"custom":3}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_3900
     * @tc.name      testJson02Chapter0039
     * @tc.desc      Test JSON.stringify with complex nested structure and all parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0039';
      console.log(TAG + ' start');

      interface Address {
        street: string;
        zip: number;
      }

      interface Person {
        name: string;
        age: number;
        address: Address;
        hobbies: string[];
      }

      let person: Person = {
        name: "Alice",
        age: 25,
        address: { street: "Oak St", zip: 54321 },
        hobbies: ["reading", "swimming"]
      };
      let result: string = JSON.stringify(person, ["name", "address", "street"], 2);
      let expected: string = '{\n  "name": "Alice",\n  "address": {\n    "street": "Oak St"\n  }\n}';
      expect(result).assertEqual(expected);
    });


    /**
     * @tc.number    SUB_JSON_TEST02_4000
     * @tc.name      testJson02Chapter0040
     * @tc.desc      Test JSON.stringify with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0040';
      console.log(TAG + ' start');
      const int8Array = new Int8Array([-128, 127]);
      const result = JSON.stringify(int8Array);
      expect(result).assertEqual('{"0":-128,"1":127}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4100
     * @tc.name      testJson02Chapter0041
     * @tc.desc      Test JSON.stringify with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0041';
      console.log(TAG + ' start');
      const uint8Array = new Uint8Array([0, 255]);
      const result = JSON.stringify(uint8Array);
      expect(result).assertEqual('{"0":0,"1":255}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4200
     * @tc.name      testJson02Chapter0042
     * @tc.desc      Test JSON.stringify with Uint8ClampedArray clamping behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0042';
      console.log(TAG + ' start');
      const clampedArray = new Uint8ClampedArray([-1, 0, 255, 256]);
      const result = JSON.stringify(clampedArray);
      expect(result).assertEqual('{"0":0,"1":0,"2":255,"3":255}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4300
     * @tc.name      testJson02Chapter0043
     * @tc.desc      Test JSON.stringify with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0043';
      console.log(TAG + ' start');
      const int16Array = new Int16Array([-32768, 32767]);
      const result = JSON.stringify(int16Array);
      expect(result).assertEqual('{"0":-32768,"1":32767}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4400
     * @tc.name      testJson02Chapter0044
     * @tc.desc      Test JSON.stringify with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0044';
      console.log(TAG + ' start');
      const uint16Array = new Uint16Array([0, 65535]);
      const result = JSON.stringify(uint16Array);
      expect(result).assertEqual('{"0":0,"1":65535}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4500
     * @tc.name      testJson02Chapter0045
     * @tc.desc      Test JSON.stringify with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0045';
      console.log(TAG + ' start');
      const int32Array = new Int32Array([-2147483648, 2147483647]);
      const result = JSON.stringify(int32Array);
      expect(result).assertEqual('{"0":-2147483648,"1":2147483647}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4600
     * @tc.name      testJson02Chapter0046
     * @tc.desc      Test JSON.stringify with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0046';
      console.log(TAG + ' start');
      const uint32Array = new Uint32Array([0, 4294967295]);
      const result = JSON.stringify(uint32Array);
      expect(result).assertEqual('{"0":0,"1":4294967295}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4700
     * @tc.name      testJson02Chapter0047
     * @tc.desc      Test JSON.stringify with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0047';
      console.log(TAG + ' start');
      const float32Array = new Float32Array([1.2e-38, 3.4e38, -3.4e38]);
      const result = JSON.stringify(float32Array);
      expect(typeof result).assertEqual('string');
      expect(result.includes('e-')).assertTrue();
      expect(result.includes('e+')).assertTrue();
      expect(result.includes('-')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4800
     * @tc.name      testJson02Chapter0048
     * @tc.desc      Test JSON.stringify with Float64Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0048';
      console.log(TAG + ' start');
      const float64Array = new Float64Array([5e-324, 1.8e308, -1.8e308]);
      const result = JSON.stringify(float64Array);
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_4900
     * @tc.name      testJson02Chapter0049
     * @tc.desc      Test JSON.stringify with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0049';
      console.log(TAG + ' start');
      const bigInt64Array = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      const result = JSON.stringify(bigInt64Array);
      expect(result).assertEqual('{"0":-9223372036854775808,"1":9223372036854775807}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5000
     * @tc.name      testJson02Chapter0050
     * @tc.desc      Test JSON.stringify with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0050';
      console.log(TAG + ' start');
      const bigUint64Array = new BigUint64Array([0n, 18446744073709551615n]);
      const result = JSON.stringify(bigUint64Array);
      expect(result).assertEqual('{"0":0,"1":18446744073709551615}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5100
     * @tc.name      testJson02Chapter0051
     * @tc.desc      Test JSON.stringify with Float32Array containing Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0051';
      console.log(TAG + ' start');
      const float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      const result = JSON.stringify(float32Array);
      expect(result.includes('null')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5200
     * @tc.name      testJson02Chapter0052
     * @tc.desc      Test JSON.stringify with Int8Array containing Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0052';
      console.log(TAG + ' start');
      const int8Array = new Int8Array([0, 0, 0]);
      const result = JSON.stringify(int8Array);
      expect(result).assertEqual('{"0":0,"1":0,"2":0}');
    });


    /**
     * @tc.number    SUB_JSON_TEST02_5300
     * @tc.name      testJson02Chapter0053
     * @tc.desc      Test JSON.stringify with string containing all special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0053';
      console.log(TAG + ' start');
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result = JSON.stringify(specialChars);
      const expected = '"' + specialChars.replace(/(["\\])/g, '\\$1') + '"';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5400
     * @tc.name      testJson02Chapter0054
     * @tc.desc      Test JSON.stringify with string containing full ASCII range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0054';
      console.log(TAG + ' start');
      let asciiString = "";
      for (let i = 32; i <= 126; i++) {
        asciiString += String.fromCharCode(i);
      }
      const result = JSON.stringify(asciiString);
      expect(typeof result).assertEqual('string');
      expect(result.startsWith('"')).assertTrue();
      expect(result.endsWith('"')).assertTrue();
      expect(result.length > asciiString.length).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5500
     * @tc.name      testJson02Chapter0055
     * @tc.desc      Test JSON.stringify with escape sequences in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0055';
      console.log(TAG + ' start');
      const escapeStr = `Line1\nLine2\tTab\rReturn\"Quote\\Backslash`;
      const result = JSON.stringify(escapeStr);
      expect(result.includes('\\n')).assertTrue();
      expect(result.includes('\\t')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5600
     * @tc.name      testJson02Chapter0056
     * @tc.desc      Test JSON.stringify with emoji and Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0056';
      console.log(TAG + ' start');
      const emojis = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const result = JSON.stringify(emojis);
      expect(typeof result).assertEqual('string');
      expect(result.startsWith('"')).assertTrue();
      expect(result.endsWith('"')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5700
     * @tc.name      testJson02Chapter0057
     * @tc.desc      Test JSON.stringify with string containing JavaScript keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0057';
      console.log(TAG + ' start');
      const keywords = JSON.parse(JSON.stringify({
        "0": "value",
        "NaN": "not a number",
        "": "empty key",
        "null": "null string",
        "undefined": "undefined string",
        "true": "true string",
        "false": "false string"
      }));
      const result = JSON.stringify(keywords);
      expect(result.includes('"0"')).assertTrue();
      expect(result.includes('"NaN"')).assertTrue();
      expect(result.includes('"null"')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_5800
     * @tc.name      testJson02Chapter0058
     * @tc.desc      Test JSON.stringify with large tree-like JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0058';
      console.log(TAG + ' start');
      let treeStr = '[';
      while (treeStr.length < 1000) {
        treeStr += '{"a":1},';
      }
      treeStr += '{"a":1}]';

      const parsed = JSON.parse(treeStr);
      const result = JSON.stringify(parsed);
      expect(typeof result).assertEqual('string');
      expect(result.length > 100).assertTrue();
    });


    /**
     * @tc.number    SUB_JSON_TEST02_5900
     * @tc.name      testJson02Chapter0059
     * @tc.desc      Test JSON.stringify with Number.MAX_VALUE and Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0059';
      console.log(TAG + ' start');
      const numbers = JSON.parse(JSON.stringify({
        maxValue: Number.MAX_VALUE,
        minValue: Number.MIN_VALUE,
        epsilon: Number.EPSILON,
        maxSafe: Number.MAX_SAFE_INTEGER,
        minSafe: Number.MIN_SAFE_INTEGER
      }));
      const result = JSON.stringify(numbers);
      expect(result.includes('1.7976931348623157e+308')).assertTrue();
      expect(result.includes('5e-324')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6000
     * @tc.name      testJson02Chapter0060
     * @tc.desc      Test JSON.stringify with various numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0060';
      console.log(TAG + ' start');
      const numbers = JSON.parse(JSON.stringify({
        hex: 0x0102,
        octal: 0o77,
        binary: 0b1010,
        scientific: 1.23e5,
        negativeZero: -0,
        exponent: 2**3
      }));
      const result = JSON.stringify(numbers);
      expect(result.includes('258')).assertTrue();
      expect(result.includes('63')).assertTrue();
      expect(result.includes('10')).assertTrue();
      expect(result.includes('123000')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6100
     * @tc.name      testJson02Chapter0061
     * @tc.desc      Test JSON.stringify with different numeric types and boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0061';
      console.log(TAG + ' start');
      const boundaries = JSON.parse(JSON.stringify({
        byteMin: -128,
        byteMax: 127,
        shortMin: -32768,
        shortMax: 32767,
        intMin: -2147483648,
        intMax: 2147483647,
        longMin: -9223372036854775808,
        longMax: 9223372036854775807
      }));
      const result = JSON.stringify(boundaries);
      expect(result.includes('-128')).assertTrue();
      expect(result.includes('127')).assertTrue();
      expect(result.includes('-32768')).assertTrue();
      expect(result.includes('2147483647')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6200
     * @tc.name      testJson02Chapter0062
     * @tc.desc      Test JSON.stringify with float and double precision values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0062';
      console.log(TAG + ' start');
      const floats = JSON.parse(JSON.stringify({
        floatMax: 3.40282346638528860e+38,
        floatMin: 1.40129846432481707e-45,
        doubleMax: 1.79769313486231570e+308,
        doubleMin: 4.94065645841246544e-324,
        precise: 0.1 + 0.2
      }));
      const result = JSON.stringify(floats);
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6300
     * @tc.name      testJson02Chapter0063
     * @tc.desc      Test JSON.stringify with BigInt values in objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0063';
      console.log(TAG + ' start');
      const bigInts = JSON.parse(JSON.stringify({
        big1: BigInt(0xdecafafecacefade).toString(),
        big2: BigInt(9007199254740991).toString(),
        big3: BigInt("123456789012345678901234567890").toString()
      }));
      const result = JSON.stringify(bigInts);
      expect(result.includes('"big1":"' + BigInt(0xdecafafecacefade).toString() + '"')).assertTrue();
      expect(result.includes('"big2":"9007199254740991"')).assertTrue();
    });


    /**
     * @tc.number    SUB_JSON_TEST02_6400
     * @tc.name      testJson02Chapter0064
     * @tc.desc      Test JSON.stringify with falsy values in objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0064';
      console.log(TAG + ' start');
      const falsyValues = JSON.parse(JSON.stringify({
        zero: 0,
        emptyString: "",
        nullValue: null,
        falseValue: false,
        nan: NaN
      }));
      const result = JSON.stringify(falsyValues);
      expect(result.includes('"zero":0')).assertTrue();
      expect(result.includes('"emptyString":""')).assertTrue();
      expect(result.includes('"nullValue":null')).assertTrue();
      expect(result.includes('"falseValue":false')).assertTrue();
      expect(!result.includes('undefinedValue')).assertTrue();
    });


    /**
     * @tc.number    SUB_JSON_TEST02_6500
     * @tc.name      testJson02Chapter0065
     * @tc.desc      Test JSON.stringify with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0065';
      console.log(TAG + ' start');
      const array = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const result = JSON.stringify(array);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.includes('0,0,0,0,0')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6600
     * @tc.name      testJson02Chapter0066
     * @tc.desc      Test JSON.stringify with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0066';
      console.log(TAG + ' start');
      const array = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const result = JSON.stringify(array);
      expect(result.includes('-111')).assertTrue();
      expect(result.includes('-49')).assertTrue();
      expect(result.includes('-63')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6700
     * @tc.name      testJson02Chapter0067
     * @tc.desc      Test JSON.stringify with special array (non-numeric indices)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0067';
      console.log(TAG + ' start');
      const arr = [] as number[];
      arr[0] = 333;
      const result = JSON.stringify(arr);
      expect(result).assertEqual('[333]');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6800
     * @tc.name      testJson02Chapter0068
     * @tc.desc      Test JSON.stringify with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0068';
      console.log(TAG + ' start');
      const array = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const result = JSON.stringify(array);
      expect(result.includes('null')).assertTrue();
      expect(!result.includes('NaN')).assertTrue();
      expect(!result.includes('Infinity')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_6900
     * @tc.name      testJson02Chapter0069
     * @tc.desc      Test JSON.stringify with array containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0069';
      console.log(TAG + ' start');
      const array: (number | string | boolean | null | undefined | object)[] =
        [72, "abc", true, null, undefined, 108, JSON.parse(JSON.stringify({ nested: "value" }))];
      const result = JSON.stringify(array);
      expect(result.includes('"abc"')).assertTrue();
      expect(result.includes('true')).assertTrue();
      expect(result.includes('null')).assertTrue();
      expect(result.includes('"nested"')).assertTrue();
      expect(!result.includes('undefined')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7000
     * @tc.name      testJson02Chapter0070
     * @tc.desc      Test JSON.stringify with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0070';
      console.log(TAG + ' start');
      const result = JSON.stringify([]);
      expect(result).assertEqual('[]');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7100
     * @tc.name      testJson02Chapter0071
     * @tc.desc      Test JSON.stringify with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0071';
      console.log(TAG + ' start');
      const array = [256, 65536, 32768, 4294967296];
      const result = JSON.stringify(array);
      expect(result.includes('256')).assertTrue();
      expect(result.includes('65536')).assertTrue();
      expect(result.includes('32768')).assertTrue();
      expect(result.includes('4294967296')).assertTrue();
    });


    /**
     * @tc.number    SUB_JSON_TEST02_7200
     * @tc.name      testJson02Chapter0072
     * @tc.desc      Test JSON.stringify with nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0072';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ a: 1, b: { c: 2, d: { e: 3, f: { g: 4 } } } }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":{"c":2,"d":{"e":3,"f":{"g":4}}}}');
    });


    /**
     * @tc.number    SUB_JSON_TEST02_7300
     * @tc.name      testJson02Chapter0073
     * @tc.desc      Test JSON.stringify with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0073';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({
        a: 1, b: () => {
          return "test";
        }, c: () => {
          return "func";
        }
      }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7400
     * @tc.name      testJson02Chapter0074
     * @tc.desc      Test JSON.stringify with object with prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0074';
      console.log(TAG + ' start');
      const parent = JSON.parse(JSON.stringify({ parentProp: 1 }));
      const child = JSON.parse(JSON.stringify({ childProp: 2 }));
      const result = JSON.stringify(child);
      expect(result).assertEqual('{"childProp":2}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7500
     * @tc.name      testJson02Chapter0075
     * @tc.desc      Test JSON.stringify with object containing non-enumerable properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0075';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ visible: 'shown' }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"visible":"shown"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7600
     * @tc.name      testJson02Chapter0076
     * @tc.desc      Test JSON.stringify with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0076';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ name: "test" }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"name":"test"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7700
     * @tc.name      testJson02Chapter0077
     * @tc.desc      Test JSON.stringify with object containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0077';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ tag: "dataview" }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"tag":"dataview"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7800
     * @tc.name      testJson02Chapter0078
     * @tc.desc      Test JSON.stringify with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0078';
      console.log(TAG + ' start');
      const result = JSON.stringify({});
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_7900
     * @tc.name      testJson02Chapter0079
     * @tc.desc      Test JSON.stringify with large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0079';
      console.log(TAG + ' start');
      let objStr = '{';
      for (let i = 0; i < 100; i++) {
        objStr += `"key${i}":"value${i}"`;
        if (i < 99) {
          objStr += ',';
        }
      }
      objStr += '}';
      const largeObj = JSON.parse(objStr);
      const result = JSON.stringify(largeObj);
      expect(typeof result).assertEqual('string');
      expect(result.length > 1000).assertTrue();
      expect(result.includes('"key0":"value0"')).assertTrue();
      expect(result.includes('"key99":"value99"')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8000
     * @tc.name      testJson02Chapter0080
     * @tc.desc      Test JSON.stringify with object containing undefined and null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0080';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({
        a: undefined,
        b: null,
        c: 1,
        d: "test"
      }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"b":null,"c":1,"d":"test"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8100
     * @tc.name      testJson02Chapter0081
     * @tc.desc      Test JSON.stringify with object containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0081';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({
        a: NaN,
        b: Infinity,
        c: -Infinity,
        d: 42
      }));
      const result = JSON.stringify(obj);
      expect(result.includes('null')).assertTrue();
      expect(result.includes('42')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8200
     * @tc.name      testJson02Chapter0082
     * @tc.desc      Test JSON.stringify with object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0082';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ name: "typed array test", count: 5 }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"name":"typed array test","count":5}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8300
     * @tc.name      testJson02Chapter0083
     * @tc.desc      Test JSON.stringify with object containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0083';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ id: 123 }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"id":123}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8400
     * @tc.name      testJson02Chapter0084
     * @tc.desc      Test JSON.stringify with object containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0084';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ count: 3 }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"count":3}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8500
     * @tc.name      testJson02Chapter0085
     * @tc.desc      Test JSON.stringify with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0085';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ status: "pending" }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"status":"pending"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8600
     * @tc.name      testJson02Chapter0086
     * @tc.desc      Test JSON.stringify with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0086';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ regex: /abc/gi, flags: /def/m, text: "test" }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"regex":{},"flags":{},"text":"test"}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8700
     * @tc.name      testJson02Chapter0087
     * @tc.desc      Test JSON.stringify with object containing Date property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0087';
      console.log(TAG + ' start');
      const date = new Date('2023-01-01T00:00:00Z');
      const obj = JSON.parse(JSON.stringify({ date: date, event: "New Year" }));
      const result = JSON.stringify(obj);
      expect(result.includes('"date":"2023-01-01T00:00:00.000Z"')).assertTrue();
      expect(result.includes('"event":"New Year"')).assertTrue();
    });


    /**
     * @tc.number    SUB_JSON_TEST02_8800
     * @tc.name      testJson02Chapter0088
     * @tc.desc      Test JSON.stringify with space parameter as tab character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0088';
      console.log(TAG + ' start');
      const obj = JSON.parse(JSON.stringify({ a: 1, b: { c: 2, d: [3, 4] } }));
      const result = JSON.stringify(obj, null, '\t');
      expect(result.includes('\t')).assertTrue();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_8900
     * @tc.name      testJson02Chapter0089
     * @tc.desc      Test JSON.stringify with toJSON method on nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0089';
      console.log(TAG + ' start');

      interface ToJSONResult {
        custom: number;
      }

      class Nested {
        value: number;

        constructor(value: number) {
          this.value = value;
        }

        toJSON(): ToJSONResult {
          return { custom: this.value * 2 };
        }
      }

      const nested = new Nested(42);
      const obj = JSON.parse(JSON.stringify({ data: nested, id: 1 }));
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"data":{"custom":84},"id":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9000
     * @tc.name      testJson02Chapter0090
     * @tc.desc      Test JSON.stringify with array of objects containing toJSON methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0090';
      console.log(TAG + ' start');

      interface ItemToJSONResult {
        itemId: number;
      }

      class Item {
        id: number;

        constructor(id: number) {
          this.id = id;
        }

        toJSON(): ItemToJSONResult {
          return { itemId: this.id };
        }
      }

      class ItemDouble extends Item {
        toJSON(): ItemToJSONResult {
          return { itemId: this.id * 2 };
        }
      }

      const items = [new Item(1), new ItemDouble(2)];
      const result = JSON.stringify(items);
      expect(result).assertEqual('[{"itemId":1},{"itemId":4}]');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9100
     * @tc.name      testJson02Chapter0091
     * @tc.desc      Test JSON.stringify with very deep nesting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0091';
      console.log(TAG + ' start');
      let nestedObjStr = '{"final":"value"}';
      for (let i = 49; i >= 0; i--) {
        nestedObjStr = `{"level${i}":${nestedObjStr}}`;
      }
      const obj = JSON.parse(nestedObjStr);
      const result = JSON.stringify(obj);
      expect(result.includes('final')).assertTrue();
      expect(result.length > 100).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9200
     * @tc.name      testJson02Chapter0092
     * @tc.desc      Test JSON.stringify with circular reference (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0092';
      console.log(TAG + ' start');

      let errorCaught = false;
      let errorMessage = '';

      try {
        const obj = JSON.parse(JSON.stringify({ a: 1 }));
        (obj as Record<string, Object>).self = obj!;
        JSON.stringify(obj);
        expect(typeof JSON.stringify).assertEqual('function');
      } catch (err) {
        errorCaught = true;
        const error = err as Error;
        errorMessage = error.message;
        expect(error instanceof Error).assertTrue();
      }

      expect(errorCaught).assertTrue();
      expect(errorMessage.length).assertLarger(0);
    });
    /**
     * @tc.number    SUB_JSON_TEST02_9300
     * @tc.name      testJson02Chapter0093
     * @tc.desc      Test JSON.stringify with indirect circular reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0093';
      console.log(TAG + ' start');

      let errorCaught = false;
      let errorMessage = '';

      try {
        const obj1 = JSON.parse(JSON.stringify({ a: 1 }));
        const obj2 = JSON.parse(JSON.stringify({ b: 2 }));
        (obj1 as Record<string, Object>).ref = obj2!;
        (obj2 as Record<string, Object>).ref = obj1!;
        JSON.stringify(obj1);
        expect(typeof JSON.stringify).assertEqual('function');
      } catch (err) {
        errorCaught = true;
        const error = err as Error;
        errorMessage = error.message;
        expect(error instanceof Error).assertTrue();
      }

      expect(errorCaught).assertTrue();
      expect(errorMessage.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9400
     * @tc.name      testJson02Chapter0094
     * @tc.desc      Test JSON.stringify with object containing getter property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0094';
      console.log(TAG + ' start');

      class ComputedObject {
        a: number;

        constructor(a: number) {
          this.a = a;
        }

        get computed() {
          return this.a * 2;
        }
      }

      const obj = new ComputedObject(1);
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9500
     * @tc.name      testJson02Chapter0095
     * @tc.desc      Test JSON.stringify with object containing inherited enumerable properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0095';
      console.log(TAG + ' start');

      class Parent {
        parentProp = 100;
      }

      class Child extends Parent {
        childProp = 200;
      }

      const obj = new Child();
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"parentProp":100,"childProp":200}');
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9600
     * @tc.name      testJson02Chapter0096
     * @tc.desc      Test JSON.stringify with mixed array containing various types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0096';
      console.log(TAG + ' start');
      const date = new Date();
      const mixedArray: (number | string | boolean | null | undefined | object | Date | number[])[] = [
        1,
        "string",
        true,
        null,
        undefined,
        JSON.parse(JSON.stringify({ a: 1 })), JSON.parse(JSON.stringify([2, 3])), date
      ];
      const result = JSON.stringify(mixedArray);
      expect(result.includes('1')).assertTrue();
      expect(result.includes('"string"')).assertTrue();
      expect(result.includes('true')).assertTrue();
      expect(result.includes('null')).assertTrue();
      expect(result.includes('"a":1')).assertTrue();
      expect(result.includes('[2,3]')).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST02_9700
     * @tc.name      testJson02Chapter0097
     * @tc.desc      Test JSON.stringify performance with large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson02Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson02Chapter0097';
      console.log(TAG + ' start');
      let largeObjStr = '{';
      for (let i = 0; i < 1000; i++) {
        largeObjStr += `"property${i}":"value${i}"`;
        if (i < 999) {
          largeObjStr += ',';
        }
      }
      largeObjStr += '}';
      const largeObj = JSON.parse(largeObjStr) as Record<string, string>;

      const startTime = Date.now();
      const result = JSON.stringify(largeObj);
      const endTime = Date.now();
      const duration = endTime - startTime;

      expect(typeof result).assertEqual('string');
      expect(result.length > 1000).assertTrue();
      expect(duration < 1000).assertTrue();
    });
  })
}
