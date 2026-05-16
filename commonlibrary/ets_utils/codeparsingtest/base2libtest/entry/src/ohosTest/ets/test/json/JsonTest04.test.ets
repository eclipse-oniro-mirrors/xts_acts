import { JSON } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

interface BasicObject {
  a?: number;
  b?: string | number;
  c?: number[];
}

interface NestedObject {
  a?: number;
  b?: NestedObject | number;
  c?: number;
  d?: NestedObject;
  e?: number;
}


interface SpecialValueObject {
  a?: undefined | null | number;
  b?: number;
}

interface SpecialKeyObject {
  "!@#$%^&*()"?: string;
  "123"?: string;
  "0"?: string;
  "NaN"?: string;
  "👆"?: string;
  "line1\nline2"?: string;
}


interface EmptyObject {}

interface Uint8ArrayObject {
  buffer: Uint8Array;
  other?: string;
}

interface NumberObject {
  a: number;
}

interface MapObject {
  map: Map<string, string | NumberObject>;
  other?: string;
}

interface SetObject {
  set: Set<number>;
  other?: string;
}

interface FunctionObject {
  a: number;
  b: () => void;
}


interface OwnPropObject {
  ownProp: number;
}

interface HiddenVisibleObject {
  hidden: number;
  visible: number;
}

interface EmptyArray extends Array<never> {}

interface ErrorWithCode {
  code: number;
}

interface NumericValueObject {
  a?: number;
  max?: number;
  min?: number;
  epsilon?: number;
  maxSafe?: number;
  hex?: number;
  b?: number;
}

interface PromiseObject {
  promise: Promise<string>;
  other?: string;
}

interface RegexObject {
  regex: RegExp;
  flags?: RegExp;
}

interface ArrayBufferObject {
  buffer: ArrayBuffer;
  other?: string;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Json04Test() {
  describe('Json04Test', () => {
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

    interface BooleanZeroObject {
      zeroAsFalse: number;
      truthyValue: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0100
     * @tc.name      testJson04Chapter0001
     * @tc.desc      Test JSON.stringify with 0 as boolean false context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0001";
        console.log(TAG + ' Start');
        const obj: BooleanZeroObject = {
          zeroAsFalse: 0,
          truthyValue: 1
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"zeroAsFalse":0,"truthyValue":1}');
      });

    interface BooleanNaNObject {
      nanAsFalse: number;
      truthyValue: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0200
     * @tc.name      testJson04Chapter0002
     * @tc.desc      Test JSON.stringify with NaN as boolean false context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0002";
        console.log(TAG + ' Start');
        const obj: BooleanNaNObject = {
          nanAsFalse: NaN,
          truthyValue: 1
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"nanAsFalse":null,"truthyValue":1}');
      });

    interface BooleanEmptyStringObject {
      emptyStringAsFalse: string;
      truthyValue: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0300
     * @tc.name      testJson04Chapter0003
     * @tc.desc      Test JSON.stringify with empty string as boolean false context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0003";
        console.log(TAG + ' Start');
        const obj: BooleanEmptyStringObject = {
          emptyStringAsFalse: "",
          truthyValue: "text"
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"emptyStringAsFalse":"","truthyValue":"text"}');
      });

