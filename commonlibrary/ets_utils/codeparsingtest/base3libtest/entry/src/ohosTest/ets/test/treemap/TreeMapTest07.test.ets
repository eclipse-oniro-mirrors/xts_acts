import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level,
  DEFAULT
} from '@ohos/hypium';
import { PlainArray, TreeMap, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap07Test() {
  describe('TreeMap07Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST07_0100
     * @tc.name      testTreeMap07Chapter0001
     * @tc.desc      Set with object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0001';
      console.log(TAG + ' start');

      interface ObjectWithTypedArray {
        buffer: Uint8Array;
        description: string;
      }

      let treeMap = new TreeMap<string, ObjectWithTypedArray>();
      let obj: ObjectWithTypedArray = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]),
        description: "Hello in bytes"
      };

      treeMap.set("withTypedArray", obj);
      let result = treeMap.get("withTypedArray");
      expect(result.description).assertEqual("Hello in bytes");
      expect(result.buffer.length).assertEqual(5);
      expect(result.buffer[0]).assertEqual(72);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0200
     * @tc.name      testTreeMap07Chapter0002
     * @tc.desc      Set with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0002';
      console.log(TAG + ' start');

      interface ObjectWithPromise {
        promise: Promise<string>;
        status: string;
      }

      let treeMap = new TreeMap<string, ObjectWithPromise>();
      let obj: ObjectWithPromise = {
        promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100)),
        status: "pending"
      };

      treeMap.set("withPromise", obj);
      let result = treeMap.get("withPromise");
      expect(result.status).assertEqual("pending");
      expect(result.promise instanceof Promise).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0300
     * @tc.name      testTreeMap07Chapter0003
     * @tc.desc      Set with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0003';
      console.log(TAG + ' start');

      interface ObjectWithRegExp {
        regex: RegExp;
        flags: RegExp;
      }

      let treeMap = new TreeMap<string, ObjectWithRegExp>();
      let obj: ObjectWithRegExp = {
        regex: /abc/gi,
        flags: /def/m
      };

      treeMap.set("withRegExp", obj);
      let result = treeMap.get("withRegExp");
      expect(result.regex.test("abc")).assertTrue();
      expect(result.flags.test("def")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0400
     * @tc.name      testTreeMap07Chapter0004
     * @tc.desc      Set with TypedArray containing NaN for Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0004';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float32Array>();
      let array = new Float32Array([NaN, 1.5, 2.7]);
      treeMap.set("float32NaN", array);
      let result = treeMap.get("float32NaN");
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(1.5);
      expect(Math.abs(result[2] - 2.7) < 0.0001).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0500
     * @tc.name      testTreeMap07Chapter0005
     * @tc.desc      Set with Int8Array containing Infinity (should be converted)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0005';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int8Array>();
      let array = new Int8Array([
        Number(Infinity),
        Number(-Infinity),
        Number(NaN),
        100
      ]);
      treeMap.set("int8Special", array);
      let result = treeMap.get("int8Special");
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0600
     * @tc.name      testTreeMap07Chapter0006
     * @tc.desc      Set with Uint8ClampedArray containing Infinity/NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0006';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8ClampedArray>();
      let array = new Uint8ClampedArray([
        Number(Infinity),
        Number(-Infinity),
        Number(NaN),
        150
      ]);
      treeMap.set("clampedSpecial", array);
      let result = treeMap.get("clampedSpecial");
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(150);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0700
     * @tc.name      testTreeMap07Chapter0007
     * @tc.desc      Set with string containing illegal Unicode encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0007';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();

      try {
        let illegalStr = "\udc04\ud83d\udff4";
        treeMap.set(illegalStr, 1);
        let result = treeMap.get(illegalStr);
        expect(result).assertEqual(1);
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }

    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0800
     * @tc.name      testTreeMap07Chapter0008
     * @tc.desc      Set with Number.EPSILON as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0008';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.EPSILON, "epsilon");
      expect(treeMap.get(Number.EPSILON)).assertEqual("epsilon");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_0900
     * @tc.name      testTreeMap07Chapter0009
     * @tc.desc      Set with float range boundary values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0009';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      let minFloat = 1.40129846432481707e-45;
      let maxFloat = 3.40282346638528860e+38;

      treeMap.set(minFloat, "min_float");
      treeMap.set(maxFloat, "max_float");
      treeMap.set(-minFloat, "neg_min_float");
      treeMap.set(-maxFloat, "neg_max_float");

      expect(treeMap.get(minFloat)).assertEqual("min_float");
      expect(treeMap.get(maxFloat)).assertEqual("max_float");
      expect(treeMap.get(-minFloat)).assertEqual("neg_min_float");
      expect(treeMap.get(-maxFloat)).assertEqual("neg_max_float");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1000
     * @tc.name      testTreeMap07Chapter0010
     * @tc.desc      Set with double range boundary values as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0010';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      let minDouble = 4.94065645841246544e-324;
      let maxDouble = 1.79769313486231570e+308;

      treeMap.set(minDouble, "min_double");
      treeMap.set(maxDouble, "max_double");
      treeMap.set(-minDouble, "neg_min_double");
      treeMap.set(-maxDouble, "neg_max_double");

      expect(treeMap.get(minDouble)).assertEqual("min_double");
      expect(treeMap.get(maxDouble)).assertEqual("max_double");
      expect(treeMap.get(-minDouble)).assertEqual("neg_min_double");
      expect(treeMap.get(-maxDouble)).assertEqual("neg_max_double");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1100
     * @tc.name      testTreeMap07Chapter0011
     * @tc.desc      Set with char range values (0 to 65535) as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0011';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      treeMap.set(0, "char_min");
      treeMap.set(65535, "char_max");
      treeMap.set(32768, "char_mid");

      expect(treeMap.get(0)).assertEqual("char_min");
      expect(treeMap.get(65535)).assertEqual("char_max");
      expect(treeMap.get(32768)).assertEqual("char_mid");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1200
     * @tc.name      testTreeMap07Chapter0012
     * @tc.desc      Set with BigInt value as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0012';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();

      let bigIntValue = BigInt("0xdecafafecacefade");
      treeMap.set(bigIntValue, "big_hex_value");

      expect(treeMap.get(bigIntValue)).assertEqual("big_hex_value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1300
     * @tc.name      testTreeMap07Chapter0013
     * @tc.desc      Set with double value 123.456 as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0013';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      treeMap.set(123.456, "double_value");

      expect(treeMap.get(123.456)).assertEqual("double_value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1400
     * @tc.name      testTreeMap07Chapter0014
     * @tc.desc      Set with hex float value as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0014';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      let hexValue = 0xcafebabe;
      treeMap.set(hexValue, "hex_float");

      expect(treeMap.get(hexValue)).assertEqual("hex_float");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1500
     * @tc.name      testTreeMap07Chapter0015
     * @tc.desc      Set with exponentiation operator result as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0015';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      let exponentResult = 2**3;
      treeMap.set(exponentResult, "exponent");

      expect(treeMap.get(8)).assertEqual("exponent");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1600
     * @tc.name      testTreeMap07Chapter0016
     * @tc.desc      Set with large BigInt value as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0016';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();

      let largeBigInt = 9007199254740991n;
      treeMap.set(largeBigInt, "large_bigint");

      expect(treeMap.get(largeBigInt)).assertEqual("large_bigint");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1700
     * @tc.name      testTreeMap07Chapter0017
     * @tc.desc      Set with boolean expression !'s' as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0017';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, boolean>();

      let boolValue1 = !'s';
      let boolValue2 = !0;

      treeMap.set("not_s", boolValue1);
      treeMap.set("not_zero", boolValue2);

      expect(treeMap.get("not_s")).assertFalse();
      expect(treeMap.get("not_zero")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1800
     * @tc.name      testTreeMap07Chapter0018
     * @tc.desc      Set with array containing non-numeric indices
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0018';
      console.log(TAG + ' start');

      class ArrayWithStringIndices {
        private data: Map<string, number> = new Map<string, number>();
        length: number = 0;

        setValue(key: string, value: number): void {
          this.data.set(key, value);
          this.length = this.data.size;
        }

        getValue(key: string): number | undefined {
          return this.data.get(key);
        }

        getAbcValue(): number {
          return this.data.get("abc") || 0;
        }

        getAaaValue(): number {
          return this.data.get("aaa") || 0;
        }
      }

      let treeMap = new TreeMap<string, ArrayWithStringIndices>();
      let arr: ArrayWithStringIndices = new ArrayWithStringIndices();
      arr.setValue("abc", 111);
      arr.setValue("aaa", 222);

      treeMap.set("special_array", arr);
      let result = treeMap.get("special_array");

      expect(result.getAbcValue()).assertEqual(111);
      expect(result.getAaaValue()).assertEqual(222);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_1900
     * @tc.name      testTreeMap07Chapter0019
     * @tc.desc      Set with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0019';
      console.log(TAG + ' start');

      interface SpecialArray {
        values: Array<number | string>;
      }

      let treeMap = new TreeMap<string, SpecialArray>();
      let specialArray: SpecialArray = {
        values: [72, 101, NaN, Infinity, 108, 111]
      };

      treeMap.set("nan_infinity_array", specialArray);
      let result = treeMap.get("nan_infinity_array");

      expect(result.values[0]).assertEqual(72);
      expect(result.values[1]).assertEqual(101);
      expect(isNaN(result.values[2] as number)).assertTrue();
      expect(result.values[3]).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2000
     * @tc.name      testTreeMap07Chapter0020
     * @tc.desc      Set with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0020';
      console.log(TAG + ' start');

      class OverflowArray {
        values: Uint8Array;

        constructor(values: number[]) {
          this.values = new Uint8Array(values.length);
          for (let i = 0; i < values.length; i++) {
            this.values[i] = values[i] & 0xFF;
          }
        }
      }

      let treeMap = new TreeMap<string, OverflowArray>();
      let overflowArray = new OverflowArray([256, 65536, 32768]);

      treeMap.set("overflow_array", overflowArray);
      let result = treeMap.get("overflow_array");

      expect(result.values[0]).assertEqual(0);
      expect(result.values[1]).assertEqual(0);
      expect(result.values[2]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2100
     * @tc.name      testTreeMap07Chapter0021
     * @tc.desc      Set with object containing mixed Symbol and string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0021';
      console.log(TAG + ' start');

      class MixedKeyObject {
        a: number = 1;
        b: number = 3;
        specialKey1: string = "special1";
        specialKey2: string = "special2";

        constructor() {
          this.a = 1;
          this.b = 3;
          this.specialKey1 = "special1";
          this.specialKey2 = "special2";
        }
      }

      let treeMap = new TreeMap<string, MixedKeyObject>();
      let mixedObj = new MixedKeyObject();

      treeMap.set("mixed_keys", mixedObj);
      let result = treeMap.get("mixed_keys");

      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual(3);
      expect(result.specialKey1).assertEqual("special1");
      expect(result.specialKey2).assertEqual("special2");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2200
     * @tc.name      testTreeMap07Chapter0022
     * @tc.desc      Set with large object containing many properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0022';
      console.log(TAG + ' start');

      class LargeObject {
        private properties: Map<string, number> = new Map<string, number>();

        constructor(size: number) {
          for (let i = 0; i < size; i++) {
            this.properties.set(`prop${i}`, i);
          }
        }

        getPropertyCount(): number {
          return this.properties.size;
        }

        getPropValue(key: string): number | undefined {
          return this.properties.get(key);
        }

        getProp0Value(): number {
          return this.properties.get("prop0") || 0;
        }

        getProp99Value(): number {
          return this.properties.get("prop99") || 0;
        }

        hasAllProperties(): boolean {
          for (let i = 0; i < 100; i++) {
            if (this.properties.get(`prop${i}`) !== i) {
              return false;
            }
          }
          return true;
        }
      }

      let treeMap = new TreeMap<string, LargeObject>();
      let largeObj = new LargeObject(100);

      treeMap.set("large_object", largeObj);
      let result = treeMap.get("large_object");

      expect(result.getPropertyCount()).assertEqual(100);
      expect(result.getProp0Value()).assertEqual(0);
      expect(result.getProp99Value()).assertEqual(99);
      expect(result.hasAllProperties()).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2300
     * @tc.name      testTreeMap07Chapter0023
     * @tc.desc      Set with object containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0023';
      console.log(TAG + ' start');


      class InnerObject {
        a: number;

        constructor(value: number) {
          this.a = value;
        }

        getValue(): number {
          return this.a;
        }
      }

      class ObjectWithMap {
        map: Map<string, number | InnerObject>;
        name: string;

        constructor() {
          this.map = new Map<string, number | InnerObject>();
          this.map.set("key1", 100);
          this.map.set("key2", new InnerObject(1));
          this.name = "object_with_map";
        }

        getKey1Value(): number {
          let value = this.map.get("key1");
          return typeof value === 'number' ? value : 0;
        }

        getKey2Value(): number {
          let value = this.map.get("key2");
          if (value instanceof InnerObject) {
            return value.getValue();
          }
          return 0;
        }
      }

      let treeMap = new TreeMap<string, ObjectWithMap>();
      let objWithMap = new ObjectWithMap();

      treeMap.set("with_map", objWithMap);
      let result = treeMap.get("with_map");

      expect(result.name).assertEqual("object_with_map");
      expect(result.getKey1Value()).assertEqual(100);
      expect(result.getKey2Value()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2400
     * @tc.name      testTreeMap07Chapter0024
     * @tc.desc      Set with object containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0024';
      console.log(TAG + ' start');

      class ObjectWithSet {
        set: Set<number>;
        description: string;

        constructor() {
          this.set = new Set<number>();
          this.set.add(1);
          this.set.add(2);
          this.set.add(3);
          this.set.add(2);
          this.set.add(1);
          this.description = "object_with_set";
        }

        getSetSize(): number {
          return this.set.size;
        }
      }

      let treeMap = new TreeMap<string, ObjectWithSet>();
      let objWithSet = new ObjectWithSet();

      treeMap.set("with_set", objWithSet);
      let result = treeMap.get("with_set");

      expect(result.description).assertEqual("object_with_set");
      expect(result.getSetSize()).assertEqual(3);
      expect(result.set.has(1)).assertTrue();
      expect(result.set.has(2)).assertTrue();
      expect(result.set.has(3)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2500
     * @tc.name      testTreeMap07Chapter0025
     * @tc.desc      Set with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0025';
      console.log(TAG + ' start');

      class ObjectWithPromise {
        promise: Promise<string>;
        status: string;

        constructor() {
          this.promise = new Promise<string>((resolve) => {
            setTimeout(() => {
              resolve('completed');
            }, 10);
          });
          this.status = "pending";
        }

        updateStatus(newStatus: string): void {
          this.status = newStatus;
        }
      }

      let treeMap = new TreeMap<string, ObjectWithPromise>();
      let objWithPromise = new ObjectWithPromise();

      treeMap.set("with_promise", objWithPromise);
      let result = treeMap.get("with_promise");

      expect(result.status).assertEqual("pending");
      expect(result.promise instanceof Promise).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2600
     * @tc.name      testTreeMap07Chapter0026
     * @tc.desc      Set with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0026';
      console.log(TAG + ' start');

      class ObjectWithRegExp {
        regex1: RegExp;
        regex2: RegExp;
        name: string;

        constructor() {
          this.regex1 = /abc/gi;
          this.regex2 = /def/m;
          this.name = "object_with_regex";
        }

        testRegex1(str: string): boolean {
          return this.regex1.test(str);
        }

        testRegex2(str: string): boolean {
          return this.regex2.test(str);
        }
      }

      let treeMap = new TreeMap<string, ObjectWithRegExp>();
      let objWithRegExp = new ObjectWithRegExp();

      treeMap.set("with_regex", objWithRegExp);
      let result = treeMap.get("with_regex");

      expect(result.name).assertEqual("object_with_regex");
      expect(result.testRegex1("abc")).assertTrue();
      expect(result.testRegex2("def")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2700
     * @tc.name      testTreeMap07Chapter0027
     * @tc.desc      Remove a string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      let result = treeMap.remove("sparrow");
      expect(result).assertEqual(356);
      expect(treeMap.get("sparrow")).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2800
     * @tc.name      testTreeMap07Chapter0028
     * @tc.desc      Remove a key that does not exist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 100);
      let result = treeMap.remove("key2");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_2900
     * @tc.name      testTreeMap07Chapter0029
     * @tc.desc      Remove with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("", 999);
      let result = treeMap.remove("");
      expect(result).assertEqual(999);
      expect(treeMap.hasKey("")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3000
     * @tc.name      testTreeMap07Chapter0030
     * @tc.desc      Remove with special character keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("!@#$%^&*()", 1);
      treeMap.set("key with spaces", 2);
      treeMap.set("key\twith\ttabs", 3);
      treeMap.set("key\nwith\nnewlines", 4);
      let result1 = treeMap.remove("!@#$%^&*()");
      let result2 = treeMap.remove("key with spaces");
      let result3 = treeMap.remove("key\twith\ttabs");
      let result4 = treeMap.remove("key\nwith\nnewlines");
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
      expect(result3).assertEqual(3);
      expect(result4).assertEqual(4);
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3100
     * @tc.name      testTreeMap07Chapter0031
     * @tc.desc      Remove with emoji keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0031';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("👆", 100);
      treeMap.set("👿", 200);
      treeMap.set("🤼‍♂️", 300);
      let result1 = treeMap.remove("👆");
      let result2 = treeMap.remove("👿");
      let result3 = treeMap.remove("🤼‍♂️");
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(300);
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3200
     * @tc.name      testTreeMap07Chapter0032
     * @tc.desc      Remove with number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0032';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      treeMap.set(1, "one");
      treeMap.set(-1, "minus one");
      treeMap.set(Number.MAX_SAFE_INTEGER, "max safe");
      let result1 = treeMap.remove(0);
      let result2 = treeMap.remove(1);
      let result3 = treeMap.remove(-1);
      let result4 = treeMap.remove(Number.MAX_SAFE_INTEGER);
      expect(result1).assertEqual("zero");
      expect(result2).assertEqual("one");
      expect(result3).assertEqual("minus one");
      expect(result4).assertEqual("max safe");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3300
     * @tc.name      testTreeMap07Chapter0033
     * @tc.desc      Remove with boolean keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(true, "truth");
      treeMap.set(false, "falsehood");
      let result1 = treeMap.remove(true);
      let result2 = treeMap.remove(false);
      expect(result1).assertEqual("truth");
      expect(result2).assertEqual("falsehood");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3400
     * @tc.name      testTreeMap07Chapter0034
     * @tc.desc      Remove with number boundary values as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "max value");
      treeMap.set(Number.MIN_VALUE, "min value");
      treeMap.set(Infinity, "infinity");
      treeMap.set(-Infinity, "negative infinity");
      let result1 = treeMap.remove(Number.MAX_VALUE);
      let result2 = treeMap.remove(Number.MIN_VALUE);
      let result3 = treeMap.remove(Infinity);
      let result4 = treeMap.remove(-Infinity);
      expect(result1).assertEqual("max value");
      expect(result2).assertEqual("min value");
      expect(result3).assertEqual("infinity");
      expect(result4).assertEqual("negative infinity");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3500
     * @tc.name      testTreeMap07Chapter0035
     * @tc.desc      Remove with array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Array<number>, string>();
      let key1: Array<number> = [1, 2, 3];
      let key2: Array<number> = [4, 5, 6];
      treeMap.set(key1, "first array");
      treeMap.set(key2, "second array");
      let result1 = treeMap.remove(key1);
      let result2 = treeMap.remove(key2);
      expect(result1).assertEqual("first array");
      expect(result2).assertEqual("second array");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3600
     * @tc.name      testTreeMap07Chapter0036
     * @tc.desc      Remove with custom object keys (using interface)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0036';
      console.log(TAG + ' start');

      interface MyKey {
        id: number;
        name: string;
      }

      let treeMap = new TreeMap<MyKey, string>((a: MyKey, b: MyKey) => {
        return a.id < b.id;
      });

      let key1: MyKey = { id: 1, name: "first" };
      let key2: MyKey = { id: 2, name: "second" };

      treeMap.set(key1, "first object");
      treeMap.set(key2, "second object");

      let result1 = treeMap.remove(key1);
      let result2 = treeMap.remove(key2);
      console.info(JSON.stringify(key1), result1)
      console.info(JSON.stringify(key2), result2)
      expect(result1).assertEqual("first object");
      expect(result2).assertEqual("second object");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3700
     * @tc.name      testTreeMap07Chapter0037
     * @tc.desc      Remove with TypedArray keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0037';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Int8Array, string>();
      let key1 = new Int8Array([1, 2, 3]);
      let key2 = new Int8Array([4, 5, 6]);
      treeMap.set(key1, "first typed array");
      treeMap.set(key2, "second typed array");
      let result1 = treeMap.remove(key1);
      let result2 = treeMap.remove(key2);
      expect(result1).assertEqual("first typed array");
      expect(result2).assertEqual("second typed array");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3800
     * @tc.name      testTreeMap07Chapter0038
     * @tc.desc      Remove with null key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0038';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<null, string>();
      let setSucceeded = false;
      let removeSucceeded = false;
      let removeResult: string | undefined;
      let errorCaught = false;

      try {
        treeMap.set(null, "null value");
        setSucceeded = true;

        removeResult = treeMap.remove(null);
        removeSucceeded = true;
      } catch (e) {
        errorCaught = true;
      }

      expect(setSucceeded).assertTrue();
      expect(removeSucceeded).assertTrue();
      expect(errorCaught).assertFalse();
      expect(removeResult).assertEqual("null value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_3900
     * @tc.name      testTreeMap07Chapter0039
     * @tc.desc      Remove with undefined key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0039';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<undefined, string>();
      let setSucceeded = false;
      let removeSucceeded = false;
      let removeResult: string | undefined;
      let errorCaught = false;

      try {
        treeMap.set(undefined, "undefined value");
        setSucceeded = true;

        removeResult = treeMap.remove(undefined);
        removeSucceeded = true;
      } catch (e) {
        errorCaught = true;
      }

      expect(setSucceeded).assertTrue();
      expect(removeSucceeded).assertTrue();
      expect(errorCaught).assertFalse();
      expect(removeResult).assertEqual("undefined value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4000
     * @tc.name      testTreeMap07Chapter0040
     * @tc.desc      Remove with key containing special unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("\ud83d\udc46", 1);
      treeMap.set("\ud83c\udff4", 2);
      let result1 = treeMap.remove("\ud83d\udc46");
      let result2 = treeMap.remove("\ud83c\udff4");
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4100
     * @tc.name      testTreeMap07Chapter0041
     * @tc.desc      Remove with bigint keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt(0), "zero");
      treeMap.set(BigInt(9223372036854775807), "max bigint");
      let result1 = treeMap.remove(BigInt(0));
      let result2 = treeMap.remove(BigInt(9223372036854775807));
      expect(result1).assertEqual("zero");
      expect(result2).assertEqual("max bigint");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4200
     * @tc.name      testTreeMap07Chapter0042
     * @tc.desc      Remove with undefined key (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0042';
      console.log(TAG + ' start');
      try {
        let treeMap = new TreeMap<string | undefined, number>();
        treeMap.set("key1", 100);
        treeMap.set(undefined, 200);
        let result1 = treeMap.remove("key1");
        let result2 = treeMap.remove(undefined);
        expect(result1).assertEqual(100);
        expect(result2).assertEqual(200);
      } catch (e) {
        expect(e instanceof Error).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4300
     * @tc.name      testTreeMap07Chapter0043
     * @tc.desc      Remove from empty TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let result = treeMap.remove("nonexistent");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4400
     * @tc.name      testTreeMap07Chapter0044
     * @tc.desc      Remove with function reference stored as key (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 100);

      const getKeyFromFunction = (): string => {
        return "functionReturnedKey";
      };

      treeMap.set(getKeyFromFunction(), 200);

      let result1 = treeMap.remove("key1");
      let result2 = treeMap.remove(getKeyFromFunction());
      let result3 = treeMap.remove("nonExistentKey");

      expect(result1).assertEqual(100);
      expect(result2).assertEqual(200);
      expect(result3).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4500
     * @tc.name      testTreeMap07Chapter0045
     * @tc.desc      Remove with string keys containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();

      let key1: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      let key2: string = "👆";
      let key3: string = "line1\nline2\tline3";
      let key4: string = "test🔧emoji";

      treeMap.set(key1, 1);
      treeMap.set(key2, 2);
      treeMap.set(key3, 3);
      treeMap.set(key4, 4);

      let result1 = treeMap.remove(key1);
      let result2 = treeMap.remove(key2);
      let result3 = treeMap.remove(key3);
      let result4 = treeMap.remove(key4);

      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
      expect(result3).assertEqual(3);
      expect(result4).assertEqual(4);
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4600
     * @tc.name      testTreeMap07Chapter0046
     * @tc.desc      Remove with numeric boundary keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0046';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();

      treeMap.set(Number.MAX_SAFE_INTEGER, "max safe integer");
      treeMap.set(Number.MIN_SAFE_INTEGER, "min safe integer");
      treeMap.set(Number.MAX_VALUE, "max value");
      treeMap.set(Number.MIN_VALUE, "min value");
      treeMap.set(0, "zero");
      treeMap.set(Infinity, "infinity");
      treeMap.set(-Infinity, "negative infinity");

      let result1 = treeMap.remove(Number.MAX_SAFE_INTEGER);
      let result2 = treeMap.remove(Number.MIN_SAFE_INTEGER);
      let result3 = treeMap.remove(Number.MAX_VALUE);
      let result4 = treeMap.remove(Number.MIN_VALUE);
      let result5 = treeMap.remove(0);
      let result7 = treeMap.remove(Infinity);
      let result8 = treeMap.remove(-Infinity);

      expect(result1).assertEqual("max safe integer");
      expect(result2).assertEqual("min safe integer");
      expect(result3).assertEqual("max value");
      expect(result4).assertEqual("min value");
      expect(result5).assertEqual("zero");
      expect(result7).assertEqual("infinity");
      expect(result8).assertEqual("negative infinity");
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4700
     * @tc.name      testTreeMap07Chapter0047
     * @tc.desc      Get lower key with normal number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0047';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(1, 'one');
      treeMap.set(2, 'two');
      treeMap.set(3, 'three');
      treeMap.set(4, 'four');
      const result = treeMap.getLowerKey(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4800
     * @tc.name      testTreeMap07Chapter0048
     * @tc.desc      Get lower key with boundary number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0048';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_SAFE_INTEGER, 'min');
      treeMap.set(-100, 'negative');
      treeMap.set(0, 'zero');
      treeMap.set(100, 'positive');
      treeMap.set(Number.MAX_SAFE_INTEGER, 'max');
      const result = treeMap.getLowerKey(0);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_4900
     * @tc.name      testTreeMap07Chapter0049
     * @tc.desc      Get lower key with no lower key exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0049';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(1, 'one');
      treeMap.set(2, 'two');
      treeMap.set(3, 'three');
      const result = treeMap.getLowerKey(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5000
     * @tc.name      testTreeMap07Chapter0050
     * @tc.desc      Get lower key with empty tree map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0050';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      const result = treeMap.getLowerKey(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5100
     * @tc.name      testTreeMap07Chapter0051
     * @tc.desc      Get lower key with decimal number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0051';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(1.1, 'one');
      treeMap.set(2.2, 'two');
      treeMap.set(3.3, 'three');
      treeMap.set(4.4, 'four');
      const result = treeMap.getLowerKey(3.3);
      expect(result).assertEqual(2.2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5200
     * @tc.name      testTreeMap07Chapter0052
     * @tc.desc      Get lower key with negative number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0052';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(-10, 'minus ten');
      treeMap.set(-5, 'minus five');
      treeMap.set(0, 'zero');
      treeMap.set(5, 'five');
      const result = treeMap.getLowerKey(0);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5300
     * @tc.name      testTreeMap07Chapter0053
     * @tc.desc      Get lower key with scientific notation number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0053';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, 'thousand');
      treeMap.set(2e3, 'two thousand');
      treeMap.set(3e3, 'three thousand');
      const result = treeMap.getLowerKey(2.5e3);
      expect(result).assertEqual(2e3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5400
     * @tc.name      testTreeMap07Chapter0054
     * @tc.desc      Get lower key with hexadecimal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0054';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(0x0A, 'ten');
      treeMap.set(0x14, 'twenty');
      treeMap.set(0x1E, 'thirty');
      const result = treeMap.getLowerKey(0x19);
      expect(result).assertEqual(0x14);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5500
     * @tc.name      testTreeMap07Chapter0055
     * @tc.desc      Get lower key with string key containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0055';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      treeMap.set("!", "exclamation");
      treeMap.set("@", "at");
      treeMap.set("#", "hash");
      treeMap.set("$", "dollar");
      const result = treeMap.getLowerKey("#");
      expect(result).assertEqual("!");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5600
     * @tc.name      testTreeMap07Chapter0056
     * @tc.desc      Get lower key with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0056';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      treeMap.set("", "empty");
      treeMap.set("a", "letter a");
      treeMap.set("b", "letter b");
      const result = treeMap.getLowerKey("a");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5700
     * @tc.name      testTreeMap07Chapter0057
     * @tc.desc      Get lower key with emoji string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0057';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      treeMap.set("👆", "up")
      treeMap.set("👿", "devil")
      treeMap.set("👀", "eyes")
      treeMap.set("💯", "hundred")
      const result = treeMap.getLowerKey("👿");
      const result1 = treeMap.getLowerKey("👆");
      const result2 = treeMap.getLowerKey("💯");
      expect(result).assertEqual('👆');
      expect(result1).assertEqual('👀');
      expect(result2).assertEqual('👿');
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5800
     * @tc.name      testTreeMap07Chapter0058
     * @tc.desc      Get lower key with long string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0058';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      const longStr1 = "a".repeat(1000);
      const longStr2 = "b".repeat(1000);
      const longStr3 = "c".repeat(1000);
      treeMap.set(longStr1, "long a");
      treeMap.set(longStr2, "long b");
      treeMap.set(longStr3, "long c");
      const result = treeMap.getLowerKey(longStr2);
      expect(result).assertEqual(longStr1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_5900
     * @tc.name      testTreeMap07Chapter0059
     * @tc.desc      Get lower key with boolean key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0059';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<boolean, string>();
      treeMap.set(false, "false");
      treeMap.set(true, "true");
      const result = treeMap.getLowerKey(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6000
     * @tc.name      testTreeMap07Chapter0060
     * @tc.desc      Get lower key with array key containing numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0060';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Array<number>, string>();
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      const arr3: Array<number> = [7, 8, 9];
      treeMap.set(arr1, "array 1");
      treeMap.set(arr2, "array 2");
      treeMap.set(arr3, "array 3");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6100
     * @tc.name      testTreeMap07Chapter0061
     * @tc.desc      Get lower key with object key containing simple properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0061';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
        name: string;
      }

      const treeMap = new TreeMap<TestObject, string>((a: TestObject, b: TestObject) => {
        return a.id < b.id;
      });
      const obj1: TestObject = { id: 1, name: "first" };
      const obj2: TestObject = { id: 2, name: "second" };
      const obj3: TestObject = { id: 3, name: "third" };
      treeMap.set(obj1, "object 1");
      treeMap.set(obj2, "object 2");
      treeMap.set(obj3, "object 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertEqual(obj2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6200
     * @tc.name      testTreeMap07Chapter0062
     * @tc.desc      Get lower key with key that does not exist in tree map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0062';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(10, "ten");
      treeMap.set(20, "twenty");
      treeMap.set(30, "thirty");
      const result = treeMap.getLowerKey(15);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6300
     * @tc.name      testTreeMap07Chapter0063
     * @tc.desc      Get lower key with minimum safe integer boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0063';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_SAFE_INTEGER + 1, "min plus one");
      treeMap.set(Number.MIN_SAFE_INTEGER, "min safe");
      const result = treeMap.getLowerKey(Number.MIN_SAFE_INTEGER + 1);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6400
     * @tc.name      testTreeMap07Chapter0064
     * @tc.desc      Get lower key with maximum safe integer boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0064';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER - 1, "max minus one");
      treeMap.set(Number.MAX_SAFE_INTEGER, "max safe");
      const result = treeMap.getLowerKey(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER - 1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6500
     * @tc.name      testTreeMap07Chapter0065
     * @tc.desc      Get lower key with negative zero key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0065';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(-1, "minus one");
      treeMap.set(-0, "negative zero");
      treeMap.set(1, "one");
      const result = treeMap.getLowerKey(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6600
     * @tc.name      testTreeMap07Chapter0066
     * @tc.desc      Get lower key with escape sequence string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0066';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      treeMap.set("\n", "newline");
      treeMap.set("\t", "tab");
      treeMap.set("\r", "carriage return");
      treeMap.set(" ", "space");
      const result = treeMap.getLowerKey("\r");
      expect(result).assertEqual("\n");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6700
     * @tc.name      testTreeMap07Chapter0067
     * @tc.desc      Get lower key with TypedArray key (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0067';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Int8Array, string>((a: Int8Array, b: Int8Array) => {
        return a[0] < b[0];
      });
      const arr1 = new Int8Array([1, 2, 3]);
      const arr2 = new Int8Array([4, 5, 6]);
      const arr3 = new Int8Array([7, 8, 9]);
      treeMap.set(arr1, "array 1");
      treeMap.set(arr2, "array 2");
      treeMap.set(arr3, "array 3");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6800
     * @tc.name      testTreeMap07Chapter0068
     * @tc.desc      Get lower key with TypedArray key containing boundary values (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0068';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Int8Array, string>((a: Int8Array, b: Int8Array) => {
        return a[0] < b[0];
      });
      const arr1 = new Int8Array([-128, 0, 127]);
      const arr2 = new Int8Array([-100, 50, 100]);
      const arr3 = new Int8Array([0, 0, 0]);
      treeMap.set(arr1, "boundary values");
      treeMap.set(arr2, "normal values");
      treeMap.set(arr3, "zero values");
      const result = treeMap.getLowerKey(arr2);
      expect(result).assertEqual(arr1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_6900
     * @tc.name      testTreeMap07Chapter0069
     * @tc.desc      Get lower key with Float32Array key containing Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0069';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Float32Array, string>();
      const arr1 = new Float32Array([1.5, 2.5, 3.5]);
      const arr2 = new Float32Array([Infinity, -Infinity, NaN]);
      const arr3 = new Float32Array([100.0, 200.0, 300.0]);
      treeMap.set(arr1, "normal floats");
      treeMap.set(arr2, "special values");
      treeMap.set(arr3, "large floats");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_7000
     * @tc.name      testTreeMap07Chapter0070
     * @tc.desc      Get lower key with Uint8ClampedArray key clamping behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0070';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Uint8ClampedArray, string>();
      const arr1 = new Uint8ClampedArray([0, 128, 255]);
      const arr2 = new Uint8ClampedArray([-1, 256, 300]);
      const arr3 = new Uint8ClampedArray([50, 100, 150]);
      treeMap.set(arr1, "valid range");
      treeMap.set(arr2, "clamped values");
      treeMap.set(arr3, "mid range");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_7100
     * @tc.name      testTreeMap07Chapter0071
     * @tc.desc      Get lower key with BigInt64Array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0071';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<BigInt64Array, string>();
      const arr1 = new BigInt64Array([-9223372036854775808n, 0n]);
      const arr2 = new BigInt64Array([0n, 9223372036854775807n]);
      const arr3 = new BigInt64Array([100n, 200n]);
      treeMap.set(arr1, "min boundary");
      treeMap.set(arr2, "max boundary");
      treeMap.set(arr3, "normal values");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_7200
     * @tc.name      testTreeMap07Chapter0072
     * @tc.desc      Get lower key with string key containing all ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0072';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      const str1 = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const str2 = "AAA";
      const str3 = "BBB";
      treeMap.set(str1, "full ASCII");
      treeMap.set(str2, "triple A");
      treeMap.set(str3, "triple B");
      const result = treeMap.getLowerKey(str2);
      expect(result).assertEqual(str1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_7300
     * @tc.name      testTreeMap07Chapter0073
     * @tc.desc      Get lower key with string key containing duplicate special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0073';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      const str1 = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const str2 = "middle";
      const str3 = "zzzz";
      treeMap.set(str1, "duplicate special chars");
      treeMap.set(str2, "middle string");
      treeMap.set(str3, "z string");
      const result = treeMap.getLowerKey(str2);
      expect(result).assertEqual(str1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST07_7400
     * @tc.name      testTreeMap07Chapter0074
     * @tc.desc      Get lower key with string key containing escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap07Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap07Chapter0074';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<string, string>();
      const str1 = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41";
      const str2 = "escape middle";
      const str3 = "zzz";
      treeMap.set(str1, "escape sequences");
      treeMap.set(str2, "middle");
      treeMap.set(str3, "end");
      const result = treeMap.getLowerKey(str2);
      expect(result).assertEqual(str1);
    });
  })
}