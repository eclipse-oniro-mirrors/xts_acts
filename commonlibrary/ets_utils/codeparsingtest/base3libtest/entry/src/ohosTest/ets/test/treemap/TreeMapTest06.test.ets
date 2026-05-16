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


interface GeneratedTypeLiteralInterface_2 {
  e: number;
}

interface GeneratedTypeLiteralInterface_1 {
  c: number;
  d: GeneratedTypeLiteralInterface_2;
}

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: string;
  c: number[];
}

interface GeneratedObjectLiteralInterface_2 {
  a: undefined;
  b: null;
  c: number;
}

interface GeneratedObjectLiteralInterface_3 {
  a: number;
  b: number;
  c: number;
}

interface GeneratedObjectLiteralInterface_4 {
  parentProp: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}
export default function TreeMap06Test() {
  describe('TreeMap06Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST06_0100
     * @tc.name      testTreeMap06Chapter0001
     * @tc.desc      Test setAll with TreeMap containing array with large numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0001';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Array<number>>();
      treeMap1.set("largeArray", [256, 65536, 32768]);
      let treeMap2 = new TreeMap<string, Array<number>>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("largeArray")[0]).assertEqual(256);
      expect(treeMap2.get("largeArray")[1]).assertEqual(65536);
      expect(treeMap2.get("largeArray")[2]).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0200
     * @tc.name      testTreeMap06Chapter0002
     * @tc.desc      Test setAll with TreeMap containing nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0002';
      console.log(TAG + ' start');

      interface DeepNested {
        e: number;
      }

      interface MiddleNested {
        c: number;
        d: DeepNested;
      }

      interface NestedObj {
        a: number;
        b: MiddleNested;
      }

      let treeMap1 = new TreeMap<string, NestedObj>();

      let deepNested: DeepNested = { e: 3 };
      let middleNested: MiddleNested = { c: 2, d: deepNested };
      let nestedObj: NestedObj = { a: 1, b: middleNested };

      treeMap1.set("nested", nestedObj);

      let treeMap2 = new TreeMap<string, NestedObj>();
      treeMap2.setAll(treeMap1);

      expect(treeMap2.length).assertEqual(1);

      let resultObj: NestedObj = treeMap2.get("nested");
      expect(resultObj.a).assertEqual(1);
      expect(resultObj.b.c).assertEqual(2);
      expect(resultObj.b.d.e).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0300
     * @tc.name      testTreeMap06Chapter0003
     * @tc.desc      Test setAll with TreeMap containing object with undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0003';
      console.log(TAG + ' start');

      interface MixedObj {
        a: undefined;
        b: null;
        c: number;
      }

      let treeMap1 = new TreeMap<string, MixedObj>();
      treeMap1.set("mixed", { a: undefined, b: null, c: 1 });
      let treeMap2 = new TreeMap<string, MixedObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("mixed").a).assertUndefined();
      expect(treeMap2.get("mixed").b).assertNull();
      expect(treeMap2.get("mixed").c).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0400
     * @tc.name      testTreeMap06Chapter0004
     * @tc.desc      Test setAll with TreeMap containing object with NaN and Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0004';
      console.log(TAG + ' start');

      interface SpecialNumObj {
        nanProp: number;
        infProp: number;
        negInfProp: number;
      }

      let treeMap1 = new TreeMap<string, SpecialNumObj>();
      treeMap1.set("special", { nanProp: NaN, infProp: Infinity, negInfProp: -Infinity });
      let treeMap2 = new TreeMap<string, SpecialNumObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(isNaN(treeMap2.get("special").nanProp)).assertTrue();
      expect(treeMap2.get("special").infProp).assertEqual(Infinity);
      expect(treeMap2.get("special").negInfProp).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0500
     * @tc.name      testTreeMap06Chapter0005
     * @tc.desc      Test setAll with TreeMap containing object with Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0005';
      console.log(TAG + ' start');

      interface NestedValue {
        a: number;
      }

      type MapValueType = string | NestedValue;

      interface MapObj {
        map: Map<string, MapValueType>;
      }

      let treeMap1 = new TreeMap<string, MapObj>();

      let map = new Map<string, MapValueType>();
      map.set('key1', 'value1');

      let nestedValue: NestedValue = { a: 1 };
      map.set('key2', nestedValue);

      let mapObj: MapObj = { map: map };
      treeMap1.set("mapObj", mapObj);

      let treeMap2 = new TreeMap<string, MapObj>();
      treeMap2.setAll(treeMap1);

      expect(treeMap2.length).assertEqual(1);

      let resultMapObj: MapObj = treeMap2.get("mapObj");
      let resultMap: Map<string, MapValueType> = resultMapObj.map;

      expect(resultMap.get('key1')).assertEqual('value1');

      let key2Value: MapValueType | undefined = resultMap.get('key2');
      let isNestedValue = key2Value !== undefined && typeof key2Value !== 'string';

      expect(isNestedValue).assertTrue();

      if (key2Value !== undefined && typeof key2Value !== 'string') {
        expect(key2Value.a).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0600
     * @tc.name      testTreeMap06Chapter0006
     * @tc.desc      Test setAll with TreeMap containing object with Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0006';
      console.log(TAG + ' start');

      interface SetObj {
        set: Set<number>;
      }

      let treeMap1 = new TreeMap<string, SetObj>();
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      set.add(2);
      treeMap1.set("setObj", { set: set });
      let treeMap2 = new TreeMap<string, SetObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("setObj").set.size).assertEqual(3);
      expect(treeMap2.get("setObj").set.has(1)).assertTrue();
      expect(treeMap2.get("setObj").set.has(2)).assertTrue();
      expect(treeMap2.get("setObj").set.has(3)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0700
     * @tc.name      testTreeMap06Chapter0007
     * @tc.desc      Test setAll with TreeMap containing object with Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0007';
      console.log(TAG + ' start');

      interface PromiseObj {
        promise: Promise<string>;
      }

      let treeMap1 = new TreeMap<string, PromiseObj>();
      let promise = new Promise<string>((resolve) => {
        setTimeout(() => resolve('done'), 100);
      });
      treeMap1.set("promiseObj", { promise: promise });
      let treeMap2 = new TreeMap<string, PromiseObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("promiseObj").promise instanceof Promise).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0800
     * @tc.name      testTreeMap06Chapter0008
     * @tc.desc      Test setAll with TreeMap containing object with RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0008';
      console.log(TAG + ' start');

      interface RegExpObj {
        regex: RegExp;
        flags: RegExp;
      }

      let treeMap1 = new TreeMap<string, RegExpObj>();
      treeMap1.set("regexObj", { regex: /abc/gi, flags: /def/m });
      let treeMap2 = new TreeMap<string, RegExpObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("regexObj").regex.source).assertEqual("abc");
      expect(treeMap2.get("regexObj").regex.flags.includes("g")).assertTrue();
      expect(treeMap2.get("regexObj").regex.flags.includes("i")).assertTrue();
      expect(treeMap2.get("regexObj").flags.source).assertEqual("def");
      expect(treeMap2.get("regexObj").flags.flags.includes("m")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_0900
     * @tc.name      testTreeMap06Chapter0009
     * @tc.desc      Test setAll with TreeMap containing very large string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0009';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, string>();
      let largeString = "a".repeat(10000);
      treeMap1.set("largeString", largeString);
      let treeMap2 = new TreeMap<string, string>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("largeString").length).assertEqual(10000);
      expect(treeMap2.get("largeString").charAt(0)).assertEqual("a");
      expect(treeMap2.get("largeString").charAt(9999)).assertEqual("a");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1000
     * @tc.name      testTreeMap06Chapter0010
     * @tc.desc      Test setAll with TreeMap containing number keys with various representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0010';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, string>();
      treeMap1.set(0x0102, "hex");
      treeMap1.set(0x01020304, "hex32");
      treeMap1.set(0o3, "octal");
      treeMap1.set(1e3, "scientific");
      treeMap1.set(2.5e-2, "scientific2");
      let treeMap2 = new TreeMap<number, string>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get(0x0102)).assertEqual("hex");
      expect(treeMap2.get(258)).assertEqual("hex");
      expect(treeMap2.get(0x01020304)).assertEqual("hex32");
      expect(treeMap2.get(0o3)).assertEqual("octal");
      expect(treeMap2.get(1e3)).assertEqual("scientific");
      expect(treeMap2.get(2.5e-2)).assertEqual("scientific2");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1100
     * @tc.name      testTreeMap06Chapter0011
     * @tc.desc      Test setAll with TreeMap containing boolean values with falsy conversions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0011';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, boolean>();
      treeMap1.set("zero", false);
      treeMap1.set("nan", false);
      treeMap1.set("empty", false);
      treeMap1.set("null", false);
      treeMap1.set("undefined", false);
      treeMap1.set("normalTrue", true);
      treeMap1.set("normalFalse", false);
      let treeMap2 = new TreeMap<string, boolean>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(7);
      expect(treeMap2.get("zero")).assertFalse();
      expect(treeMap2.get("nan")).assertFalse();
      expect(treeMap2.get("empty")).assertFalse();
      expect(treeMap2.get("null")).assertFalse();
      expect(treeMap2.get("undefined")).assertFalse();
      expect(treeMap2.get("normalTrue")).assertTrue();
      expect(treeMap2.get("normalFalse")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1200
     * @tc.name      testTreeMap06Chapter0012
     * @tc.desc      Test setAll with TreeMap containing object with ArrayBuffer property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0012';
      console.log(TAG + ' start');

      interface BufferObj {
        buffer: ArrayBuffer;
      }

      let treeMap1 = new TreeMap<string, BufferObj>();
      let buffer = new ArrayBuffer(16);
      treeMap1.set("bufferObj", { buffer: buffer });
      let treeMap2 = new TreeMap<string, BufferObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("bufferObj").buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1300
     * @tc.name      testTreeMap06Chapter0013
     * @tc.desc      Test setAll with TreeMap containing object with DataView property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0013';
      console.log(TAG + ' start');

      interface DataViewObj {
        view: DataView;
      }

      let treeMap1 = new TreeMap<string, DataViewObj>();
      let dataView = new DataView(new ArrayBuffer(16));
      dataView.setInt8(0, 127);
      treeMap1.set("dataViewObj", { view: dataView });
      let treeMap2 = new TreeMap<string, DataViewObj>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("dataViewObj").view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1400
     * @tc.name      testTreeMap06Chapter0014
     * @tc.desc      Test setAll performance with very large TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0014';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, number>();
      let treeMap2 = new TreeMap<number, number>();
      for (let i = 0; i < 10000; i++) {
        treeMap1.set(i, i * 2);
      }
      for (let i = 10000; i < 15000; i++) {
        treeMap2.set(i, i * 3);
      }
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(15000);
      expect(treeMap2.get(5000)).assertEqual(10000);
      expect(treeMap2.get(12000)).assertEqual(36000);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1500
     * @tc.name      testTreeMap06Chapter0015
     * @tc.desc      Test setAll with TreeMap containing keys with special string concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0015';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      let specialString = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      treeMap1.set(specialString, 1);
      treeMap1.set("normal", 2);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get(specialString)).assertEqual(1);
      expect(treeMap2.get("normal")).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1600
     * @tc.name      testTreeMap06Chapter0016
     * @tc.desc      Test setAll with TreeMap containing all ASCII characters as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0016';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      let asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      for (let i = 0; i < asciiChars.length; i++) {
        treeMap1.set(asciiChars.charAt(i), i);
      }
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(asciiChars.length);
      expect(treeMap2.get("A")).assertEqual(asciiChars.indexOf("A"));
      expect(treeMap2.get("z")).assertEqual(asciiChars.indexOf("z"));
      expect(treeMap2.get("0")).assertEqual(asciiChars.indexOf("0"));
      expect(treeMap2.get("~")).assertEqual(asciiChars.length - 1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1700
     * @tc.name      testTreeMap06Chapter0017
     * @tc.desc      Set key-value pair with string key and number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0017';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let result = treeMap.set("key1", 100);
      expect(result === treeMap).assertTrue();
      expect(treeMap.get("key1")).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1800
     * @tc.name      testTreeMap06Chapter0018
     * @tc.desc      Update existing key with new value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0018';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("key1", "value1");
      treeMap.set("key1", "value2");
      expect(treeMap.get("key1")).assertEqual("value2");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_1900
     * @tc.name      testTreeMap06Chapter0019
     * @tc.desc      Set with string key as empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0019';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("", 100);
      expect(treeMap.get("")).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2000
     * @tc.name      testTreeMap06Chapter0020
     * @tc.desc      Set with string key containing all special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0020';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let specialStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      treeMap.set(specialStr, 1);
      expect(treeMap.get(specialStr)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2100
     * @tc.name      testTreeMap06Chapter0021
     * @tc.desc      Set with string key as ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0021';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let asciiStr = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      treeMap.set(asciiStr, 2);
      expect(treeMap.get(asciiStr)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2200
     * @tc.name      testTreeMap06Chapter0022
     * @tc.desc      Set with string key containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0022';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let escapeStr = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41\\101";
      treeMap.set(escapeStr, 3);
      expect(treeMap.get(escapeStr)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2300
     * @tc.name      testTreeMap06Chapter0023
     * @tc.desc      Set with string key as emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0023';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let emojiKey = "👆";
      treeMap.set(emojiKey, 4);
      expect(treeMap.get(emojiKey)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2400
     * @tc.name      testTreeMap06Chapter0024
     * @tc.desc      Set with number key as 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0024';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      expect(treeMap.get(0)).assertEqual("zero");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2500
     * @tc.name      testTreeMap06Chapter0025
     * @tc.desc      Set with number key as NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0025';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(NaN, "nan");
      expect(treeMap.get(NaN)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2600
     * @tc.name      testTreeMap06Chapter0026
     * @tc.desc      Set with number key as Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0026';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Infinity, "infinity");
      expect(treeMap.get(Infinity)).assertEqual("infinity");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2700
     * @tc.name      testTreeMap06Chapter0027
     * @tc.desc      Set with number key as Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "max");
      expect(treeMap.get(Number.MAX_VALUE)).assertEqual("max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2800
     * @tc.name      testTreeMap06Chapter0028
     * @tc.desc      Set with number key as Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_VALUE, "min");
      expect(treeMap.get(Number.MIN_VALUE)).assertEqual("min");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_2900
     * @tc.name      testTreeMap06Chapter0029
     * @tc.desc      Set with number key as Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "safeMax");
      expect(treeMap.get(Number.MAX_SAFE_INTEGER)).assertEqual("safeMax");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3000
     * @tc.name      testTreeMap06Chapter0030
     * @tc.desc      Set with TypedArray value (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8Array>();
      let array = new Uint8Array([72, 101, 108, 108, 111]);
      treeMap.set("typedArray", array);
      let result = treeMap.get("typedArray");
      expect(result instanceof Uint8Array).assertTrue();
      expect(result[0]).assertEqual(72);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3100
     * @tc.name      testTreeMap06Chapter0031
     * @tc.desc      Set with TypedArray value containing boundary values (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0031';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int8Array>();
      let array = new Int8Array([-128, 0, 127]);
      treeMap.set("boundary", array);
      let result = treeMap.get("boundary");
      expect(result[0]).assertEqual(-128);
      expect(result[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3200
     * @tc.name      testTreeMap06Chapter0032
     * @tc.desc      Set with boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0032';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, boolean>();
      treeMap.set("boolTrue", true);
      treeMap.set("boolFalse", false);
      expect(treeMap.get("boolTrue")).assertTrue();
      expect(treeMap.get("boolFalse")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3300
     * @tc.name      testTreeMap06Chapter0033
     * @tc.desc      Set with array value containing numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let array = [1, 2, 3, 4, 5];
      treeMap.set("numberArray", array);
      let result = treeMap.get("numberArray");
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3400
     * @tc.name      testTreeMap06Chapter0034
     * @tc.desc      Set with array value containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<string | number | boolean | null | undefined>>();
      let array: Array<string | number | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      treeMap.set("mixedArray", array);
      let result = treeMap.get("mixedArray");
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(72);
      expect(result[1]).assertEqual("abc");
      expect(result[2]).assertTrue();
      expect(result[3]).assertNull();
      expect(result[4]).assertUndefined();
      expect(result[5]).assertEqual(108);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3500
     * @tc.name      testTreeMap06Chapter0035
     * @tc.desc      Set with empty array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let array: number[] = [];
      treeMap.set("emptyArray", array);
      let result = treeMap.get("emptyArray");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3600
     * @tc.name      testTreeMap06Chapter0036
     * @tc.desc      Set with object value containing basic properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0036';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, object>();
      let obj: GeneratedObjectLiteralInterface_1 = { a: 1, b: "test", c: [1, 2, 3] };
      treeMap.set("object", obj);
      let result = treeMap.get("object");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3700
     * @tc.name      testTreeMap06Chapter0037
     * @tc.desc      Set with nested object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0037';
      console.log(TAG + ' start');

      interface NestedObject {
        a: number;
        b: GeneratedTypeLiteralInterface_1;
      }

      let treeMap = new TreeMap<string, NestedObject>();
      let obj: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      treeMap.set("nested", obj);
      let result = treeMap.get("nested");
      expect(result !== undefined).assertTrue();
      expect(result.a).assertEqual(1);
      expect(result.b.c).assertEqual(2);
      expect(result.b.d.e).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3800
     * @tc.name      testTreeMap06Chapter0038
     * @tc.desc      Set with object containing undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0038';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, object>();
      let obj: GeneratedObjectLiteralInterface_2 = { a: undefined, b: null, c: 1 };
      treeMap.set("undefinedNull", obj);
      let result = treeMap.get("undefinedNull");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_3900
     * @tc.name      testTreeMap06Chapter0039
     * @tc.desc      Set with object containing NaN and Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0039';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, object>();
      let obj: GeneratedObjectLiteralInterface_3 = { a: NaN, b: Infinity, c: -Infinity };
      treeMap.set("specialNumbers", obj);
      let result = treeMap.get("specialNumbers");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4000
     * @tc.name      testTreeMap06Chapter0040
     * @tc.desc      Set with Map value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Map<string, number>>();
      let map = new Map<string, number>();
      map.set("key1", 100);
      map.set("key2", 200);
      treeMap.set("map", map);
      let result = treeMap.get("map");
      expect(result instanceof Map).assertTrue();
      expect(result.get("key1")).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4100
     * @tc.name      testTreeMap06Chapter0041
     * @tc.desc      Set with Set value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Set<number>>();
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      treeMap.set("set", set);
      let result = treeMap.get("set");
      expect(result instanceof Set).assertTrue();
      expect(result.has(1)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4200
     * @tc.name      testTreeMap06Chapter0042
     * @tc.desc      Set with Regular Expression value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0042';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, RegExp>();
      let regex = /abc/gi;
      treeMap.set("regex", regex);
      let result = treeMap.get("regex");
      expect(result instanceof RegExp).assertTrue();
      expect(result.test("abc")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4300
     * @tc.name      testTreeMap06Chapter0043
     * @tc.desc      Set with null key (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set(null, 100);
      expect(treeMap.get(null)).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4400
     * @tc.name      testTreeMap06Chapter0044
     * @tc.desc      Set with undefined key (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set(undefined, 100);
      expect(treeMap.get(undefined)).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4500
     * @tc.name      testTreeMap06Chapter0045
     * @tc.desc      Set with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number | undefined>();
      treeMap.set("key", undefined);
      expect(treeMap.get("key")).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4600
     * @tc.name      testTreeMap06Chapter0046
     * @tc.desc      Set with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0046';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number | null>();
      treeMap.set("key", null);
      expect(treeMap.get("key")).assertNull();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4700
     * @tc.name      testTreeMap06Chapter0047
     * @tc.desc      Set with Float32Array value containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0047';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float32Array>();
      let array = new Float32Array([Infinity, -Infinity, NaN, 0]);
      treeMap.set("floatSpecial", array);
      let result = treeMap.get("floatSpecial");
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4800
     * @tc.name      testTreeMap06Chapter0048
     * @tc.desc      Set with BigInt64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0048';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, BigInt64Array>();
      let array = new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]);
      treeMap.set("bigInt", array);
      let result = treeMap.get("bigInt");
      expect(result[0]).assertEqual(-9223372036854775808n);
      expect(result[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_4900
     * @tc.name      testTreeMap06Chapter0049
     * @tc.desc      Set with large string as key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0049';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let largeString = "a".repeat(10000);
      treeMap.set(largeString, 100);
      expect(treeMap.get(largeString)).assertEqual(100);
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST06_5000
     * @tc.name      testTreeMap06Chapter0050
     * @tc.desc      Set with Int8Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0050';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int8Array>();
      let array = new Int8Array([-128, -1, 0, 127]);
      treeMap.set("int8Boundary", array);
      let result = treeMap.get("int8Boundary");
      expect(result[0]).assertEqual(-128);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5100
     * @tc.name      testTreeMap06Chapter0051
     * @tc.desc      Set with Uint8Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0051';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8Array>();
      let array = new Uint8Array([0, 1, 254, 255]);
      treeMap.set("uint8Boundary", array);
      let result = treeMap.get("uint8Boundary");
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(254);
      expect(result[3]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5200
     * @tc.name      testTreeMap06Chapter0052
     * @tc.desc      Set with Uint8ClampedArray clamping test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0052';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8ClampedArray>();
      let array = new Uint8ClampedArray([-1, 0, 255, 256]);
      treeMap.set("clamped", array);
      let result = treeMap.get("clamped");
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(255);
      expect(result[3]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5300
     * @tc.name      testTreeMap06Chapter0053
     * @tc.desc      Set with Int16Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0053';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int16Array>();
      let array = new Int16Array([-32768, -1, 0, 32767]);
      treeMap.set("int16Boundary", array);
      let result = treeMap.get("int16Boundary");
      expect(result[0]).assertEqual(-32768);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5400
     * @tc.name      testTreeMap06Chapter0054
     * @tc.desc      Set with Uint16Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0054';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint16Array>();
      let array = new Uint16Array([0, 1, 65534, 65535]);
      treeMap.set("uint16Boundary", array);
      let result = treeMap.get("uint16Boundary");
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(65534);
      expect(result[3]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5500
     * @tc.name      testTreeMap06Chapter0055
     * @tc.desc      Set with Int32Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0055';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int32Array>();
      let array = new Int32Array([-2147483648, -1, 0, 2147483647]);
      treeMap.set("int32Boundary", array);
      let result = treeMap.get("int32Boundary");
      expect(result[0]).assertEqual(-2147483648);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5600
     * @tc.name      testTreeMap06Chapter0056
     * @tc.desc      Set with Uint32Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0056';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint32Array>();
      let array = new Uint32Array([0, 1, 4294967294, 4294967295]);
      treeMap.set("uint32Boundary", array);
      let result = treeMap.get("uint32Boundary");
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(4294967294);
      expect(result[3]).assertEqual(4294967295);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5700
     * @tc.name      testTreeMap06Chapter0057
     * @tc.desc      Set with Float32Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0057';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float32Array>();
      let maxFloat32 = 3.4028234663852886e38;
      let minFloat32 = -3.4028234663852886e38;
      let array = new Float32Array([minFloat32, -1.5, 0, 1.5, maxFloat32]);
      treeMap.set("float32Boundary", array);
      let result = treeMap.get("float32Boundary");
      expect(result[0]).assertEqual(minFloat32);
      expect(result[2]).assertEqual(0);
      expect(result[4]).assertEqual(maxFloat32);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5800
     * @tc.name      testTreeMap06Chapter0058
     * @tc.desc      Set with Float64Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0058';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float64Array>();
      let maxFloat64 = 1.7976931348623157e308;
      let minFloat64 = -1.7976931348623157e308;
      let array = new Float64Array([minFloat64, -1.5, 0, 1.5, maxFloat64]);
      treeMap.set("float64Boundary", array);
      let result = treeMap.get("float64Boundary");
      expect(result[0]).assertEqual(minFloat64);
      expect(result[2]).assertEqual(0);
      expect(result[4]).assertEqual(maxFloat64);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_5900
     * @tc.name      testTreeMap06Chapter0059
     * @tc.desc      Set with BigInt64Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0059';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, BigInt64Array>();
      let array = new BigInt64Array([-9223372036854775808n, -1n, 0n, 9223372036854775807n]);
      treeMap.set("bigInt64Boundary", array);
      let result = treeMap.get("bigInt64Boundary");
      expect(result[0]).assertEqual(-9223372036854775808n);
      expect(result[1]).assertEqual(-1n);
      expect(result[2]).assertEqual(0n);
      expect(result[3]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6000
     * @tc.name      testTreeMap06Chapter0060
     * @tc.desc      Set with BigUint64Array containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0060';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, BigUint64Array>();
      let array = new BigUint64Array([0n, 1n, 18446744073709551614n, 18446744073709551615n]);
      treeMap.set("bigUint64Boundary", array);
      let result = treeMap.get("bigUint64Boundary");
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(1n);
      expect(result[2]).assertEqual(18446744073709551614n);
      expect(result[3]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6100
     * @tc.name      testTreeMap06Chapter0061
     * @tc.desc      Set with TypedArray containing NaN/Infinity special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0061';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float32Array>();
      let array = new Float32Array([Infinity, -Infinity, NaN, 0]);
      treeMap.set("specialValues", array);
      let result = treeMap.get("specialValues");
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(isNaN(result[2])).assertTrue();
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6200
     * @tc.name      testTreeMap06Chapter0062
     * @tc.desc      Set with string key as double special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0062';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let doubleSpecial = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      treeMap.set(doubleSpecial, 62);
      expect(treeMap.get(doubleSpecial)).assertEqual(62);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6300
     * @tc.name      testTreeMap06Chapter0063
     * @tc.desc      Set with string key as keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0063';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("0", 6301);
      treeMap.set("NaN", 6302);
      treeMap.set("", 6303);
      expect(treeMap.get("0")).assertEqual(6301);
      expect(treeMap.get("NaN")).assertEqual(6302);
      expect(treeMap.get("")).assertEqual(6303);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6400
     * @tc.name      testTreeMap06Chapter0064
     * @tc.desc      Set with string value containing escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0064';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("escapes", "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x41");
      let result = treeMap.get("escapes");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6500
     * @tc.name      testTreeMap06Chapter0065
     * @tc.desc      Set with multiple emoji string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0065';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("👆", 6501);
      treeMap.set("👿", 6502);
      treeMap.set("👀", 6503);
      treeMap.set("💯", 6504);
      treeMap.set("🎅", 6505);
      expect(treeMap.get("👆")).assertEqual(6501);
      expect(treeMap.get("👿")).assertEqual(6502);
      expect(treeMap.get("👀")).assertEqual(6503);
      expect(treeMap.get("💯")).assertEqual(6504);
      expect(treeMap.get("🎅")).assertEqual(6505);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6600
     * @tc.name      testTreeMap06Chapter0066
     * @tc.desc      Set with number key as byte range boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0066';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-128, "byte_min");
      treeMap.set(0, "byte_zero");
      treeMap.set(127, "byte_max");
      expect(treeMap.get(-128)).assertEqual("byte_min");
      expect(treeMap.get(0)).assertEqual("byte_zero");
      expect(treeMap.get(127)).assertEqual("byte_max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6700
     * @tc.name      testTreeMap06Chapter0067
     * @tc.desc      Set with number key as short range boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0067';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, "short_min");
      treeMap.set(0, "short_zero");
      treeMap.set(32767, "short_max");
      expect(treeMap.get(-32768)).assertEqual("short_min");
      expect(treeMap.get(0)).assertEqual("short_zero");
      expect(treeMap.get(32767)).assertEqual("short_max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6800
     * @tc.name      testTreeMap06Chapter0068
     * @tc.desc      Set with number key as int range boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0068';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483648, "int_min");
      treeMap.set(0, "int_zero");
      treeMap.set(2147483647, "int_max");
      expect(treeMap.get(-2147483648)).assertEqual("int_min");
      expect(treeMap.get(0)).assertEqual("int_zero");
      expect(treeMap.get(2147483647)).assertEqual("int_max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_6900
     * @tc.name      testTreeMap06Chapter0069
     * @tc.desc      Set with number key as long range boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0069';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-9223372036854775808, "long_min");
      treeMap.set(0, "long_zero");
      treeMap.set(9223372036854775807, "long_max");
      expect(treeMap.get(-9223372036854775808)).assertEqual("long_min");
      expect(treeMap.get(0)).assertEqual("long_zero");
      expect(treeMap.get(9223372036854775807)).assertEqual("long_max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7000
     * @tc.name      testTreeMap06Chapter0070
     * @tc.desc      Set with number key as scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0070';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, "one_thousand");
      treeMap.set(2.5e-2, "point_zero_two_five");
      treeMap.set(1.5e6, "one_point_five_million");
      expect(treeMap.get(1000)).assertEqual("one_thousand");
      expect(treeMap.get(0.025)).assertEqual("point_zero_two_five");
      expect(treeMap.get(1500000)).assertEqual("one_point_five_million");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7100
     * @tc.name      testTreeMap06Chapter0071
     * @tc.desc      Set with number key as different bases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0071';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0x0102, "hex_0x0102");
      treeMap.set(0x01020304, "hex_0x01020304");
      treeMap.set(0o3, "octal_3");
      expect(treeMap.get(258)).assertEqual("hex_0x0102");
      expect(treeMap.get(16909060)).assertEqual("hex_0x01020304");
      expect(treeMap.get(3)).assertEqual("octal_3");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7200
     * @tc.name      testTreeMap06Chapter0072
     * @tc.desc      Set with boolean-like falsy values as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0072';
      console.log(TAG + ' start');

      interface FalsyValues {
        zero: number;
        nan: number;
        emptyString: string;
        nullValue: null;
        undefinedValue: undefined;
      }

      let treeMap = new TreeMap<string, FalsyValues>();
      let obj: FalsyValues = {
        zero: 0,
        nan: NaN,
        emptyString: "",
        nullValue: null,
        undefinedValue: undefined
      };
      treeMap.set("falsy", obj);
      let result = treeMap.get("falsy");
      expect(result.zero).assertEqual(0);
      expect(isNaN(result.nan)).assertTrue();
      expect(result.emptyString).assertEqual("");
      expect(result.nullValue).assertNull();
      expect(result.undefinedValue).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7300
     * @tc.name      testTreeMap06Chapter0073
     * @tc.desc      Set with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0073';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8Array>();
      let array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      treeMap.set("multipleZeros", array);
      let result = treeMap.get("multipleZeros");
      expect(result.length).assertEqual(19);
      expect(result[9]).assertEqual(0);
      expect(result[10]).assertEqual(0);
      expect(result[11]).assertEqual(0);
      expect(result[12]).assertEqual(0);
      expect(result[13]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7400
     * @tc.name      testTreeMap06Chapter0074
     * @tc.desc      Set with array containing negative numbers converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0074';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8Array>();
      let sourceArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      let uint8Array = new Uint8Array(sourceArray.length);
      for (let i = 0; i < sourceArray.length; i++) {
        uint8Array[i] = sourceArray[i] & 0xFF;
      }
      treeMap.set("negativeConversion", uint8Array);
      let result = treeMap.get("negativeConversion");
      expect(result.length).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7500
     * @tc.name      testTreeMap06Chapter0075
     * @tc.desc      Set with object containing string key with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0075';
      console.log(TAG + ' start');

      interface ObjectWithSpecialKeys {
        a: number;
        special_key: string;
        anotherx2dkey: string;
      }

      let treeMap = new TreeMap<string, ObjectWithSpecialKeys>();
      let obj: ObjectWithSpecialKeys = {
        a: 1,
        special_key: "value1",
        anotherx2dkey: "value2"
      };

      treeMap.set("withSpecialKeys", obj);
      let result = treeMap.get("withSpecialKeys");
      expect(result.a).assertEqual(1);
      expect(result.special_key).assertEqual("value1");
      expect(result.anotherx2dkey).assertEqual("value2");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7600
     * @tc.name      testTreeMap06Chapter0076
     * @tc.desc      Set with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0076';
      console.log(TAG + ' start');

      interface ObjectWithFunction {
        a: number;
        b: () => void;
      }

      let treeMap = new TreeMap<string, ObjectWithFunction>();
      let obj: ObjectWithFunction = {
        a: 1,
        b: () => {
          console.log("function called");
        }
      };
      treeMap.set("withFunction", obj);
      let result = treeMap.get("withFunction");
      expect(result.a).assertEqual(1);
      expect(typeof result.b).assertEqual("function");
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST06_7700
     * @tc.name      testTreeMap06Chapter0077
     * @tc.desc      Set with object from prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0077';
      console.log(TAG + ' start');

      class ProtoObject {
        ownProp: number;

        constructor(ownValue: number) {
          this.ownProp = ownValue;
        }
      }

      class ExtendedProtoObject extends ProtoObject {
        parentProp?: number;

        constructor(ownValue: number, parentValue?: number) {
          super(ownValue);
          if (parentValue !== undefined) {
            this.parentProp = parentValue;
          }
        }
      }

      let treeMap = new TreeMap<string, ExtendedProtoObject>();
      let childObj: ExtendedProtoObject = new ExtendedProtoObject(2, 1);

      treeMap.set("prototype", childObj);
      let result = treeMap.get("prototype");
      expect(result.ownProp).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7800
     * @tc.name      testTreeMap06Chapter0078
     * @tc.desc      Set with object with private field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0078';
      console.log(TAG + ' start');

      class ObjectWithPrivateField {
        private privateField: number;
        public publicField: number;

        constructor(publicValue: number, privateValue: number) {
          this.publicField = publicValue;
          this.privateField = privateValue;
        }

        getPrivateValue(): number {
          return this.privateField;
        }
      }

      let treeMap = new TreeMap<string, ObjectWithPrivateField>();
      let obj: ObjectWithPrivateField = new ObjectWithPrivateField(1, 2);

      treeMap.set("withPrivateField", obj);
      let result = treeMap.get("withPrivateField");
      expect(result.publicField).assertEqual(1);
      expect(result.getPrivateValue()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_7900
     * @tc.name      testTreeMap06Chapter0079
     * @tc.desc      Set with object containing ArrayBuffer property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0079';
      console.log(TAG + ' start');

      interface ObjectWithBuffer {
        buffer: ArrayBuffer;
        name: string;
      }

      let treeMap = new TreeMap<string, ObjectWithBuffer>();
      let obj: ObjectWithBuffer = {
        buffer: new ArrayBuffer(16),
        name: "arrayBuffer"
      };

      treeMap.set("withBuffer", obj);
      let result = treeMap.get("withBuffer");
      expect(result.name).assertEqual("arrayBuffer");
      expect(result.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_8000
     * @tc.name      testTreeMap06Chapter0080
     * @tc.desc      Set with object containing DataView property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0080';
      console.log(TAG + ' start');

      interface ObjectWithDataView {
        view: DataView;
        id: number;
      }

      let treeMap = new TreeMap<string, ObjectWithDataView>();
      let buffer = new ArrayBuffer(16);
      let obj: ObjectWithDataView = {
        view: new DataView(buffer),
        id: 8000
      };

      treeMap.set("withDataView", obj);
      let result = treeMap.get("withDataView");
      expect(result.id).assertEqual(8000);
      expect(result.view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST06_8100
     * @tc.name      testTreeMap06Chapter0081
     * @tc.desc      Set with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap06Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap06Chapter0081';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, object>();
      treeMap.set("empty", {});
      let result = treeMap.get("empty");
      expect(result !== undefined).assertTrue();
      expect(Object.keys(result).length).assertEqual(0);
    });

  })
}
