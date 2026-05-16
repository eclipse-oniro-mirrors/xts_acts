import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

function initTreeString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}


type Transformer = (key: string, value: Object) => Object | undefined;

interface BasicObject {
  a: number;
  b: string;
  c: number[];
}

interface NestedObjectLevel1 {
  c: number;
  d: NestedObjectLevel2;
}

interface NestedObjectLevel2 {
  e: number;
}

interface NestedObject {
  a: number;
  b: NestedObjectLevel1;
}

interface Person {
  name: string;
  age: number;
  city: string;
}

interface SimpleObject {
  a?: number | null | undefined;
  b: number;
}

interface BufferObject {
  buffer: Uint8Array;
}

interface FunctionObject {
  a: number;
  b?: () => void;
}

interface SimpleTestObject {
  a: number;
}

interface ArrayBufferObject {
  buffer: ArrayBuffer;
}

interface MapObject {
  map: Map<string, string | NestedMapObject>;
}

interface NestedMapObject {
  a: number;
}

interface SetObject {
  set: Set<number>;
}

interface PromiseObject {
  promise: Promise<string>;
}

interface RegExpObject {
  regex: RegExp;
  flags: RegExp;
}

interface DeletableObject {
  a: number;
  b?: number;
  c: number;
}

interface DataObject {
  data: string;
}

interface PersonBasic {
  name: string;
  age: number;
}

interface ComplexArrayObject {
  items: Array<NestedMapObject>;
}

interface CircularReferenceObject {
  a: number;
  self?: CircularReferenceObject;
}

interface EmptyObject {}

interface NonEnumerablePropertyObject {
  a: number;
  b?: number;
}

interface ParentObject {
  parentProp: number;
}

interface ChildObject {
  childProp: number;
}

interface BigIntObject {
  value: number;
}

interface SpecialArray extends Array<number> {
  abc?: number;
  aaa?: number;
}

interface PersonWithCity {
  name: string;
  age: number;
  city: string;
}

interface DetailsObject {
  age: number;
}

interface PersonWithDetails {
  name: string;
  details: DetailsObject;
}

interface ModifiedObject {
  modified: boolean;
  original: Object;
}

interface TransformerTestObject {
  name: string;
  age: number;
  city: string;
}


