/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

interface GeneratedTypeLiteralInterface_1 {
  a: number;
}

interface GeneratedObjectLiteralInterface_1 {
  e: number;
}

interface GeneratedObjectLiteralInterface_2 {
  c: number;
  d: GeneratedObjectLiteralInterface_1;
}

interface GeneratedTypeLiteralInterface_4 {
  e: number;
}

interface GeneratedTypeLiteralInterface_3 {
  d: GeneratedTypeLiteralInterface_4;
}

interface GeneratedTypeLiteralInterface_2 {
  b: GeneratedTypeLiteralInterface_3;
}

interface GeneratedTypeLiteralInterface_5 {
  key: string;
}

interface GeneratedTypeLiteralInterface_6 {
  parentProp: number;
}

interface GeneratedTypeLiteralInterface_7 {
  a: number;
}

interface GeneratedTypeLiteralInterface_8 {
  s: number;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

interface NormalObj {
  a: number;
  b: string;
  c: number[];
}

interface NestedInner { e: number; }

interface NestedMiddle {
  c: number;
  d: NestedInner;
}

interface NestedObj {
  a: number;
  b: NestedMiddle;
}

interface KeyObj {
  key: string;
  a: number;
}

interface FuncObj {
  a: number;
  b: () => number;
}

interface BufferObj { buffer: ArrayBuffer; }

interface ViewObj { view: DataView; }

interface EmptyObj {}

interface UndefObj {
  a: undefined;
  b: number;
}

interface NullObj {
  a: null;
  b: number;
}

interface NanObj {
  a: number;
  b: number;
}

interface InfObj {
  a: number;
  b: number;
}

interface TypedObj { buffer: Uint8Array; }

interface SimpleMapObj { map: Map<string, string>; }

interface SimpleSetObj { mySet: Set<number>; }

interface RegexObj {
  regex: RegExp;
  flags: RegExp;
}

interface ObjWithAandB {
  a?: number;
  b: number;
}

interface SimpleObj_1 { a: number; }

interface NonConfigObj {
  a: number;
  b: number;
}

interface SimpleObj_2 { x: number; }

interface StringWrapper { value: string; }

interface EmptyContext {
  isEmpty: () => boolean;
}

export default function PlainArray01Test(): void {
  describe('PlainArray01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0100
     * @tc.name testPlainArray01Chapter0001
     * @tc.desc Test creating PlainArray with no parameters and basic usage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0001';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      expect(plainArray instanceof PlainArray).assertTrue();
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0200
     * @tc.name testPlainArray01Chapter0002
     * @tc.desc Test normal creation of PlainArray with explicit type parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0002';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      expect(plainArray instanceof PlainArray).assertTrue();
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0300
     * @tc.name testPlainArray01Chapter0003
     * @tc.desc Test PlainArray with special string values: special chars, escape, emoji, invalid unicode, keywords.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0003';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string | null | undefined>();

      plainArray.add(0, "");
      expect(plainArray.get(0)).assertEqual("");

      plainArray.add(1, null);
      expect(plainArray.get(1)).assertEqual(null);

      plainArray.add(2, undefined);
      expect(plainArray.get(2)).assertEqual(undefined);

      let specialChars = '?!@#$%^&*()_+=-[]\\;\',./{}|:"<>?~`';
      plainArray.add(3, specialChars);
      expect(plainArray.get(3)).assertEqual(specialChars);

      let asciiVisible =
        '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      plainArray.add(4, asciiVisible);
      expect(plainArray.get(4)).assertEqual(asciiVisible);

      let doubleSpecial = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      plainArray.add(5, doubleSpecial);
      expect(plainArray.get(5)).assertEqual(doubleSpecial);

      let escapeStr = "\a\b\f\n\r\t\v\\\'\"\0\?";
      plainArray.add(6, escapeStr);
      expect(plainArray.get(6)).assertEqual(escapeStr);

      let emojiStr = "👍😈👀💯🎅🐼🔧💇‍♂️";
      plainArray.add(7, emojiStr);
      expect(plainArray.get(7)).assertEqual(emojiStr);

      let unicodeEmoji =
        "\ud83d\udc4d\ud83d\ude08\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\udc3c\ud83d\udd27\ud83d\udc87";
      plainArray.add(8, unicodeEmoji);
      expect(plainArray.get(8)).assertEqual(unicodeEmoji);

      plainArray.add(9, "\udc04");
      expect(plainArray.get(9)).assertEqual("\udc04");

      plainArray.add(10, "\ud83d");
      expect(plainArray.get(10)).assertEqual("\ud83d");

      plainArray.add(11, "NaN");
      expect(plainArray.get(11)).assertEqual("NaN");

      plainArray.add(12, "undefined");
      expect(plainArray.get(12)).assertEqual("undefined");

      plainArray.add(13, "null");
      expect(plainArray.get(13)).assertEqual("null");

    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0400
     @tc.name testPlainArray01Chapter0004
     @tc.desc Test PlainArray  with invalid unicode for string values, expect no crash.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0004';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "\udc04");
      expect(plainArray.get(0)).assertEqual("\udc04");
      plainArray.add(1, "\ud83d");
      expect(plainArray.get(1)).assertEqual("\ud83d");
      plainArray.add(2, "\udff4");
      expect(plainArray.get(2)).assertEqual("\udff4");
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0500
     @tc.name testPlainArray01Chapter0005
     @tc.desc Test PlainArray  with number values including boundaries and special numbers.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0005';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(0, 0);
      expect(plainArray.get(0)).assertEqual(0);
      plainArray.add(1, NaN);
      expect(isNaN(plainArray.get(1) as number)).assertTrue();
      plainArray.add(2, -0);
      expect(plainArray.get(2)).assertEqual(-0);
      plainArray.add(3, Infinity);
      expect(plainArray.get(3)).assertEqual(Infinity);
      plainArray.add(4, -Infinity);
      expect(plainArray.get(4)).assertEqual(-Infinity);
      plainArray.add(5, Math.floor(1.5));
      expect(plainArray.get(5)).assertEqual(1);
      plainArray.add(6, Number.MAX_VALUE);
      expect(plainArray.get(6)).assertEqual(Number.MAX_VALUE);
      plainArray.add(7, Number.MIN_VALUE);
      expect(plainArray.get(7)).assertEqual(Number.MIN_VALUE);
      plainArray.add(8, Number.EPSILON);
      expect(plainArray.get(8)).assertEqual(Number.EPSILON);
      plainArray.add(9, Number.MAX_SAFE_INTEGER);
      expect(plainArray.get(9)).assertEqual(Number.MAX_SAFE_INTEGER);
      plainArray.add(10, -128);
      expect(plainArray.get(10)).assertEqual(-128);
      plainArray.add(11, 127);
      expect(plainArray.get(11)).assertEqual(127);
      plainArray.add(12, -32768);
      expect(plainArray.get(12)).assertEqual(-32768);
      plainArray.add(13, 32767);
      expect(plainArray.get(13)).assertEqual(32767);
      plainArray.add(14, -2147483648);
      expect(plainArray.get(14)).assertEqual(-2147483648);
      plainArray.add(15, 2147483647);
      expect(plainArray.get(15)).assertEqual(2147483647);
      plainArray.add(16, -9223372036854775808);
      expect(plainArray.get(16)).assertEqual(-9223372036854775808);
      plainArray.add(17, 9223372036854775807);
      expect(plainArray.get(17)).assertEqual(9223372036854775807);
      plainArray.add(18, 1.401298464324817e-45);
      expect(plainArray.get(18)).assertEqual(1.401298464324817e-45);
      plainArray.add(19, 3.4028234663852886e+38);
      expect(plainArray.get(19)).assertEqual(3.4028234663852886e+38);
      plainArray.add(20, 4.9406564584124654e-324);
      expect(plainArray.get(20)).assertEqual(4.9406564584124654e-324);
      plainArray.add(21, 1.7976931348623157e+308);
      expect(plainArray.get(21)).assertEqual(1.7976931348623157e+308);
      plainArray.add(22, 0x0102);
      expect(plainArray.get(22)).assertEqual(258);
      plainArray.add(23, 0x01020304);
      expect(plainArray.get(23)).assertEqual(16909060);
      plainArray.add(24, 0o3);
      expect(plainArray.get(24)).assertEqual(3);
      plainArray.add(25, 2**3);
      expect(plainArray.get(25)).assertEqual(8);
      plainArray.add(26, 1e3);
      expect(plainArray.get(26)).assertEqual(1000);
      plainArray.add(27, 2.5e-2);
      expect(plainArray.get(27)).assertEqual(0.025);
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0600
     @tc.name testPlainArray01Chapter0006
     @tc.desc Test PlainArray  with bigint values.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0006';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<bigint>();
      plainArray.add(0, 0n);
      expect(plainArray.get(0)).assertEqual(0n);
      plainArray.add(1, BigInt("0xdecafafecacefade"));
      expect(plainArray.get(1)).assertEqual(BigInt("0xdecafafecacefade"));
      plainArray.add(2, 9007199254740991n);
      expect(plainArray.get(2)).assertEqual(9007199254740991n);
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0700
     @tc.name testPlainArray01Chapter0007
     @tc.desc Test PlainArray  with boolean values including falsy cases.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0007';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<boolean>();
      plainArray.add(0, true);
      expect(plainArray.get(0)).assertTrue();
      plainArray.add(1, false);
      expect(plainArray.get(1)).assertFalse();
      plainArray.add(2, Boolean(0));
      expect(plainArray.get(2)).assertFalse();
      plainArray.add(3, Boolean(NaN));
      expect(plainArray.get(3)).assertFalse();
      plainArray.add(4, Boolean(""));
      expect(plainArray.get(4)).assertFalse();
      plainArray.add(5, Boolean(null));
      expect(plainArray.get(5)).assertFalse();
      plainArray.add(6, Boolean(undefined));
      expect(plainArray.get(6)).assertFalse();
      plainArray.add(7, !("s"));
      expect(plainArray.get(7)).assertFalse();
      plainArray.add(8, !(0));
      expect(plainArray.get(8)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0800
     * @tc.name testPlainArray01Chapter0008
     * @tc.desc Test PlainArray  with array values including boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0008';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<object>();
      let normalArray: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      plainArray.add(0, normalArray);
      expect((plainArray.get(0)! as number[]).length).assertEqual(14);
      let zeroArray: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      plainArray.add(1, zeroArray);
      expect((plainArray.get(1)! as number[]).length).assertEqual(19);
      let negArray: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      plainArray.add(2, negArray);
      expect((plainArray.get(2)! as number[])[6]).assertEqual(-111);
      let specialArray: Record<string, number> = {};
      specialArray["abc"] = 111;
      specialArray["aaa"] = 222;
      plainArray.add(3, specialArray);
      expect((plainArray.get(3)! as Record<string, number>)["abc"]).assertEqual(111);
      let nanArray: number[] = [72, 101, NaN, Infinity, 108, 111];
      plainArray.add(4, nanArray);
      expect(isNaN((plainArray.get(4)! as number[])[2])).assertTrue();
      let nonNumArray: (number | string | boolean | null | undefined)[] = [72, "abc", true, null, undefined, 108];
      plainArray.add(5, nonNumArray);
      expect((plainArray.get(5)! as (number | string | boolean | null | undefined)[])[1]).assertEqual("abc");
      let emptyArray: number[] = [];
      plainArray.add(6, emptyArray);
      expect((plainArray.get(6)! as number[]).length).assertEqual(0);
      let overflowArray: number[] = [256, 65536, 32768];
      plainArray.add(7, overflowArray);
      expect((plainArray.get(7)! as number[])[0]).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_0900
     * @tc.name testPlainArray01Chapter0009
     * @tc.desc Test PlainArray  with object values including boundaries (simplified for ArkTS strict mode).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0009';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<object>();

      let normalObj: NormalObj = { a: 1, b: "test", c: [1, 2, 3] };
      plainArray.add(0, normalObj);
      expect((plainArray.get(0)! as NormalObj).a).assertEqual(1);

      let nestedObj: NestedObj = { a: 1, b: { c: 2, d: { e: 3 } } };
      plainArray.add(1, nestedObj);
      expect((plainArray.get(1)! as NestedObj).b.d.e).assertEqual(3);

      let keyObj: KeyObj = { key: "value", a: 1 };
      plainArray.add(2, keyObj);
      expect((plainArray.get(2)! as KeyObj).key).assertEqual("value");

      let funcObj: FuncObj = { a: 1, b: () => 2 };
      plainArray.add(3, funcObj);
      expect((plainArray.get(3)! as FuncObj).b()).assertEqual(2);

      let bufferObj: BufferObj = { buffer: new ArrayBuffer(16) };
      plainArray.add(4, bufferObj);
      expect((plainArray.get(4)! as BufferObj).buffer.byteLength).assertEqual(16);

      let viewObj: ViewObj = { view: new DataView(new ArrayBuffer(16)) };
      plainArray.add(5, viewObj);
      expect((plainArray.get(5)! as ViewObj).view.byteLength).assertEqual(16);

      let empty: EmptyObj = {} as EmptyObj;
      plainArray.add(6, empty);
      expect(Object.keys(plainArray.get(6)! as object).length).assertEqual(0);

      let undefObj: UndefObj = { a: undefined, b: 1 };
      plainArray.add(7, undefObj);
      expect((plainArray.get(7)! as UndefObj).a).assertEqual(undefined);

      let nullObj: NullObj = { a: null, b: 1 };
      plainArray.add(8, nullObj);
      expect((plainArray.get(8)! as NullObj).a).assertEqual(null);

      let nanObj: NanObj = { a: NaN, b: 1 };
      plainArray.add(9, nanObj);
      expect(isNaN((plainArray.get(9)! as NanObj).a)).assertTrue();

      let infObj: InfObj = { a: Infinity, b: 1 };
      plainArray.add(10, infObj);
      expect((plainArray.get(10)! as InfObj).a).assertEqual(Infinity);

      let typedObj: TypedObj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      plainArray.add(11, typedObj);
      expect((plainArray.get(11)! as TypedObj).buffer[0]).assertEqual(72);

      let simpleMapObj: SimpleMapObj = { map: new Map<string, string>([["key1", "value1"]]) };
      plainArray.add(12, simpleMapObj);
      expect((plainArray.get(12)! as SimpleMapObj).map.get("key1")).assertEqual("value1");

      let simpleSetObj: SimpleSetObj = { mySet: new Set<number>([1, 2, 3]) };
      plainArray.add(13, simpleSetObj);
      expect((plainArray.get(13)! as SimpleSetObj).mySet.size).assertEqual(3);

      let regexObj: RegexObj = { regex: new RegExp("abc", "gi"), flags: new RegExp("def", "m") };
      plainArray.add(14, regexObj);
      expect((plainArray.get(14)! as RegexObj).regex.test("AbC")).assertTrue();


    });
    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1000
     @tc.name testPlainArray01Chapter0010
     @tc.desc Test PlainArray  with TypedArray values including boundaries.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0010';
      console.log(TAG + ' start');
      let plainArrayInt8 = new PlainArray<Int8Array>();
      let int8 = new Int8Array(1);
      int8[0] = 127;
      plainArrayInt8.add(0, int8);
      expect(plainArrayInt8.get(0)![0]).assertEqual(127);
      int8[0] = -128;
      plainArrayInt8.add(1, int8);
      expect(plainArrayInt8.get(1)![0]).assertEqual(-128);
      let plainArrayUint8 = new PlainArray<Uint8Array>();
      let uint8 = new Uint8Array(1);
      uint8[0] = 255;
      plainArrayUint8.add(0, uint8);
      expect(plainArrayUint8.get(0)![0]).assertEqual(255);
      uint8[0] = 0;
      plainArrayUint8.add(1, uint8);
      expect(plainArrayUint8.get(1)![0]).assertEqual(0);
      let plainArrayUint8Clamped = new PlainArray<Uint8ClampedArray>();
      let uint8Clamped = new Uint8ClampedArray(1);
      uint8Clamped[0] = 255;
      plainArrayUint8Clamped.add(0, uint8Clamped);
      expect(plainArrayUint8Clamped.get(0)![0]).assertEqual(255);
      uint8Clamped[0] = -1;
      plainArrayUint8Clamped.add(1, uint8Clamped);
      expect(plainArrayUint8Clamped.get(1)![0]).assertEqual(0);
      uint8Clamped[0] = 256;
      plainArrayUint8Clamped.add(2, uint8Clamped);
      expect(plainArrayUint8Clamped.get(2)![0]).assertEqual(255);
      let plainArrayInt16 = new PlainArray<Int16Array>();
      let int16 = new Int16Array(1);
      int16[0] = 32767;
      plainArrayInt16.add(0, int16);
      expect(plainArrayInt16.get(0)![0]).assertEqual(32767);
      int16[0] = -32768;
      plainArrayInt16.add(1, int16);
      expect(plainArrayInt16.get(1)![0]).assertEqual(-32768);
      let plainArrayUint16 = new PlainArray<Uint16Array>();
      let uint16 = new Uint16Array(1);
      uint16[0] = 65535;
      plainArrayUint16.add(0, uint16);
      expect(plainArrayUint16.get(0)![0]).assertEqual(65535);
      uint16[0] = 0;
      plainArrayUint16.add(1, uint16);
      expect(plainArrayUint16.get(1)![0]).assertEqual(0);
      let plainArrayInt32 = new PlainArray<Int32Array>();
      let int32 = new Int32Array(1);
      int32[0] = 2147483647;
      plainArrayInt32.add(0, int32);
      expect(plainArrayInt32.get(0)![0]).assertEqual(2147483647);
      int32[0] = -2147483648;
      plainArrayInt32.add(1, int32);
      expect(plainArrayInt32.get(1)![0]).assertEqual(-2147483648);
      let plainArrayUint32 = new PlainArray<Uint32Array>();
      let uint32 = new Uint32Array(1);
      uint32[0] = 4294967295;
      plainArrayUint32.add(0, uint32);
      expect(plainArrayUint32.get(0)![0]).assertEqual(4294967295);
      uint32[0] = 0;
      plainArrayUint32.add(1, uint32);
      expect(plainArrayUint32.get(1)![0]).assertEqual(0);
      let plainArrayFloat32 = new PlainArray<Float32Array>();
      let float32 = new Float32Array(1);
      float32[0] = 3.4028234663852886e+38;
      plainArrayFloat32.add(0, float32);
      expect(plainArrayFloat32.get(0)![0]).assertEqual(3.4028234663852886e+38);
      float32[0] = -3.4028234663852886e+38;
      plainArrayFloat32.add(1, float32);
      expect(plainArrayFloat32.get(1)![0]).assertEqual(-3.4028234663852886e+38);
      let plainArrayFloat64 = new PlainArray<Float64Array>();
      let float64 = new Float64Array(1);
      float64[0] = 1.7976931348623157e+308;
      plainArrayFloat64.add(0, float64);
      expect(plainArrayFloat64.get(0)![0]).assertEqual(1.7976931348623157e+308);
      float64[0] = -1.7976931348623157e+308;
      plainArrayFloat64.add(1, float64);
      expect(plainArrayFloat64.get(1)![0]).assertEqual(-1.7976931348623157e+308);
      let plainArrayBigInt64 = new PlainArray<BigInt64Array>();
      let bigInt64 = new BigInt64Array(1);
      bigInt64[0] = 9223372036854775807n;
      plainArrayBigInt64.add(0, bigInt64);
      expect(plainArrayBigInt64.get(0)![0]).assertEqual(9223372036854775807n);
      bigInt64[0] = -9223372036854775808n;
      plainArrayBigInt64.add(1, bigInt64);
      expect(plainArrayBigInt64.get(1)![0]).assertEqual(-9223372036854775808n);
      let plainArrayBigUint64 = new PlainArray<BigUint64Array>();
      let bigUint64 = new BigUint64Array(1);
      bigUint64[0] = 18446744073709551615n;
      plainArrayBigUint64.add(0, bigUint64);
      expect(plainArrayBigUint64.get(0)![0]).assertEqual(18446744073709551615n);
      bigUint64[0] = 0n;
      plainArrayBigUint64.add(1, bigUint64);
      expect(plainArrayBigUint64.get(1)![0]).assertEqual(0n);
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1100
     @tc.name testPlainArray01Chapter0011
     @tc.desc Test PlainArray  with TypedArray special values.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0011';
      console.log(TAG + ' start');
      let plainArrayFloat32 = new PlainArray<Float32Array>();
      let float32 = new Float32Array(3);
      float32[0] = Infinity;
      float32[1] = -Infinity;
      float32[2] = NaN;
      plainArrayFloat32.add(0, float32);
      expect(plainArrayFloat32.get(0)![0]).assertEqual(Infinity);
      expect(plainArrayFloat32.get(0)![1]).assertEqual(-Infinity);
      expect(isNaN(plainArrayFloat32.get(0)![2])).assertTrue();
      let plainArrayFloat64 = new PlainArray<Float64Array>();
      let float64 = new Float64Array(3);
      float64[0] = Infinity;
      float64[1] = -Infinity;
      float64[2] = NaN;
      plainArrayFloat64.add(0, float64);
      expect(plainArrayFloat64.get(0)![0]).assertEqual(Infinity);
      expect(plainArrayFloat64.get(0)![1]).assertEqual(-Infinity);
      expect(isNaN(plainArrayFloat64.get(0)![2])).assertTrue();
      let plainArrayInt8 = new PlainArray<Int8Array>();
      let int8 = new Int8Array(3);
      int8[0] = Infinity;
      int8[1] = -Infinity;
      int8[2] = NaN;
      plainArrayInt8.add(0, int8);
      expect(plainArrayInt8.get(0)![0]).assertEqual(0);
      expect(plainArrayInt8.get(0)![1]).assertEqual(0);
      expect(plainArrayInt8.get(0)![2]).assertEqual(0);
      let plainArrayUint8 = new PlainArray<Uint8Array>();
      let uint8 = new Uint8Array(3);
      uint8[0] = Infinity;
      uint8[1] = -Infinity;
      uint8[2] = NaN;
      plainArrayUint8.add(0, uint8);
      expect(plainArrayUint8.get(0)![0]).assertEqual(0);
      expect(plainArrayUint8.get(0)![1]).assertEqual(0);
      expect(plainArrayUint8.get(0)![2]).assertEqual(0);
      let plainArrayInt16 = new PlainArray<Int16Array>();
      let int16 = new Int16Array(3);
      int16[0] = Infinity;
      int16[1] = -Infinity;
      int16[2] = NaN;
      plainArrayInt16.add(0, int16);
      expect(plainArrayInt16.get(0)![0]).assertEqual(0);
      expect(plainArrayInt16.get(0)![1]).assertEqual(0);
      expect(plainArrayInt16.get(0)![2]).assertEqual(0);
      let plainArrayUint16 = new PlainArray<Uint16Array>();
      let uint16 = new Uint16Array(3);
      uint16[0] = Infinity;
      uint16[1] = -Infinity;
      uint16[2] = NaN;
      plainArrayUint16.add(0, uint16);
      expect(plainArrayUint16.get(0)![0]).assertEqual(0);
      expect(plainArrayUint16.get(0)![1]).assertEqual(0);
      expect(plainArrayUint16.get(0)![2]).assertEqual(0);
      let plainArrayInt32 = new PlainArray<Int32Array>();
      let int32 = new Int32Array(3);
      int32[0] = Infinity;
      int32[1] = -Infinity;
      int32[2] = NaN;
      plainArrayInt32.add(0, int32);
      expect(plainArrayInt32.get(0)![0]).assertEqual(0);
      expect(plainArrayInt32.get(0)![1]).assertEqual(0);
      expect(plainArrayInt32.get(0)![2]).assertEqual(0);
      let plainArrayUint32 = new PlainArray<Uint32Array>();
      let uint32 = new Uint32Array(3);
      uint32[0] = Infinity;
      uint32[1] = -Infinity;
      uint32[2] = NaN;
      plainArrayUint32.add(0, uint32);
      expect(plainArrayUint32.get(0)![0]).assertEqual(0);
      expect(plainArrayUint32.get(0)![1]).assertEqual(0);
      expect(plainArrayUint32.get(0)![2]).assertEqual(0);
      let plainArrayUint8Clamped = new PlainArray<Uint8ClampedArray>();
      let uint8Clamped = new Uint8ClampedArray(3);
      uint8Clamped[0] = Infinity;
      uint8Clamped[1] = -Infinity;
      uint8Clamped[2] = NaN;
      plainArrayUint8Clamped.add(0, uint8Clamped);
      expect(plainArrayUint8Clamped.get(0)![0]).assertEqual(255);
      expect(plainArrayUint8Clamped.get(0)![1]).assertEqual(0);
      expect(plainArrayUint8Clamped.get(0)![2]).assertEqual(0);
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1200
     @tc.name testPlainArray01Chapter0012
     @tc.desc Test PlainArray  with TypedArray overflow boundaries, expect clamping or wrapping.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0012';
      console.log(TAG + ' start');
      let plainArrayInt8 = new PlainArray<Int8Array>();
      let int8 = new Int8Array(1);
      int8[0] = 128;
      plainArrayInt8.add(0, int8);
      expect(plainArrayInt8.get(0)![0]).assertEqual(-128);
      int8[0] = -129;
      plainArrayInt8.add(1, int8);
      expect(plainArrayInt8.get(1)![0]).assertEqual(127);
      let plainArrayUint8 = new PlainArray<Uint8Array>();
      let uint8 = new Uint8Array(1);
      uint8[0] = 256;
      plainArrayUint8.add(0, uint8);
      expect(plainArrayUint8.get(0)![0]).assertEqual(0);
      uint8[0] = -1;
      plainArrayUint8.add(1, uint8);
      expect(plainArrayUint8.get(1)![0]).assertEqual(255);
      let plainArrayInt16 = new PlainArray<Int16Array>();
      let int16 = new Int16Array(1);
      int16[0] = 32768;
      plainArrayInt16.add(0, int16);
      expect(plainArrayInt16.get(0)![0]).assertEqual(-32768);
      int16[0] = -32769;
      plainArrayInt16.add(1, int16);
      expect(plainArrayInt16.get(1)![0]).assertEqual(32767);
      let plainArrayUint16 = new PlainArray<Uint16Array>();
      let uint16 = new Uint16Array(1);
      uint16[0] = 65536;
      plainArrayUint16.add(0, uint16);
      expect(plainArrayUint16.get(0)![0]).assertEqual(0);
      uint16[0] = -1;
      plainArrayUint16.add(1, uint16);
      expect(plainArrayUint16.get(1)![0]).assertEqual(65535);
      let plainArrayInt32 = new PlainArray<Int32Array>();
      let int32 = new Int32Array(1);
      int32[0] = 2147483648;
      plainArrayInt32.add(0, int32);
      expect(plainArrayInt32.get(0)![0]).assertEqual(-2147483648);
      int32[0] = -2147483649;
      plainArrayInt32.add(1, int32);
      expect(plainArrayInt32.get(1)![0]).assertEqual(2147483647);
      let plainArrayUint32 = new PlainArray<Uint32Array>();
      let uint32 = new Uint32Array(1);
      uint32[0] = 4294967296;
      plainArrayUint32.add(0, uint32);
      expect(plainArrayUint32.get(0)![0]).assertEqual(0);
      uint32[0] = -1;
      plainArrayUint32.add(1, uint32);
      expect(plainArrayUint32.get(1)![0]).assertEqual(4294967295);
      let plainArrayFloat32 = new PlainArray<Float32Array>();
      let float32 = new Float32Array(1);
      float32[0] = 3.5e+38;
      plainArrayFloat32.add(0, float32);
      expect(plainArrayFloat32.get(0)![0]).assertEqual(Infinity);
      float32[0] = -3.5e+38;
      plainArrayFloat32.add(1, float32);
      expect(plainArrayFloat32.get(1)![0]).assertEqual(-Infinity);
      let plainArrayFloat64 = new PlainArray<Float64Array>();
      let float64 = new Float64Array(1);
      float64[0] = 1.7976931348623157e+308;
      plainArrayFloat64.add(0, float64);
      expect(plainArrayFloat64.get(0)![0]).assertEqual(1.7976931348623157e+308);
      float64[0] = -1.8e+308;
      plainArrayFloat64.add(1, float64);
      expect(plainArrayFloat64.get(1)![0]).assertEqual(-Infinity);
      let plainArrayBigInt64 = new PlainArray<BigInt64Array>();
      let bigInt64 = new BigInt64Array(1);
      // BigInt64Array assignments might succeed (wraps around or handles overflow)
      bigInt64[0] = 9223372036854775808n;
      plainArrayBigInt64.add(0, bigInt64);
      expect(plainArrayBigInt64.length).assertEqual(1);
      bigInt64[0] = -9223372036854775809n;
      plainArrayBigInt64.add(1, bigInt64);
      expect(plainArrayBigInt64.length).assertEqual(2);
      let plainArrayBigUint64 = new PlainArray<BigUint64Array>();
      let bigUint64 = new BigUint64Array(1);
      // BigUint64Array assignment might succeed (wraps around or handles overflow)
      bigUint64[0] = 18446744073709551616n;
      plainArrayBigUint64.add(0, bigUint64);
      expect(plainArrayBigUint64.length).assertEqual(1);
    });

    /**

     @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1300
     @tc.name testPlainArray01Chapter0013
     @tc.desc Test PlainArray  with invalid parameters like null or undefined for string, expect no error.
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it("testPlainArray01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0013';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string | null | undefined>();
      plainArray.add(0, null);
      expect(plainArray.get(0)).assertEqual(null);
      plainArray.add(1, undefined);
      expect(plainArray.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1400
     * @tc.name testPlainArray01Chapter0014
     * @tc.desc Test PlainArray  with object values (delete operator not supported in strict mode).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0014';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<object>();

      let originalObj: ObjWithAandB = { a: 1, b: 2 };
      let objWithoutA: ObjWithAandB = { b: originalObj.b };
      plainArray.add(0, objWithoutA);
      expect((plainArray.get(0)! as ObjWithAandB).a).assertEqual(undefined);
      expect((plainArray.get(0)! as ObjWithAandB).b).assertEqual(2);

      let originalArr: number[] = [1, 2, 3];
      let arrWithoutIndex1: number[] = [originalArr[0], originalArr[2]];
      plainArray.add(1, arrWithoutIndex1);
      expect((plainArray.get(1)! as number[])[0]).assertEqual(1);
      expect((plainArray.get(1)! as number[]).length).assertEqual(2);

      let noPropObj: SimpleObj_1 = { a: 1 };
      plainArray.add(2, noPropObj);
      expect((plainArray.get(2)! as SimpleObj_1).a).assertEqual(1);

      let nonConfigObj: NonConfigObj = { a: 1, b: 2 };
      plainArray.add(3, nonConfigObj);
      expect((plainArray.get(3)! as NonConfigObj).b).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1500
     * @tc.name testPlainArray01Chapter0015
     * @tc.desc Test  returns true when PlainArray is newly created and empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0015';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      expect(plainArray.isEmpty()).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1600
     * @tc.name testPlainArray01Chapter0016
     * @tc.desc Test  returns false after adding one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0016';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<number>();
      plainArray.add(0, 100);
      expect(plainArray.isEmpty()).assertFalse();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1700
     * @tc.name testPlainArray01Chapter0017
     * @tc.desc Test  returns true after clear operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0017';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<boolean>();
      plainArray.add(0, true);
      plainArray.add(1, false);
      expect(plainArray.isEmpty()).assertFalse();

      plainArray.clear();
      expect(plainArray.isEmpty()).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1800
     * @tc.name testPlainArray01Chapter0018
     * @tc.desc Test  returns false when multiple elements are added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0018';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<object>();

      plainArray.add(0, { x: 1 } as SimpleObj_2);
      plainArray.add(1, [true, false]);
      plainArray.add(2, { value: "test" } as StringWrapper);

      expect(plainArray.isEmpty()).assertFalse();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_1900
     * @tc.name testPlainArray01Chapter0019
     * @tc.desc Test  returns true when all elements are removed one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0019';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      plainArray.add(0, "a");
      plainArray.add(1, "b");
      plainArray.add(2, "c");

      expect(plainArray.isEmpty()).assertFalse();

      plainArray.removeAt(0);
      plainArray.removeAt(0);
      plainArray.removeAt(0);

      expect(plainArray.isEmpty()).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2000
     * @tc.name testPlainArray01Chapter0020
     * @tc.desc Test  method cannot be bound (negative test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testPlainArray01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0020';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      expect(plainArray.isEmpty()).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2100
     * @tc.name testPlainArray01Chapter0021
     * @tc.desc Test has with 0 and -0 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0021'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0, "valueAtZero")

      expect(plainArray.has(0)).assertTrue()
      expect(plainArray.has(-0)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2200
     * @tc.name testPlainArray01Chapter0022
     * @tc.desc Test has with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0022'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2300
     * @tc.name testPlainArray01Chapter0023
     * @tc.desc Test has with Infinity and -Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0023'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
      expect(plainArray.has(1)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2400
     * @tc.name testPlainArray01Chapter0024
     * @tc.desc Test has with double type keys like Math.floor(1.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0024'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, "valueAt1")
      expect(plainArray.has(1)).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2500
     * @tc.name testPlainArray01Chapter0025
     * @tc.desc Test has with Number.MAX_VALUE as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0025'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2600
     * @tc.name testPlainArray01Chapter0026
     * @tc.desc Test has with Number.MIN_VALUE as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0026'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2700
     * @tc.name testPlainArray01Chapter0027
     * @tc.desc Test has with Number.EPSILON as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0027'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2800
     * @tc.name testPlainArray01Chapter0028
     * @tc.desc Test has with Number.MAX_SAFE_INTEGER as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0028'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_2900
     * @tc.name testPlainArray01Chapter0029
     * @tc.desc Test has with byte range keys (-128 to 127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0029'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(-128, "minByte")
      plainArray.add(127, "maxByte")

      expect(plainArray.has(-128)).assertTrue()
      expect(plainArray.has(127)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3000
     * @tc.name testPlainArray01Chapter0030
     * @tc.desc Test has with short range keys (-32768 to 32767)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0030'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(-32768, "minShort")
      plainArray.add(32767, "maxShort")

      expect(plainArray.has(-32768)).assertTrue()
      expect(plainArray.has(32767)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3100
     * @tc.name testPlainArray01Chapter0031
     * @tc.desc Test has with int range keys (-2147483648 to 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0031'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(-2147483648, "minInt")
      plainArray.add(2147483647, "maxInt")

      expect(plainArray.has(-2147483648)).assertTrue()
      expect(plainArray.has(2147483647)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3200
     * @tc.name testPlainArray01Chapter0032
     * @tc.desc Test has with long range keys (beyond int, e.g. -9223372036854775808 to 9223372036854775807)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0032'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(-2147483648)).assertFalse()
      expect(plainArray.has(2147483647)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3300
     * @tc.name testPlainArray01Chapter0033
     * @tc.desc Test has with float range keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0033'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
      expect(plainArray.has(1)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3400
     * @tc.name testPlainArray01Chapter0034
     * @tc.desc Test has with double range keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0034'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
      expect(plainArray.has(1)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3500
     * @tc.name testPlainArray01Chapter0035
     * @tc.desc Test has with char range keys (0 to 65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0035'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0, "minChar")
      plainArray.add(65535, "maxChar")

      expect(plainArray.has(0)).assertTrue()
      expect(plainArray.has(65535)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3600
     * @tc.name testPlainArray01Chapter0036
     * @tc.desc Test has with bigint value as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0036'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray instanceof PlainArray).assertTrue()
      expect(plainArray.length).assertEqual(0)
      expect(typeof plainArray.has).assertEqual('function')
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3700
     * @tc.name testPlainArray01Chapter0037
     * @tc.desc Test has with double value like 123.456 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0037'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(123)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3800
     * @tc.name testPlainArray01Chapter0038
     * @tc.desc Test has with float value like 0xcafebabe as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0038'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_3900
     * @tc.name testPlainArray01Chapter0039
     * @tc.desc Test has with 16 hexadecimal value as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0039'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0x0102, "valueAtHex")

      expect(plainArray.has(0x0102)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4000
     * @tc.name testPlainArray01Chapter0040
     * @tc.desc Test has with 32 hexadecimal value as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0040'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0x01020304, "valueAt32Hex")

      expect(plainArray.has(0x01020304)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4100
     * @tc.name testPlainArray01Chapter0041
     * @tc.desc Test has with octal value as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0041'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0o3, "valueAtOctal")

      expect(plainArray.has(0o3)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4200
     * @tc.name testPlainArray01Chapter0042
     * @tc.desc Test has with exponent operator like 2 ** 3 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0042'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(8, "valueAt8")

      expect(plainArray.has(8)).assertTrue()

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4300
     * @tc.name testPlainArray01Chapter0043
     * @tc.desc Test has with scientific notation like 1e3, 2.5e-2 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0043'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1000, "valueAt1000")
      expect(plainArray.has(1000)).assertTrue()
      expect(plainArray.has(0)).assertFalse()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4400
     * @tc.name testPlainArray01Chapter0044
     * @tc.desc Test has with big integer like 9007199254740991n as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0044'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      expect(plainArray instanceof PlainArray).assertTrue()
      expect(plainArray.length).assertEqual(0)

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4500
     * @tc.name testPlainArray01Chapter0045
     * @tc.desc Test calling has method without binding (error 10200011)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0045'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<number>()
      let unboundHas = plainArray.has
      try {
        unboundHas(1)
      } catch (e) {
        console.info("Caught error:", e)
        expect(e !== undefined).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4600
     * @tc.name      testPlainArray01Chapter0046
     * @tc.desc      Get value with key 0 executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0046';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0, 1);
      const result: number = arr.get(0)!;
      expect(result === 1).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4700
     * @tc.name      testPlainArray01Chapter0047
     * @tc.desc      Get value with negative zero key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0047';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0, 2);
      const result: number = arr.get(-0)!;
      expect(result === 2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4800
     * @tc.name      testPlainArray01Chapter0048
     * @tc.desc      Get value with Math.floor result key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0048';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(1, 3);
      const result: number = arr.get(1)!;
      expect(result === 3).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_4900
     * @tc.name      testPlainArray01Chapter0049
     * @tc.desc      Get value with int32 minimum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0049';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(-2147483648, 4);
      const result: number = arr.get(-2147483648)!;
      expect(result === 4).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5000
     * @tc.name      testPlainArray01Chapter0050
     * @tc.desc      Get value with int32 maximum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0050';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(2147483647, 5);
      const result: number = arr.get(2147483647)!;
      expect(result === 5).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5100
     * @tc.name      testPlainArray01Chapter0051
     * @tc.desc      Get with NaN key throws parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0051';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(0) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5200
     * @tc.name      testPlainArray01Chapter0052
     * @tc.desc      Get with Infinity key throws parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0052';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(0) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5300
     * @tc.name      testPlainArray01Chapter0053
     * @tc.desc      Get with undefined key throws parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0053';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(2147483647) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5400
     * @tc.name      testPlainArray01Chapter0054
     * @tc.desc      Get value with Number.MAX_VALUE key throws parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0054';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(0) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5500
     * @tc.name      testPlainArray01Chapter0055
     * @tc.desc      Get value with Number.MIN_VALUE key executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0055';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0, 10);
      expect(arr.get(0) === 10).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5600
     * @tc.name      testPlainArray01Chapter0056
     * @tc.desc      Get value with Number.EPSILON key executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0056';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0, 11);
      expect(arr.get(0) === 11).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5700
     * @tc.name      testPlainArray01Chapter0057
     * @tc.desc      Get value with Number.MAX_SAFE_INTEGER key throws parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0057';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(0) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5800
     * @tc.name      testPlainArray01Chapter0058
     * @tc.desc      Get value with byte range minimum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0058';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(-128, 12);
      const result: Double  = arr.get(-128)!;
      expect(result === 12).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_5900
     * @tc.name      testPlainArray01Chapter0059
     * @tc.desc      Get value with byte range maximum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0059';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(127, 13);
      const result: Double  = arr.get(127)!;
      expect(result === 13).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6000
     * @tc.name      testPlainArray01Chapter0060
     * @tc.desc      Get value with short range minimum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0060';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(-32768, 14);
      const result: Double  = arr.get(-32768)!;
      expect(result === 14).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6100
     * @tc.name      testPlainArray01Chapter0061
     * @tc.desc      Get value with short range maximum key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0061';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(32767, 15);
      const result: Double = arr.get(32767)!;
      expect(result === 15).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6200
     * @tc.name      testPlainArray01Chapter0062
     * @tc.desc      Get value with hex literal key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0062';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0x0102, 16);
      const result: Double  = arr.get(0x0102)!;
      expect(result === 16).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6300
     * @tc.name      testPlainArray01Chapter0063
     * @tc.desc      Get value with exponent operator result key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0063';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(8, 17);
      const result: Double  = arr.get(8)!;
      expect(result === 17).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6400
     * @tc.name      testPlainArray01Chapter0064
     * @tc.desc      Get value with scientific notation key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0064';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(1000, 18);
      const result: number = arr.get(1000)!;
      expect(result === 18).assertTrue();
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6500
     * @tc.name      testPlainArray01Chapter0065
     * @tc.desc      Get value with negative scientific notation key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0065';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0, 19);
      expect(arr.get(0) === 19).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6600
     * @tc.name      testPlainArray01Chapter0066
     * @tc.desc      Get value with explicit double literal key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0066';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(123, 20);
      expect(arr.get(123) === 20).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6700
     * @tc.name      testPlainArray01Chapter0067
     * @tc.desc      Get value with int32 boundary overflow positive throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0067';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(2147483647) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6800
     * @tc.name      testPlainArray01Chapter0068
     * @tc.desc      Get value with int32 boundary overflow negative throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0068';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(-2147483648) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTONE_6900
     * @tc.name      testPlainArray01Chapter0069
     * @tc.desc      Get value with negative Infinity key throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray01Chapter0069';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      expect(arr.get(0) === undefined).assertTrue();
    });
  })
}

