/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsTestClass001
     * @tc.number CollectionsTestClass001
     * @tc.desc   ArkTS Collections Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let arkTsEmpty: collections.Array<number> = new collections.Array<number>();
      expect(arkTsEmpty.length).assertEqual(0);

      let arkTest: collections.Array<number> = new collections.Array<number>(1, 3, 5);
      expect(arkTest.length).assertEqual(3);
      expect(arkTest.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass002
     * @tc.number CollectionsTestClass002
     * @tc.desc   ArkTS Collections Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Int8Array = new collections.Int8Array(5);
      expect(test.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(8);
      let byBuffer: collections.Int8Array = new collections.Int8Array(buffer);
      expect(byBuffer.length).assertEqual(8);
      let byBufferView: collections.Int8Array = new collections.Int8Array(buffer, 2, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass003
     * @tc.number CollectionsTestClass003
     * @tc.desc   ArkTS Collections Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Int16Array = new collections.Int16Array(5);
      expect(test.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(6);
      let byBuffer: collections.Int16Array = new collections.Int16Array(buffer);
      expect(byBuffer.length).assertEqual(3);
      let byBufferView: collections.Int16Array = new collections.Int16Array(buffer, 2, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass004
     * @tc.number CollectionsTestClass004
     * @tc.desc   ArkTS Collections Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Int32Array = new collections.Int32Array(5);
      expect(test.length).assertEqual(5);
      const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
      let byBuffer: collections.Int32Array = new collections.Int32Array(buffer);
      expect(byBuffer.length).assertEqual(3);
      let byBufferView: collections.Int32Array = new collections.Int32Array(buffer, 4, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass005
     * @tc.number CollectionsTestClass005
     * @tc.desc   ArkTS Collections Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let set1: collections.Set<number> = new collections.Set();
      expect(set1.size).assertEqual(0);
      let set2: collections.Set<number> = new collections.Set(null);
      expect(set2.size).assertEqual(0);
      let set3: collections.Set<number> = new collections.Set([1, 2, 3]);
      expect(set3.size).assertEqual(3);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass006
     * @tc.number CollectionsTestClass006
     * @tc.desc   ArkTS Collections Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Uint8Array = new collections.Uint8Array(5);
      expect(test.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(8);
      let byBuffer: collections.Uint8Array = new collections.Uint8Array(buffer);
      expect(byBuffer.length).assertEqual(8);
      let byBufferView: collections.Uint8Array = new collections.Uint8Array(buffer, 2, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass007
     * @tc.number CollectionsTestClass007
     * @tc.desc   ArkTS Collections Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Uint16Array = new collections.Uint16Array(5);
      expect(test.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(6);
      let byBuffer: collections.Uint16Array = new collections.Uint16Array(buffer);
      expect(byBuffer.length).assertEqual(3);
      let byBufferView: collections.Uint16Array = new collections.Uint16Array(buffer, 2, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass008
     * @tc.number CollectionsTestClass008
     * @tc.desc   ArkTS Collections Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let test: collections.Uint32Array = new collections.Uint32Array(5);
      expect(test.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(12);
      let byBuffer: collections.Uint32Array = new collections.Uint32Array(buffer);
      expect(byBuffer.length).assertEqual(3);
      let byBufferView: collections.Uint32Array = new collections.Uint32Array(buffer, 4, 2);
      expect(byBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass009
     * @tc.number CollectionsTestClass009
     * @tc.desc   ArkTS Collections Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map1: collections.Map<number, number> = new collections.Map();
      expect(map1.size).assertEqual(0);
      let map2: collections.Map<number, number> = new collections.Map(null);
      expect(map2.size).assertEqual(0);
      let map3: collections.Map<number, number> = new collections.Map([[1, 2], [3, 4]]);
      expect(map3.size).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass010
     * @tc.number CollectionsTestClass010
     * @tc.desc   ArkTS Collections Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      @Sendable
      class SimpleSendable implements lang.ISendable {
        digit: number;

        constructor(value: number) {
          this.digit = value;
        }
      }
      let nullValue: lang.ISendable | null = ArkTSUtils.ASON.parse("null");
      expect(nullValue).assertEqual(null);
      let arrayValue: lang.ISendable | null = ArkTSUtils.ASON.parse("[1, 2, 3]");
      expect(arrayValue != null).assertTrue();
      let arrayObj: lang.ISendable | null = ArkTSUtils.ASON.parse('{"a": 1}');
      expect(arrayObj != null).assertTrue();
      let numValue: string = ArkTSUtils.ASON.stringify(123);
      expect(numValue).assertEqual("123");
      let strValue: string = ArkTSUtils.ASON.stringify("hi arkts");
      expect(strValue).assertEqual("\"hi arkts\"");
      let arrayValue1: string = ArkTSUtils.ASON.stringify(new collections.Array<number>(1, 3, 5));
      expect(arrayValue1).assertEqual("[1,3,5]");
      let objectValue: string = ArkTSUtils.ASON.stringify(new SimpleSendable(1));
      expect(objectValue).assertEqual("{\"digit\":1}");
      done();
    })

    /**
     * @tc.name   CollectionsTestClass011
     * @tc.number CollectionsTestClass011
     * @tc.desc   ArkTS Collections Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arkTSTest : collections.Uint8ClampedArray = new collections.Uint8ClampedArray(5);
      expect(arkTSTest.length).assertEqual(5);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(8);
      let arkTSByBuffer : collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buffer);
      expect(arkTSByBuffer.length).assertEqual(8);
      let arkTSByBufferView: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(buffer, 2, 2);
      expect(arkTSByBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass012
     * @tc.number CollectionsTestClass012
     * @tc.desc   ArkTS Collections BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("CollectionsTestClass012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"big":112233445566778898}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      expect((obj as object)?.["big"]).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass013
     * @tc.number CollectionsTestClass013
     * @tc.desc   ArkTS Collections Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arkTSTest : collections.Float32Array = new collections.Float32Array(3);
      expect(arkTSTest.length).assertEqual(3);
      const buffer : collections.ArrayBuffer = new collections.ArrayBuffer(8);
      let arkTSByBuffer : collections.Float32Array = new collections.Float32Array(buffer);
      expect(arkTSByBuffer.length).assertEqual(2);
      let arkTSByBufferView: collections.Float32Array = new collections.Float32Array(buffer, 0, 2);
      expect(arkTSByBufferView.length).assertEqual(2);
      done();
    })

    /**
     * @tc.name   CollectionsTestClass014
     * @tc.number CollectionsTestClass014
     * @tc.desc   ArkTS Sendable class implement interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      interface I {
        name:string;
      };
      @Sendable
      class A implements I {
        name:string = "test";
        getAttr() {
          return this.name;
        }
      };
      let testClass : A = new A();
      expect(testClass.getAttr()).assertEqual("test");
      done();
    })
  })
}