    interface BooleanNullObject {
      nullAsFalse: null;
      truthyValue: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0400
     * @tc.name      testJson04Chapter0004
     * @tc.desc      Test JSON.stringify with null as boolean false context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0004";
        console.log(TAG + ' Start');
        const obj: BooleanNullObject = {
          nullAsFalse: null,
          truthyValue: 1
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"nullAsFalse":null,"truthyValue":1}');
      });

    interface BooleanUndefinedObject {
      undefinedAsFalse?: undefined;
      truthyValue: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0500
     * @tc.name      testJson04Chapter0005
     * @tc.desc      Test JSON.stringify with undefined as boolean false context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0005";
        console.log(TAG + ' Start');
        const obj: BooleanUndefinedObject = {
          undefinedAsFalse: undefined,
          truthyValue: 1
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"truthyValue":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST04_0600
     * @tc.name      testJson04Chapter0006
     * @tc.desc      Test JSON.stringify with array containing huge values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0006";
        console.log(TAG + ' Start');
        const array = [256, 65536, 32768];
        const result = JSON.stringify(array);
        expect(result).assertEqual('[256,65536,32768]');
      });

    /**
     * @tc.number    SUB_JSON_TEST04_0700
     * @tc.name      testJson04Chapter0007
     * @tc.desc      Test JSON.stringify with empty TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0007";
        console.log(TAG + ' Start');
        const array = new Int8Array([]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{}');
      });

    interface DataViewObject {
      dataView: DataView;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_0800
     * @tc.name      testJson04Chapter0008
     * @tc.desc      Test JSON.stringify with DataView object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0008";
        console.log(TAG + ' Start');
        const buffer = new ArrayBuffer(16);
        const dataView = new DataView(buffer);
        const obj: DataViewObject = {
          dataView: dataView
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"dataView":{}}');
      });

    /**
     * @tc.number    SUB_JSON_TEST04_0900
     * @tc.name      testJson04Chapter0009
     * @tc.desc      Test JSON.stringify with very large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0009";
        console.log(TAG + ' Start');
        const largeString = "a".repeat(10000);
        const result = JSON.stringify(largeString);
        expect(result.length).assertEqual(10002);
      });

    interface NestedTypedArraysObject {
      int8: Int8Array;
      uint8: Uint8Array;
      float32: Float32Array;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1000
     * @tc.name      testJson04Chapter0010
     * @tc.desc      Test JSON.stringify with nested TypedArrays in object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0010";
        console.log(TAG + ' Start');
        const obj: NestedTypedArraysObject = {
          int8: new Int8Array([1, 2, 3]),
          uint8: new Uint8Array([4, 5, 6]),
          float32: new Float32Array([7.1, 8.2, 9.3])
        };
        const result = JSON.stringify(obj);
        expect(result.includes('"0":1')).assertEqual(true);
        expect(result.includes('"0":4')).assertEqual(true);
        expect(result.includes('"0":7.099999904632568')).assertEqual(true);
      });

    interface NestedStructure {
      typedArray: Uint8Array;
      date: Date;
    }

    interface Level1Object {
      array: number[];
      nested: NestedStructure;
    }

    interface ComplexNestedObject {
      level1: Level1Object;
      map: Map<string, string>;
      set: Set<number>;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1100
     * @tc.name      testJson04Chapter0011
     * @tc.desc      Test JSON.stringify with complex nested structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0011";
        console.log(TAG + ' Start');
        const obj: ComplexNestedObject = {
          level1: {
            array: [1, 2, 3],
            nested: {
              typedArray: new Uint8Array([10, 20, 30]),
              date: new Date('2023-01-01')
            }
          },
          map: new Map([['key1', 'value1']]),
          set: new Set([1, 2, 3])
        };
        const result = JSON.stringify(obj);
        expect(result.includes('"array":[1,2,3]')).assertEqual(true);
        expect(result.includes('"typedArray":{"0":10,"1":20,"2":30}')).assertEqual(true);
      });

    interface PersonObject {
      name: string;
      age: number;
      city: string;
      country: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1200
     * @tc.name      testJson04Chapter0012
     * @tc.desc      Test JSON.stringify with array as replacer parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0012";
        console.log(TAG + ' Start');
        const obj: PersonObject = {
          name: "John",
          age: 30,
          city: "New York",
          country: "USA"
        };
        const replacer = ["name", "age"];
        const result = JSON.stringify(obj, replacer);
        expect(result).assertEqual('{"name":"John","age":30}');
      });

    interface AddressObject {
      city: string;
      zip: string;
    }

    interface NestedPersonObject {
      name: string;
      age: number;
      address: AddressObject;
    }

    interface CompanyObject {
      person: NestedPersonObject;
      company: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1300
     * @tc.name      testJson04Chapter0013
     * @tc.desc      Test JSON.stringify with array replacer for nested properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0013";
        console.log(TAG + ' Start');
        const obj: CompanyObject = {
          person: {
            name: "John",
            age: 30,
            address: {
              city: "New York",
              zip: "10001"
            }
          },
          company: "ABC Corp"
        };
        const replacer = ["person", "name", "address", "city"];
        const result = JSON.stringify(obj, replacer);
        expect(result.includes('"person":{"name":"John","address":{"city":"New York"}}')).assertEqual(true);
      });

    interface SimpleObjectWithC {
      a: number;
      b: number;
      c: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1400
     * @tc.name      testJson04Chapter0014
     * @tc.desc      Test JSON.stringify with tab character as space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0014";
        console.log(TAG + ' Start');
        const obj: SimpleObjectWithC = { a: 1, b: 2, c: 3 };
        const result = JSON.stringify(obj, undefined, '\t');
        expect(result.includes('\t')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST04_1500
     * @tc.name      testJson04Chapter0015
     * @tc.desc      Test JSON.stringify with 0 as space parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0015";
        console.log(TAG + ' Start');
        const obj: SimpleObjectWithC = { a: 1, b: 2, c: 3 };
        const result = JSON.stringify(obj, undefined, 0);
        expect(result).assertEqual('{"a":1,"b":2,"c":3}');
      });

    interface ToJSONResult {
      fullName: string;
      yearsOld: number;
    }

    interface ToJSONObject {
      name: string;
      age: number;

      toJSON(): ToJSONResult;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1600
     * @tc.name      testJson04Chapter0016
     * @tc.desc      Test JSON.stringify with object having toJSON method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0016";
        console.log(TAG + ' Start');

        class PersonWithToJSON {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }

          toJSON(): ToJSONResult {
            return {
              fullName: this.name,
              yearsOld: this.age
            };
          }
        }

        const obj = new PersonWithToJSON("John", 30);
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"fullName":"John","yearsOld":30}');
      });

    interface ToJSONStringResult {
      name: string;
      age: number;

      toJSON(): string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1700
     * @tc.name      testJson04Chapter0017
     * @tc.desc      Test JSON.stringify with toJSON method returning string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0017";
        console.log(TAG + ' Start');

        class ToJSONStringObject {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }

          toJSON(): string {
            return "Custom String Representation";
          }
        }

        const obj = new ToJSONStringObject("John", 30);
        const result = JSON.stringify(obj);
        expect(result).assertEqual('"Custom String Representation"');
      });

    interface ToJSONNullResult {
      name: string;
      age: number;

      toJSON(): null;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1800
     * @tc.name      testJson04Chapter0018
     * @tc.desc      Test JSON.stringify with toJSON method returning null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0018";
        console.log(TAG + ' Start');

        class ToJSONNullObject {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }

          toJSON(): null {
            return null;
          }
        }

        const obj = new ToJSONNullObject("John", 30);
        const result = JSON.stringify(obj);
        expect(result).assertEqual('null');
      });

    interface ToJSONUndefinedResult {
      name: string;
      age: number;

      toJSON(): undefined;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_1900
     * @tc.name      testJson04Chapter0019
     * @tc.desc      Test JSON.stringify with toJSON method returning undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0019";
        console.log(TAG + ' Start');

        class ToJSONUndefinedObject {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }

          toJSON(): undefined {
            return undefined;
          }
        }

        const obj = new ToJSONUndefinedObject("John", 30);
        const result = JSON.stringify(obj);
        expect(result).assertEqual(undefined);
      });

    interface Level9 {
      final: string;
    }

    interface Level8 {
      level9: Level9;
    }

    interface Level7 {
      level8: Level8;
    }

    interface Level6 {
      level7: Level7;
    }

    interface Level5 {
      level6: Level6;
    }

    interface Level4 {
      level5: Level5;
    }

    interface Level3 {
      level4: Level4;
    }

    interface Level2 {
      level3: Level3;
    }

    interface Level1 {
      level2: Level2;
    }

    interface Level0 {
      level1: Level1;
    }

    interface DeepNestedObject {
      level0: Level0;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_2000
     * @tc.name      testJson04Chapter0020
     * @tc.desc      Test JSON.stringify with very deep nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0020";
        console.log(TAG + ' Start');
        const obj: DeepNestedObject = {
          level0: {
            level1: {
              level2: {
                level3: {
                  level4: {
                    level5: {
                      level6: {
                        level7: {
                          level8: {
                            level9: {
                              final: 'value'
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        };

        const result = JSON.stringify(obj);
        expect(result.includes('final')).assertEqual(true);
        expect(result.includes('value')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST04_2100
     * @tc.name      testJson04Chapter0021
     * @tc.desc      Test JSON.stringify with ArrayBuffer containing data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0021";
        console.log(TAG + ' Start');
        const buffer = new ArrayBuffer(8);
        const view = new Uint8Array(buffer);
        view[0] = 1;
        view[1] = 2;
        view[2] = 3;

        const obj: ArrayBufferObject = { buffer: buffer };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"buffer":{}}');
      });

    interface NestedValueObject {
      value: number;
    }

    interface ComplexObject {
      name: string;
      age: number;
      scores: number[];
      nested: NestedValueObject;
    }

    type Transformer = (key: string, value: Object) => Object | undefined;

    /**
     * @tc.number    SUB_JSON_TEST04_2200
     * @tc.name      testJson04Chapter0022
     * @tc.desc      Test JSON.stringify with complex replacer function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0022";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object => {
          if (typeof value === 'number') {
            return value * 2;
          }
          if (typeof value === 'string') {
            return value.toUpperCase();
          }
          return value;
        };

        const obj: ComplexObject = {
          name: "john",
          age: 30,
          scores: [10, 20, 30],
          nested: {
            value: 50
          }
        };

        const result = JSON.stringify(obj, replacer);
        expect(result).assertEqual('{"name":"JOHN","age":60,"scores":[20,40,60],"nested":{"value":100}}');
      });

    interface UserObject {
      username: string;
      password: string;
      email: string;
      secret: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_2300
     * @tc.name      testJson04Chapter0023
     * @tc.desc      Test JSON.stringify with replacer function filtering specific keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0023";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object | undefined => {
          if (key === 'password' || key === 'secret') {
            return undefined;
          }
          return value;
        };

        const obj: UserObject = {
          username: "john_doe",
          password: "secret123",
          email: "john@example.com",
          secret: "hidden"
        };

        const result = JSON.stringify(obj, replacer);
        expect(result).assertEqual('{"username":"john_doe","email":"john@example.com"}');
      });

    interface Level4Object {
      level4: string;
    }

    interface Level3Object {
      level3: Level4Object;
    }

    interface Level2Object {
      level2: Level3Object;
    }

    interface DepthTrackingObject {
      level1: Level2Object;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_2400
     * @tc.name      testJson04Chapter0024
     * @tc.desc      Test JSON.stringify with replacer function tracking depth
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0024";
        console.log(TAG + ' Start');
        let depth = 0;
        const replacer: Transformer = (key: string, value: Object): Object => {
          if (typeof value === 'object' && value !== null) {
            depth++;
            if (depth > 2) {
              return '[Too Deep]';
            }
          }
          return value;
        };

        const obj: DepthTrackingObject = {
          level1: {
            level2: {
              level3: {
                level4: 'deep value'
              }
            }
          }
        };

        const result = JSON.stringify(obj, replacer);
        expect(result.includes('[Too Deep]')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST04_2500
     * @tc.name      testJson04Chapter0025
     * @tc.desc      Test JSON.stringify with circular reference and replacer function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson04Chapter0025";
        console.log(TAG + ' Start');

        interface CircularObject {
          name: string;
          self?: CircularObject;
        }

        const obj: CircularObject = { name: "John" };
        obj.self = obj;

        const replacer: Transformer = (key: string, value: Object): Object | undefined => {
          if (key === 'self') {
            return '[Circular]';
          }
          return value;
        };

        try {
          const result = JSON.stringify(obj, replacer);
          expect(result).assertEqual('{"name":"John","self":"[Circular]"}');
        } catch (err) {
          expect(err instanceof Error).assertEqual(true);
        }
      });

    /**
     * @tc.number    SUB_JSON_TEST04_2600
     * @tc.name      testJson04Chapter0026
     * @tc.desc      Test JSON.has with normal object and existing property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0026";
      console.log(TAG + ' Start');
      let obj: BasicObject = { a: 1, b: "test", c: [1, 2, 3] };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_2700
     * @tc.name      testJson04Chapter0027
     * @tc.desc      Test JSON.has with normal object and non-existing property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0027";
      console.log(TAG + ' Start');
      let obj: BasicObject = { a: 1, b: "test", c: [1, 2, 3] };
      let result = JSON.has(obj, "d");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_2800
     * @tc.name      testJson04Chapter0028
     * @tc.desc      Test JSON.has with nested object and property in nested level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0028";
      console.log(TAG + ' Start');
      let obj: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      let result = JSON.has(obj, "b");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_2900
     * @tc.name      testJson04Chapter0029
     * @tc.desc      Test JSON.has with object containing undefined property value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0029";
      console.log(TAG + ' Start');
      let obj: SpecialValueObject = { a: undefined, b: 1 };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3000
     * @tc.name      testJson04Chapter0030
     * @tc.desc      Test JSON.has with object containing null property value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0030";
      console.log(TAG + ' Start');
      let obj: SpecialValueObject = { a: null, b: 1 };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3100
     * @tc.name      testJson04Chapter0031
     * @tc.desc      Test JSON.has with object containing NaN property value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0031";
      console.log(TAG + ' Start');
      let obj: SpecialValueObject = { a: NaN, b: 1 };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3200
     * @tc.name      testJson04Chapter0032
     * @tc.desc      Test JSON.has with object containing Infinity property value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0032";
      console.log(TAG + ' Start');
      let obj: SpecialValueObject = { a: Infinity, b: 1 };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3300
     * @tc.name      testJson04Chapter0033
     * @tc.desc      Test JSON.has with empty object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0033";
      console.log(TAG + ' Start');
      let obj: EmptyObject = {};
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3400
     * @tc.name      testJson04Chapter0034
     * @tc.desc      Test JSON.has with object created from JSON.parse.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0034";
      console.log(TAG + ' Start');
      let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
      let inputObj = JSON.parse(jsonText);
      let result = JSON.has(inputObj, "name");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3500
     * @tc.name      testJson04Chapter0035
     * @tc.desc      Test JSON.has with object containing TypedArray property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0035";
      console.log(TAG + ' Start');
      let buffer = new Uint8Array([72, 101, 108, 108, 111]);
      let obj: Uint8ArrayObject = { buffer: buffer, other: "test" };
      let result = JSON.has(obj, "buffer");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3600
     * @tc.name      testJson04Chapter0036
     * @tc.desc      Test JSON.has with property name as empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0036";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: Record<string, string> = { "": "empty" };
        let result = JSON.has(obj, "");
      } catch (err) {
        errorCaught = true;
        expect((err as Error).message).assertEqual('Parameter error. The type of  must be string and not empty');
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3700
     * @tc.name      testJson04Chapter0037
     * @tc.desc      Test JSON.has with property name containing special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0037";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "!@#$%^&*()": "special" };
      let result = JSON.has(obj, "!@#$%^&*()");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3800
     * @tc.name      testJson04Chapter0038
     * @tc.desc      Test JSON.has with property name as number string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0038";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "123": "number" };
      let result = JSON.has(obj, "123");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_3900
     * @tc.name      testJson04Chapter0039
     * @tc.desc      Test JSON.has with property name "0".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0039";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "0": "zero" };
      let result = JSON.has(obj, "0");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4000
     * @tc.name      testJson04Chapter0040
     * @tc.desc      Test JSON.has with property name "NaN".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0040";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "NaN": "not a number" };
      let result = JSON.has(obj, "NaN");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4100
     * @tc.name      testJson04Chapter0041
     * @tc.desc      Test JSON.has with property name containing emoji.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0041";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "👆": "emoji" };
      let result = JSON.has(obj, "👆");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4200
     * @tc.name      testJson04Chapter0042
     * @tc.desc      Test JSON.has with large object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0042";
      console.log(TAG + ' Start');
      let obj: Record<string, number> = {};
      for (let i = 0; i < 10000; i++) {
        obj["key" + i] = i;
      }
      let result = JSON.has(obj, "key5000");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4300
     * @tc.name      testJson04Chapter0043
     * @tc.desc      Test JSON.has with object containing Map property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0043";
      console.log(TAG + ' Start');
      const mapEntries: Array<[string, string | NumberObject]> =
        [['key1', 'value1'], ['key2', { a: 1 } as NumberObject]];
      let map = new Map<string, string | NumberObject>(mapEntries);
      let obj: MapObject = { map: map, other: "test" };
      let result = JSON.has(obj, "map");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4400
     * @tc.name      testJson04Chapter0044
     * @tc.desc      Test JSON.has with object containing Set property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0044";
      console.log(TAG + ' Start');
      let set = new Set([1, 2, 3, 2, 1]);
      let obj: SetObject = { set: set, other: "test" };
      let result = JSON.has(obj, "set");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4500
     * @tc.name      testJson04Chapter0045
     * @tc.desc      Test JSON.has with object containing Promise property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0045";
      console.log(TAG + ' Start');
      let promise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      let obj: PromiseObject = { promise: promise, other: "test" };
      let result = JSON.has(obj, "promise");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4600
     * @tc.name      testJson04Chapter0046
     * @tc.desc      Test JSON.has with object containing regex property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0046";
      console.log(TAG + ' Start');
      let obj: RegexObject = { regex: /abc/gi, flags: /def/m };
      let result = JSON.has(obj, "regex");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4700
     * @tc.name      testJson04Chapter0047
     * @tc.desc      Test JSON.has with object containing ArrayBuffer property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0047";
      console.log(TAG + ' Start');
      let obj: ArrayBufferObject = { buffer: new ArrayBuffer(16), other: "test" };
      let result = JSON.has(obj, "buffer");
      expect(result).assertEqual(true);
    });

    interface DataViewObjectWithView {
      view: DataView;
      other?: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST04_4800
     * @tc.name      testJson04Chapter0048
     * @tc.desc      Test JSON.has with object containing DataView property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0048";
      console.log(TAG + ' Start');
      let obj: DataViewObjectWithView = { view: new DataView(new ArrayBuffer(16)), other: "test" };
      let result = JSON.has(obj, "view");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_4900
     * @tc.name      testJson04Chapter0049
     * @tc.desc      Test JSON.has with property name as long string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0049";
      console.log(TAG + ' Start');
      let longKey = "a".repeat(1000);
      let obj: Record<string, number> = {};
      obj[longKey] = 1;
      let result = JSON.has(obj, longKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5000
     * @tc.name      testJson04Chapter0050
     * @tc.desc      Test JSON.has with property name containing escape characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0050";
      console.log(TAG + ' Start');
      let obj: SpecialKeyObject = { "line1\nline2": "multiline" };
      let result = JSON.has(obj, "line1\nline2");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5100
     * @tc.name      testJson04Chapter0051
     * @tc.desc      Test JSON.has with null object parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0051";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let result = JSON.has(null, "property");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5200
     * @tc.name      testJson04Chapter0052
     * @tc.desc      Test JSON.has with undefined object parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0052";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let result = JSON.has(undefined, "property");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5300
     * @tc.name      testJson04Chapter0053
     * @tc.desc      Test JSON.has with number as object parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0053";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let result = JSON.has(123 as never as object, "property");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5400
     * @tc.name      testJson04Chapter0054
     * @tc.desc      Test JSON.has with string as object parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0054";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let result = JSON.has("not an object" as never as object, "property");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5500
     * @tc.name      testJson04Chapter0055
     * @tc.desc      Test JSON.has with boolean as object parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0055";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let result = JSON.has(true as never as object, "property");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5600
     * @tc.name      testJson04Chapter0056
     * @tc.desc      Test JSON.has with null property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0056";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let result = JSON.has(obj, null);
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5700
     * @tc.name      testJson04Chapter0057
     * @tc.desc      Test JSON.has with undefined property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0057";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let result = JSON.has(obj, undefined);
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5800
     * @tc.name      testJson04Chapter0058
     * @tc.desc      Test JSON.has with number as property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0058";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let result = JSON.has(obj, 123 as never as string);
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_5900
     * @tc.name      testJson04Chapter0059
     * @tc.desc      Test JSON.has with object as property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0059";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let emptyObj: EmptyObject = {};
        let result = JSON.has(obj, emptyObj as never as string);
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6000
     * @tc.name      testJson04Chapter0060
     * @tc.desc      Test JSON.has with array as property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0060";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let emptyArray: EmptyArray = [];
        let result = JSON.has(obj, emptyArray as never as string);
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6100
     * @tc.name      testJson04Chapter0061
     * @tc.desc      Test JSON.has with missing property parameter (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0061";
      console.log(TAG + ' Start');
      try {
        let obj: BasicObject = { a: 1, b: 2 };
        let result = JSON.has(obj as never, "a");
      } catch (err) {
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6200
     * @tc.name      testJson04Chapter0062
     * @tc.desc      Test JSON.has with missing all parameters (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0062";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        type JSONHasFunction = (obj?: object, key?: string) => boolean;
        (JSON.has as JSONHasFunction)();
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6300
     * @tc.name      testJson04Chapter0063
     * @tc.desc      Test JSON.has with array instead of object (reverse test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0063";
      console.log(TAG + ' Start');
      let errorCaught: boolean = false;
      try {
        let arr = [1, 2, 3];
        let result = JSON.has(arr, "0");
      } catch (err) {
        errorCaught = true;
        expect((err as ErrorWithCode).code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6400
     * @tc.name      testJson04Chapter0064
     * @tc.desc      Test JSON.has with object containing function property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0064";
      console.log(TAG + ' Start');
      let obj: FunctionObject = {
        a: 1, b: () => {
        }
      };
      let result = JSON.has(obj, "b");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6500
     * @tc.name      testJson04Chapter0065
     * @tc.desc      Test JSON.has with object created using Object.create (prototype chain).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0065";
      console.log(TAG + ' Start');
      let obj: OwnPropObject = { ownProp: 2 };
      let result = JSON.has(obj, "ownProp");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6600
     * @tc.name      testJson04Chapter0066
     * @tc.desc      Test JSON.has with object containing non-enumerable property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0066";
      console.log(TAG + ' Start');
      let obj: HiddenVisibleObject = { hidden: 1, visible: 2 };
      let result = JSON.has(obj, "hidden");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6700
     * @tc.name      testJson04Chapter0067
     * @tc.desc      Test JSON.has with property name as all ASCII characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0067";
      console.log(TAG + ' Start');
      let asciiKey = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      let obj: Record<string, string> = {};
      obj[asciiKey] = "ascii";
      let result = JSON.has(obj, asciiKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6800
     * @tc.name      testJson04Chapter0068
     * @tc.desc      Test JSON.has with property name as repeated special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0068";
      console.log(TAG + ' Start');
      let specialKey = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      let obj: Record<string, string> = {};
      obj[specialKey] = "special";
      let result = JSON.has(obj, specialKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_6900
     * @tc.name      testJson04Chapter0069
     * @tc.desc      Test JSON.has with object containing property with value -0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0069";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { a: -0, b: 1 };
      let result = JSON.has(obj, "a");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_7000
     * @tc.name      testJson04Chapter0070
     * @tc.desc      Test JSON.has with object containing property with value Number.MAX_VALUE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0070";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { max: Number.MAX_VALUE, b: 1 };
      let result = JSON.has(obj, "max");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST04_7100
     * @tc.name      testJson04Chapter0071
     * @tc.desc      Test JSON.has with object containing property with value Number.MIN_VALUE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson04Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson04Chapter0071";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { min: Number.MIN_VALUE, b: 1 };
      let result = JSON.has(obj, "min");
      expect(result).assertEqual(true);
    });


  })
}