export default function Json03Test() {
  describe('Json03Test', () => {
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
     * @tc.number    SUB_JSON_TEST03_0100
     * @tc.name      testJson03Chapter0001
     * @tc.desc      Test JSON.stringify with basic object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0001";
      console.log(TAG + ' Start');
      const obj: BasicObject = { a: 1, b: "test", c: [1, 2, 3] };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":"test","c":[1,2,3]}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_0200
     * @tc.name      testJson03Chapter0002
     * @tc.desc      Test JSON.stringify with nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0002";
      console.log(TAG + ' Start');
      const obj: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":{"c":2,"d":{"e":3}}}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_0300
     * @tc.name      testJson03Chapter0003
     * @tc.desc      Test JSON.stringify with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0003";
        console.log(TAG + ' Start');
        const obj: SimpleObject = { a: undefined, b: 1 };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"b":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_0400
     * @tc.name      testJson03Chapter0004
     * @tc.desc      Test JSON.stringify with null property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0004";
      console.log(TAG + ' Start');
      const obj: SimpleObject = { a: null, b: 1 };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":null,"b":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_0500
     * @tc.name      testJson03Chapter0005
     * @tc.desc      Test JSON.stringify with NaN property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0005";
      console.log(TAG + ' Start');
      const obj: SimpleObject = { a: NaN, b: 1 };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"a":null,"b":1}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_0600
     * @tc.name      testJson03Chapter0006
     * @tc.desc      Test JSON.stringify with Infinity property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0006";
        console.log(TAG + ' Start');
        const obj: SimpleObject = { a: Infinity, b: 1 };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"a":null,"b":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_0700
     * @tc.name      testJson03Chapter0007
     * @tc.desc      Test JSON.stringify with TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0007";
      console.log(TAG + ' Start');
      const buffer = new Uint8Array([72, 101, 108, 108, 111]);
      const obj: BufferObject = { buffer: buffer };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"buffer":{"0":72,"1":101,"2":108,"3":108,"4":111}}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_0800
     * @tc.name      testJson03Chapter0008
     * @tc.desc      Test JSON.stringify with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0008";
        console.log(TAG + ' Start');
        const array = new Int8Array([-128, 127]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":-128,"1":127}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_0900
     * @tc.name      testJson03Chapter0009
     * @tc.desc      Test JSON.stringify with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0009";
        console.log(TAG + ' Start');
        const array = new Uint8Array([0, 255]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":0,"1":255}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1000
     * @tc.name      testJson03Chapter0010
     * @tc.desc      Test JSON.stringify with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0010";
        console.log(TAG + ' Start');
        const array = new Float32Array([Infinity, -Infinity, NaN]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":null,"1":null,"2":null}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1100
     * @tc.name      testJson03Chapter0011
     * @tc.desc      Test JSON.stringify with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0011";
        console.log(TAG + ' Start');
        const array = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
        const result = JSON.stringify(array);
        expect(result).assertEqual('[72,101,108,108,111,87,111,114,108,0,0,0,0,0,100,49,50,51,63]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1200
     * @tc.name      testJson03Chapter0012
     * @tc.desc      Test JSON.stringify with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0012";
        console.log(TAG + ' Start');
        const array = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
        const result = JSON.stringify(array);
        expect(result).assertEqual('[72,101,108,108,111,87,-111,114,108,100,-49,50,51,-63]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1300
     * @tc.name      testJson03Chapter0013
     * @tc.desc      Test JSON.stringify with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0013";
      console.log(TAG + ' Start');
      const array: number[] = [];
      const result = JSON.stringify(array);
      expect(result).assertEqual('[]');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_1400
     * @tc.name      testJson03Chapter0014
     * @tc.desc      Test JSON.stringify with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0014";
        console.log(TAG + ' Start');
        const array = [72, 101, NaN, Infinity, 108, 111];
        const result = JSON.stringify(array);
        expect(result).assertEqual('[72,101,null,null,108,111]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1500
     * @tc.name      testJson03Chapter0015
     * @tc.desc      Test JSON.stringify with array containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0015";
        console.log(TAG + ' Start');
        const array = [72, "abc", true, null, undefined, 108];
        const result = JSON.stringify(array);
        expect(result).assertEqual('[72,"abc",true,null,null,108]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1600
     * @tc.name      testJson03Chapter0016
     * @tc.desc      Test JSON.stringify with number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0016";
      console.log(TAG + ' Start');
      const result = JSON.stringify(0);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_1700
     * @tc.name      testJson03Chapter0017
     * @tc.desc      Test JSON.stringify with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0017";
      console.log(TAG + ' Start');
      const result = JSON.stringify(NaN);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_1800
     * @tc.name      testJson03Chapter0018
     * @tc.desc      Test JSON.stringify with Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0018";
        console.log(TAG + ' Start');
        const result = JSON.stringify(Infinity);
        expect(result).assertEqual('null');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_1900
     * @tc.name      testJson03Chapter0019
     * @tc.desc      Test JSON.stringify with -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0019";
        console.log(TAG + ' Start');
        const result = JSON.stringify(-Infinity);
        expect(result).assertEqual('null');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2000
     * @tc.name      testJson03Chapter0020
     * @tc.desc      Test JSON.stringify with Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0020";
        console.log(TAG + ' Start');
        const result = JSON.stringify(Number.MAX_VALUE);
        expect(result).assertEqual('1.7976931348623157e+308');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2100
     * @tc.name      testJson03Chapter0021
     * @tc.desc      Test JSON.stringify with Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0021";
        console.log(TAG + ' Start');
        const result = JSON.stringify(Number.MIN_VALUE);
        expect(result != null).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2200
     * @tc.name      testJson03Chapter0022
     * @tc.desc      Test JSON.stringify with Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0022";
        console.log(TAG + ' Start');
        const result = JSON.stringify(Number.MAX_SAFE_INTEGER);
        expect(result).assertEqual('9007199254740991');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2300
     * @tc.name      testJson03Chapter0023
     * @tc.desc      Test JSON.stringify with boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0023";
      console.log(TAG + ' Start');
      const result = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_2400
     * @tc.name      testJson03Chapter0024
     * @tc.desc      Test JSON.stringify with boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0024";
      console.log(TAG + ' Start');
      const result = JSON.stringify(false);
      expect(result).assertEqual('false');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_2500
     * @tc.name      testJson03Chapter0025
     * @tc.desc      Test JSON.stringify with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0025";
      console.log(TAG + ' Start');
      const result = JSON.stringify("");
      expect(result).assertEqual('""');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_2600
     * @tc.name      testJson03Chapter0026
     * @tc.desc      Test JSON.stringify with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0026";
        console.log(TAG + ' Start');
        const str = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const result = JSON.stringify(str);
        expect(result).assertEqual('"!\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2700
     * @tc.name      testJson03Chapter0027
     * @tc.desc      Test JSON.stringify with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0027";
        console.log(TAG + ' Start');
        const str = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\xhh";
        const result = JSON.stringify(str);
        expect(result.includes('\\"')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_2800
     * @tc.name      testJson03Chapter0028
     * @tc.desc      Test JSON.stringify with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0028";
      console.log(TAG + ' Start');
      const emoji = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const result = JSON.stringify(emoji);
      expect(result.length > 0).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST03_2900
     * @tc.name      testJson03Chapter0029
     * @tc.desc      Test JSON.stringify with unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0029";
        console.log(TAG + ' Start');
        const unicodeStr = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40";
        const result = JSON.stringify(unicodeStr);
        expect(result).assertEqual('"👆👿👀"');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3000
     * @tc.name      testJson03Chapter0030
     * @tc.desc      Test JSON.stringify with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0030";
      console.log(TAG + ' Start');
      const result = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_3100
     * @tc.name      testJson03Chapter0031
     * @tc.desc      Test JSON.stringify with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0031";
      console.log(TAG + ' Start');
      const result = JSON.stringify(undefined);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_JSON_TEST03_3200
     * @tc.name      testJson03Chapter0032
     * @tc.desc      Test JSON.stringify with Transformer replacer function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0032";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object | undefined => {
          if (typeof value === "string") {
            return value.toUpperCase();
          }
          return value;
        };
        const inputObj: Person = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, replacer);
        expect(result).assertEqual('{"name":"JOHN","age":30,"city":"CHONGQING"}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3300
     * @tc.name      testJson03Chapter0033
     * @tc.desc      Test JSON.stringify with space number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0033";
        console.log(TAG + ' Start');
        const inputObj: Person = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, undefined, 2);
        expect(result.includes('\n')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3400
     * @tc.name      testJson03Chapter0034
     * @tc.desc      Test JSON.stringify with space string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0034";
        console.log(TAG + ' Start');
        const inputObj: Person = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, undefined, "  ");
        expect(result.includes('  ')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3500
     * @tc.name      testJson03Chapter0035
     * @tc.desc      Test JSON.stringify with both Transformer and space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0035";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object | undefined => {
          if (typeof value === "string") {
            return value.toUpperCase();
          }
          return value;
        };
        const inputObj: Person = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, replacer, 2);
        expect(result.includes('JOHN')).assertEqual(true);
        expect(result.includes('\n')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3600
     * @tc.name      testJson03Chapter0036
     * @tc.desc      Test JSON.stringify with large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0036";
      console.log(TAG + ' Start');
      const largeObj: Record<string, number> = {};
      for (let i = 0; i < 1000; i++) {
        largeObj[`key${i}`] = i;
      }
      const result = JSON.stringify(largeObj);
      expect(result.length > 0).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST03_3700
     * @tc.name      testJson03Chapter0037
     * @tc.desc      Test JSON.stringify with circular reference (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0037";
        console.log(TAG + ' Start');

        interface CircularReferenceObject {
          a: number;
          self?: CircularReferenceObject;
        }

        const obj: CircularReferenceObject = { a: 1 };
        obj.self = obj;

        let stringifySucceeded = false;
        let errorCaught = false;
        let isErrorInstance = false;

        try {
          JSON.stringify(obj);
          stringifySucceeded = true;
        } catch (err) {
          errorCaught = true;
          isErrorInstance = err instanceof Error;
        }

        expect(stringifySucceeded).assertFalse();
        expect(errorCaught).assertTrue();
        expect(isErrorInstance).assertTrue();
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3800
     * @tc.name      testJson03Chapter0038
     * @tc.desc      Test JSON.stringify with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0038";
        console.log(TAG + ' Start');
        const obj: FunctionObject = {
          a: 1, b: () => {
            console.log("test");
          }
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"a":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_3900
     * @tc.name      testJson03Chapter0039
     * @tc.desc      Test JSON.stringify with symbol property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0039";
        console.log(TAG + ' Start');
        const obj: SimpleTestObject = { a: 1 };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"a":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_4000
     * @tc.name      testJson03Chapter0040
     * @tc.desc      Test JSON.stringify with ArrayBuffer property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0040";
        console.log(TAG + ' Start');
        const buffer = new ArrayBuffer(16);
        const obj: ArrayBufferObject = { buffer: buffer };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"buffer":{}}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_4100
     * @tc.name      testJson03Chapter0041
     * @tc.desc      Test JSON.stringify with Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0041";
      console.log(TAG + ' Start');
      const keyValuePair1: [string, string] = ['key1', 'value1'];
      const nestedObj: NestedMapObject = { a: 1 };
      const keyValuePair2: [string, NestedMapObject] = ['key2', nestedObj];
      const mapEntries: Array<[string, string | NestedMapObject]> = [keyValuePair1, keyValuePair2];

      const map = new Map(mapEntries);
      const obj: MapObject = { map: map };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"map":{}}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_4200
     * @tc.name      testJson03Chapter0042
     * @tc.desc      Test JSON.stringify with Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0042";
      console.log(TAG + ' Start');
      const set = new Set([1, 2, 3, 2, 1]);
      const obj: SetObject = { set: set };
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{"set":{}}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_4300
     * @tc.name      testJson03Chapter0043
     * @tc.desc      Test JSON.stringify with Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0043";
        console.log(TAG + ' Start');
        const promise = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve('done'), 100);
        });
        const obj: PromiseObject = { promise: promise };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"promise":{}}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_4400
     * @tc.name      testJson03Chapter0044
     * @tc.desc      Test JSON.stringify with RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0044";
        console.log(TAG + ' Start');
        const obj: RegExpObject = { regex: /abc/gi, flags: /def/m };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"regex":{},"flags":{}}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_4500
     * @tc.name      testJson03Chapter0045
     * @tc.desc      Test JSON.stringify with Date object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0045";
      console.log(TAG + ' Start');
      const date = new Date('2023-01-01');
      const result = JSON.stringify(date);
      expect(result.includes('2023')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST03_4600
     * @tc.name      testJson03Chapter0046
     * @tc.desc      Test JSON.stringify with nested arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0046";
      console.log(TAG + ' Start');
      const array = [[1, 2], [3, 4], [5, [6, 7]]];
      const result = JSON.stringify(array);
      expect(result).assertEqual('[[1,2],[3,4],[5,[6,7]]]');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_4700
     * @tc.name      testJson03Chapter0047
     * @tc.desc      Test JSON.stringify with object after deleting property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0047";
        console.log(TAG + ' Start');
        const obj: DeletableObject = { a: 1, b: 2, c: 3 };
        obj.b = undefined;
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"a":1,"c":3}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_4800
     * @tc.name      testJson03Chapter0048
     * @tc.desc      Test JSON.stringify with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0048";
      console.log(TAG + ' Start');
      const result = JSON.stringify(-0);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_4900
     * @tc.name      testJson03Chapter0049
     * @tc.desc      Test JSON.stringify with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0049";
        console.log(TAG + ' Start');
        const result = JSON.stringify(1e3);
        expect(result).assertEqual('1000');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_5000
     * @tc.name      testJson03Chapter0050
     * @tc.desc      Test JSON.stringify with hexadecimal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0050";
      console.log(TAG + ' Start');
      const result = JSON.stringify(0x0102);
      expect(result).assertEqual('258');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_5100
     * @tc.name      testJson03Chapter0051
     * @tc.desc      Test JSON.stringify with octal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0051";
      console.log(TAG + ' Start');
      const result = JSON.stringify(0o3);
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_5200
     * @tc.name      testJson03Chapter0052
     * @tc.desc      Test JSON.stringify with exponential operator result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0052";
        console.log(TAG + ' Start');
        const result = JSON.stringify(2**3);
        expect(result).assertEqual('8');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_5300
     * @tc.name      testJson03Chapter0053
     * @tc.desc      Test JSON.stringify with float precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0053";
        console.log(TAG + ' Start');
        const result = JSON.stringify(123.456);
        expect(result).assertEqual('123.456');
      });


    /**
     * @tc.number    SUB_JSON_TEST03_5400
     * @tc.name      testJson03Chapter0054
     * @tc.desc      Test JSON.stringify with large tree-like string structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0054";
        console.log(TAG + ' Start');

        const treeString = initTreeString(100);
        const parsed = JSON.parse(treeString);
        const result = JSON.stringify(parsed);
        expect(result.length > 0).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_5500
     * @tc.name      testJson03Chapter0055
     * @tc.desc      Test JSON.stringify with sliced string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0055";
        console.log(TAG + ' Start');
        const str = "{k1:value1,k2:value2}";
        const sliced = str.substring(0, str.length - 2);
        const obj: DataObject = { data: sliced };
        const result = JSON.stringify(obj);
        expect(result.includes('value1')).assertEqual(true);
      });


    /**
     * @tc.number    SUB_JSON_TEST03_5600
     * @tc.name      testJson03Chapter0056
     * @tc.desc      Test JSON.stringify with invalid replacer type (should handle gracefully)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0056";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        try {
          const result = JSON.stringify(inputObj);
          expect(result).assertEqual('{"name":"John","age":30}');
        } catch (err) {
          expect(err instanceof Error).assertEqual(true);
        }
      });

    /**
     * @tc.number    SUB_JSON_TEST03_5700
     * @tc.name      testJson03Chapter0057
     * @tc.desc      Test JSON.stringify with invalid space type (should handle gracefully)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0057";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        try {
          const result = JSON.stringify(inputObj);
          expect(result).assertEqual('{"name":"John","age":30}');
        } catch (err) {
          expect(err instanceof Error).assertEqual(true);
        }
      });

    /**
     * @tc.number    SUB_JSON_TEST03_5800
     * @tc.name      testJson03Chapter0058
     * @tc.desc      Test JSON.stringify with null replacer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0058";
      console.log(TAG + ' Start');
      const inputObj: PersonBasic = { name: "John", age: 30 };
      const result = JSON.stringify(inputObj, null);
      expect(result).assertEqual('{"name":"John","age":30}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_5900
     * @tc.name      testJson03Chapter0059
     * @tc.desc      Test JSON.stringify with null space parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0059";
      console.log(TAG + ' Start');
      const inputObj: PersonBasic = { name: "John", age: 30 };
      const result = JSON.stringify(inputObj);
      expect(result).assertEqual('{"name":"John","age":30}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_6000
     * @tc.name      testJson03Chapter0060
     * @tc.desc      Test JSON.stringify with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0060";
      console.log(TAG + ' Start');
      const obj: EmptyObject = {};
      const result = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.number    SUB_JSON_TEST03_6100
     * @tc.name      testJson03Chapter0061
     * @tc.desc      Test JSON.stringify with non-enumerable property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0061";
        console.log(TAG + ' Start');
        const obj: NonEnumerablePropertyObject = { a: 1 };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"a":1}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6200
     * @tc.name      testJson03Chapter0062
     * @tc.desc      Test JSON.stringify with inherited property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0062";
        console.log(TAG + ' Start');
        const child: ChildObject = { childProp: 2 };
        const result = JSON.stringify(child);
        expect(result).assertEqual('{"childProp":2}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6300
     * @tc.name      testJson03Chapter0063
     * @tc.desc      Test JSON.stringify with BigInt value (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0063";
        console.log(TAG + ' Start');
        try {
          const largeValue = 9007199254740991;
          const obj: BigIntObject = { value: largeValue };
          const result = JSON.stringify(obj);
          expect(result).assertEqual('{"value":9007199254740991}');
        } catch (err) {
          expect(err instanceof Error).assertEqual(true);
        }
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6400
     * @tc.name      testJson03Chapter0064
     * @tc.desc      Test JSON.stringify with function value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0064";
        console.log(TAG + ' Start');
        const func = (): string => {
          return "test";
        };
        const result = JSON.stringify(func);
        expect(result).assertEqual(undefined);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6500
     * @tc.name      testJson03Chapter0065
     * @tc.desc      Test JSON.stringify with symbol value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson03Chapter0065";
      console.log(TAG + ' Start');
      const func = (): string => "test";
      const result = JSON.stringify(func);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_JSON_TEST03_6600
     * @tc.name      testJson03Chapter0066
     * @tc.desc      Test JSON.stringify with array with holes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0066";
        console.log(TAG + ' Start');
        const arr = [1, , 3];
        const result = JSON.stringify(arr);
        expect(result).assertEqual('[1,null,3]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6700
     * @tc.name      testJson03Chapter0067
     * @tc.desc      Test JSON.stringify with special array index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0067";
        console.log(TAG + ' Start');
        const arr: SpecialArray = [];
        Reflect.set(arr, "abc", 111);
        Reflect.set(arr, "aaa", 222);
        const result = JSON.stringify(arr);
        expect(result).assertEqual('[]');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6800
     * @tc.name      testJson03Chapter0068
     * @tc.desc      Test JSON.stringify with negative space number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0068";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        const result = JSON.stringify(inputObj, undefined, -2);
        expect(result).assertEqual('{"name":"John","age":30}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_6900
     * @tc.name      testJson03Chapter0069
     * @tc.desc      Test JSON.stringify with large space number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0069";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        const result = JSON.stringify(inputObj, undefined, 100);
        expect(result.includes('\n')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7000
     * @tc.name      testJson03Chapter0070
     * @tc.desc      Test JSON.stringify with empty space string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0070";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        const result = JSON.stringify(inputObj, undefined, "");
        expect(result).assertEqual('{"name":"John","age":30}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7100
     * @tc.name      testJson03Chapter0071
     * @tc.desc      Test JSON.stringify with long space string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0071";
        console.log(TAG + ' Start');
        const inputObj: PersonBasic = { name: "John", age: 30 };
        const result = JSON.stringify(inputObj, undefined, "    ");
        expect(result.includes('    ')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7200
     * @tc.name      testJson03Chapter0072
     * @tc.desc      Test JSON.stringify with Transformer returning undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0072";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object | undefined => {
          if (key === "age") {
            return undefined;
          }
          return value;
        };
        const inputObj: PersonWithCity = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, replacer);
        expect(result).assertEqual('{"name":"John","city":"ChongQing"}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7300
     * @tc.name      testJson03Chapter0073
     * @tc.desc      Test JSON.stringify with Transformer returning different type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0073";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object => {
          if (key === "age") {
            return "thirty";
          }
          return value;
        };
        const inputObj: PersonWithCity = { name: "John", age: 30, city: "ChongQing" };
        const result = JSON.stringify(inputObj, replacer);
        expect(result).assertEqual('{"name":"John","age":"thirty","city":"ChongQing"}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7400
     * @tc.name      testJson03Chapter0074
     * @tc.desc      Test JSON.stringify with Transformer modifying structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0074";
        console.log(TAG + ' Start');
        const replacer: Transformer = (key: string, value: Object): Object => {
          if (key === "details") {
            return "modified_details";
          }
          return value;
        };
        const inputObj: PersonWithDetails = { name: "John", details: { age: 30 } };
        const result = JSON.stringify(inputObj, replacer);
        expect(result.includes('modified_details')).assertEqual(true);
      });
    /**
     * @tc.number    SUB_JSON_TEST03_7500
     * @tc.name      testJson03Chapter0075
     * @tc.desc      Test JSON.stringify with Uint8ClampedArray clamping behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0075";
        console.log(TAG + ' Start');
        const array = new Uint8ClampedArray([-1, 0, 128, 255, 256]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":0,"1":0,"2":128,"3":255,"4":255}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7600
     * @tc.name      testJson03Chapter0076
     * @tc.desc      Test JSON.stringify with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0076";
        console.log(TAG + ' Start');
        const array = new Int16Array([-32768, 32767]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":-32768,"1":32767}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7700
     * @tc.name      testJson03Chapter0077
     * @tc.desc      Test JSON.stringify with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0077";
        console.log(TAG + ' Start');
        const array = new Uint16Array([0, 65535]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":0,"1":65535}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7800
     * @tc.name      testJson03Chapter0078
     * @tc.desc      Test JSON.stringify with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0078";
        console.log(TAG + ' Start');
        const array = new Int32Array([-2147483648, 2147483647]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":-2147483648,"1":2147483647}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_7900
     * @tc.name      testJson03Chapter0079
     * @tc.desc      Test JSON.stringify with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0079";
        console.log(TAG + ' Start');
        const array = new Uint32Array([0, 4294967295]);
        const result = JSON.stringify(array);
        expect(result).assertEqual('{"0":0,"1":4294967295}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8000
     * @tc.name      testJson03Chapter0080
     * @tc.desc      Test JSON.stringify with Float32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0080";
        console.log(TAG + ' Start');
        const array = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
        const result = JSON.stringify(array);
        expect(result.includes('-3.4028234663852886e+38')).assertEqual(true);
        expect(result.includes('3.4028234663852886e+38')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8100
     * @tc.name      testJson03Chapter0081
     * @tc.desc      Test JSON.stringify with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0081";
        console.log(TAG + ' Start');
        const array = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]);
        const result = JSON.stringify(array);
        expect(result.includes('-1.7976931348623157e+308')).assertEqual(true);
        expect(result.includes('1.7976931348623157e+308')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8200
     * @tc.name      testJson03Chapter0082
     * @tc.desc      Test JSON.stringify with all ASCII special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0082";
        console.log(TAG + ' Start');
        const str = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        const result = JSON.stringify(str);
        expect(result.length > 0).assertEqual(true);
        expect(result.includes('\\"')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8300
     * @tc.name      testJson03Chapter0083
     * @tc.desc      Test JSON.stringify with double special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0083";
        console.log(TAG + ' Start');
        const str = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const result = JSON.stringify(str);
        expect(result.includes('\\"')).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8400
     * @tc.name      testJson03Chapter0084
     * @tc.desc      Test JSON.stringify with illegal Unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0084";
        console.log(TAG + ' Start');
        const str = "\udc04\ud83d\udff4";
        const result = JSON.stringify(str);
        expect(result.length > 0).assertEqual(true);
      });

    interface KeywordObject {
      key1: string;
      key2: string;
      key3: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_8500
     * @tc.name      testJson03Chapter0085
     * @tc.desc      Test JSON.stringify with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0085";
        console.log(TAG + ' Start');
        const obj: KeywordObject = {
          key1: "0",
          key2: "NaN",
          key3: ""
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"key1":"0","key2":"NaN","key3":""}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8600
     * @tc.name      testJson03Chapter0086
     * @tc.desc      Test JSON.stringify with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0086";
        console.log(TAG + ' Start');
        const result = JSON.stringify(Number.EPSILON);
        expect(result).assertEqual('2.220446049250313e-16');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_8700
     * @tc.name      testJson03Chapter0087
     * @tc.desc      Test JSON.stringify with -0 (negative zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0087";
        console.log(TAG + ' Start');
        const result = JSON.stringify(-0);
        expect(result).assertEqual('0');
      });

    interface ByteRangeObject {
      byteMin: number;
      byteMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_8800
     * @tc.name      testJson03Chapter0088
     * @tc.desc      Test JSON.stringify with byte range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0088";
        console.log(TAG + ' Start');
        const obj: ByteRangeObject = {
          byteMin: -128,
          byteMax: 127
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"byteMin":-128,"byteMax":127}');
      });

    interface ShortRangeObject {
      shortMin: number;
      shortMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_8900
     * @tc.name      testJson03Chapter0089
     * @tc.desc      Test JSON.stringify with short range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0089";
        console.log(TAG + ' Start');
        const obj: ShortRangeObject = {
          shortMin: -32768,
          shortMax: 32767
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"shortMin":-32768,"shortMax":32767}');
      });

    interface IntRangeObject {
      intMin: number;
      intMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_9000
     * @tc.name      testJson03Chapter0090
     * @tc.desc      Test JSON.stringify with int range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0090";
        console.log(TAG + ' Start');
        const obj: IntRangeObject = {
          intMin: -2147483648,
          intMax: 2147483647
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"intMin":-2147483648,"intMax":2147483647}');
      });

    interface LongRangeObject {
      longMin: number;
      longMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_9100
     * @tc.name      testJson03Chapter0091
     * @tc.desc      Test JSON.stringify with long range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0091";
        console.log(TAG + ' Start');
        const obj: LongRangeObject = {
          longMin: -9223372036854775808,
          longMax: 9223372036854775807
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"longMin":-9223372036854776000,"longMax":9223372036854776000}');
      });

    interface FloatRangeObject {
      floatMin: number;
      floatMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_9200
     * @tc.name      testJson03Chapter0092
     * @tc.desc      Test JSON.stringify with float range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0092";
        console.log(TAG + ' Start');
        const obj: FloatRangeObject = {
          floatMin: 1.401298464324817e-45,
          floatMax: 3.4028234663852886e38
        };
        const result = JSON.stringify(obj);
        expect(result.includes('1.401298464324817e-45')).assertEqual(true);
        expect(result.includes('3.4028234663852886e+38')).assertEqual(true);
      });

    interface DoubleRangeObject {
      doubleMin: number;
      doubleMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_9300
     * @tc.name      testJson03Chapter0093
     * @tc.desc      Test JSON.stringify with double range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0093";
        console.log(TAG + ' Start');
        const obj: DoubleRangeObject = {
          doubleMin: 4.9406564584124654e-324,
          doubleMax: 1.7976931348623157e308
        };
        const result = JSON.stringify(obj);
        expect(result.includes('5e-324')).assertEqual(true);
        expect(result.includes('1.7976931348623157e+308')).assertEqual(true);
      });

    interface CharRangeObject {
      charMin: number;
      charMax: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST03_9400
     * @tc.name      testJson03Chapter0094
     * @tc.desc      Test JSON.stringify with char range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0094";
        console.log(TAG + ' Start');
        const obj: CharRangeObject = {
          charMin: 0,
          charMax: 65535
        };
        const result = JSON.stringify(obj);
        expect(result).assertEqual('{"charMin":0,"charMax":65535}');
      });

    /**
     * @tc.number    SUB_JSON_TEST03_9500
     * @tc.name      testJson03Chapter0095
     * @tc.desc      Test JSON.stringify with small scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson03Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = "testJson03Chapter0095";
        console.log(TAG + ' Start');
        const result = JSON.stringify(2.5e-2);
        expect(result).assertEqual('0.025');
      });

    interface BooleanZeroObject {
      zeroAsFalse: number;
      truthyValue: number;
    }

  })

}