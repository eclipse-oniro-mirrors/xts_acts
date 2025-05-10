/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, HashMap, HashSet } from '@kit.ArkTS'
import { SendableTestClass, NormalTestClass } from './exportFunc'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number    : ASONTestClass001
     * @tc.name      : ArkTS ASON parse BigInt
     * @tc.desc      : ArkTS ASON parse BigInt
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass001", 0, async (done: Function) => {
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
     * @tc.number    : ASONTestClass002
     * @tc.name      : ArkTS ASON parse number
     * @tc.desc      : ArkTS ASON parse number
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass002", 0, async (done: Function) => {
      let jsonText = '123';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual(123);
      done();
    })

    /**
     * @tc.number    : ASONTestClass003
     * @tc.name      : ArkTS ASON parse number
     * @tc.desc      : ArkTS ASON parse number
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass003", 0, async (done: Function) => {
      let jsonText = '{"number":123}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.["number"]).assertEqual(123);
      done();
    })

    /**
     * @tc.number    : ASONTestClass004
     * @tc.name      : ArkTS ASON parse string
     * @tc.desc      : ArkTS ASON parse string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass004", 0, async (done: Function) => {
      let jsonText = '{"string":"testASON"}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.["string"]).assertEqual("testASON");
      done();
    })

    /**
     * @tc.number    : ASONTestClass005
     * @tc.name      : ArkTS ASON parse string
     * @tc.desc      : ArkTS ASON parse string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass005", 0, async (done: Function) => {
      let jsonText = '"testASON"';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual("testASON");
      done();
    })

    /**
     * @tc.number    : ASONTestClass006
     * @tc.name      : ArkTS ASON parse array
     * @tc.desc      : ArkTS ASON parse array
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass006", 0, async (done: Function) => {
      let jsonText = '[1,2,3]';
      let obj : collections.Array<number> = ArkTSUtils.ASON.parse(jsonText) as collections.Array<number>;
      expect(obj.at(1)).assertEqual(2);
      done();
    })

    /**
     * @tc.number    : ASONTestClass007
     * @tc.name      : ArkTS ASON parse array
     * @tc.desc      : ArkTS ASON parse array
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass007", 0, async (done: Function) => {
      let jsonText = '{"arr":[1,3,5]}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let arr : collections.Array<number> = (obj as object)?.["arr"];
      expect(arr.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.number    : ASONTestClass008
     * @tc.name      : ArkTS ASON parse true
     * @tc.desc      : ArkTS ASON parse true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass008", 0, async (done: Function) => {
      let jsonText = 'true';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(true);
      done();
    })

    /**
     * @tc.number    : ASONTestClass009
     * @tc.name      : ArkTS ASON parse false
     * @tc.desc      : ArkTS ASON parse false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass009", 0, async (done: Function) => {
      let jsonText = 'false';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(false);
      done();
    })

    /**
     * @tc.number    : ASONTestClass010
     * @tc.name      : ArkTS ASON parse obj
     * @tc.desc      : ArkTS ASON parse obj
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass010", 0, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(typeof obj).assertEqual("object");
      done();
    })

    /**
     * @tc.number    : ASONTestClass011
     * @tc.name      : ArkTS ASON parse obj
     * @tc.desc      : ArkTS ASON parse obj
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass011", 0, async (done: Function) => {
      let jsonText = '{"123":"123"}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect((obj as object)?.["123"]).assertEqual("123");
      done();
    })

    /**
     * @tc.number    : ASONTestClass012
     * @tc.name      : ArkTS ASON parse Map
     * @tc.desc      : ArkTS ASON parse Map
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass012", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{"big":112233445566778898}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,bigint>;
      expect(map.get("big")).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.number    : ASONTestClass013
     * @tc.name      : ArkTS ASON parse Map
     * @tc.desc      : ArkTS ASON parse Map
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass013", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      expect(typeof map).assertEqual("object");
      done();
    })

    /**
     * @tc.number    : ASONTestClass014
     * @tc.name      : ArkTS ASON parse Map
     * @tc.desc      : ArkTS ASON parse Map
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass014", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let map : collections.Map<string,collections.Map<string,collections.Array<number>>>
          = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,collections.Map<string,collections.Array<number>>>;
      expect(typeof map.get("feature")).assertEqual("object");
      expect(map.get("feature")?.get("arr")?.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.number    : ASONTestClass015
     * @tc.name      : ArkTS ASON parse Map Error
     * @tc.desc      : ArkTS ASON parse Map Error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass015", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP Prop in JSON");
      }
      done();
    })

    /**
     * @tc.number    : ASONTestClass016
     * @tc.name      : ArkTS ASON parse obj Error
     * @tc.desc      : ArkTS ASON parse obj Error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass016", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object Prop in JSON");
      }
      done();
    })

    /**
     * @tc.number    : ASONTestClass017
     * @tc.name      : ArkTS ASON parse Map Error
     * @tc.desc      : ArkTS ASON parse Map Error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass017", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{"error"}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP in JSON");
      }
      done();
    })

    /**
     * @tc.number    : ASONTestClass018
     * @tc.name      : ArkTS ASON parse obj Error
     * @tc.desc      : ArkTS ASON parse obj Error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass018", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{"error"}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object in JSON");
      }
      done();
    })

    /**
     * @tc.number    : ASONTestClass019
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass019", 0, async (done: Function) => {
      let obj = 1122;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual("1122");
      done();
    })

    /**
     * @tc.number    : ASONTestClass020
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass020", 0, async (done: Function) => {
      let obj = "test ASON";
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('"test ASON"');
      done();
    })

    /**
     * @tc.number    : ASONTestClass021
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass021", 0, async (done: Function) => {
      let obj = true;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual("true");
      done();
    })

    /**
     * @tc.number    : ASONTestClass022
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass022", 0, async (done: Function) => {
      let obj = false;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual("false");
      done();
    })

    /**
     * @tc.number    : ASONTestClass023
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass023", 0, async (done: Function) => {
      let obj = null;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual("null");
      done();
    })

    /**
     * @tc.number    : ASONTestClass024
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass024", 0, async (done: Function) => {
      let obj = new collections.Array<number>(1, 3, 5);
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual("[1,3,5]");
      done();
    })

    /**
     * @tc.number    : ASONTestClass025
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass025", 0, async (done: Function) => {
      let jsonText = '{"string":"testASON"}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{"string":"testASON"}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass026
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass026", 0, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass027
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass027", 0, async (done: Function) => {
      let obj = 112233445566778899n;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('112233445566778899');
      done();
    })

    /**
     * @tc.number    : ASONTestClass028
     * @tc.name      : ArkTS ASON stringify
     * @tc.desc      : ArkTS ASON stringify
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass028", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"zerodeci1":0.0000123,"zerodeci2":0.4799123,"zerodeci3":0.7777334477383838389929292922,"zerodeci4":0.0000000000000123}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{"zerodeci1":0.0000123,"zerodeci2":0.4799123,"zerodeci3":0.7777334477383838,"zerodeci4":1.23e-14}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass029
     * @tc.name      : ArkTS ASON parse Map
     * @tc.desc      : ArkTS ASON parse Map
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass029", 0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{"feature":{"arr":[1,3,5]}}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass030
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass030", 0, async (done: Function) => {
      let jsonText = '{"text":"ASON support MAP Test Start","largeNumber":112233445566778899,"people":{"name":"Mary","sex":"1","height":"165"}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{"text":"ASON support MAP Test Start","largeNumber":112233445566778899,"people":{"name":"Mary","sex":"1","height":"165"}}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass031
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass031", 0, async (done: Function) => {
      let jsonText = '{"args1":true,"args2":false,"args3":null}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{"args1":true,"args2":false,"args3":null}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass032
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass032", 0, async (done: Function) => {
      let jsonText = '{"people":{"name":"Mary","sex":"1","height":165,"args":{"arr":[1,2,3],"check":true,"num":null}}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{"people":{"name":"Mary","sex":"1","height":165,"args":{"arr":[1,2,3],"check":true,"num":null}}}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass033
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass033", 0, async (done: Function) => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.number    : ASONTestClass034
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass034", 0, async (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.number    : ASONTestClass035
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass035", 0, async (done: Function) => {
      let set = new HashSet<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.number    : ASONTestClass036
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass036", 0, async (done: Function) => {
      let arr = new collections.Array<string>();
      arr.push("a", "b", "c");
      let sendableObj = new SendableTestClass(arr);
      let set = new collections.Set<SendableTestClass>();
      set.add(sendableObj);
      let map = new collections.Map<string, collections.Set<SendableTestClass>>();
      map.set("set", set);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{"set":[{"arr":["a","b","c"]}]}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass037
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass037", 0, async (done: Function) => {
      let arr = new Array<string>();
      arr.push("a", "b", "c");
      let obj = new NormalTestClass(arr);
      let set = new Set<Object>();
      set.add(obj);
      let map = new Map<string, Set<Object>>();
      map.set("set", set);
      let hashSet = new HashSet<Object>();
      hashSet.add(map);
      let hashMap = new HashMap<string, HashSet<Object>>();
      hashMap.set("hashSet", hashSet);
      let output = ArkTSUtils.ASON.stringify(hashMap);
      expect(output).assertEqual('{"hashSet":[{"set":[{"arr":["a","b","c"]}]}]}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass038
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass038", 0, async (done: Function) => {
      let map = new Map<string, Object>();
      let set = new Set<Object>();
      let hashMap = new HashMap<string, Object>();
      let hashSet = new HashSet<Object>();
      map.set("set", set);
      set.add(hashMap);
      hashMap.set("hashSet", hashSet);
      hashSet.add(map);
      try {
        ArkTSUtils.ASON.stringify(map);
      } catch (e) {
        expect(e.message).assertEqual('stack contains value, usually caused by circular structure');
      }
      done();
    })

    /**
     * @tc.number    : ASONTestClass039
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass039", 0, async (done: Function) => {
      let map = new Map<string | null | number | boolean, string | null | number | boolean>();
      map.set("a1", "A1");
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{"1":1,"true":true}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass040
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass040", 0, async (done: Function) => {
      let map = new collections.Map<string | null | number | boolean, string | null | number | boolean>();
      map.set("a1", "A1");
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{"1":1,"true":true}');
      done();
    })

    /**
     * @tc.number    : ASONTestClass041
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass041", 0, async (done: Function) => {
      let set = new Set<string | null | number | boolean>();
      set.add("a1");
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })

    /**
     * @tc.number    : ASONTestClass042
     * @tc.name      : ArkTS ASON stringify Map and Set
     * @tc.desc      : ArkTS ASON stringify Map and Set
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ASONTestClass042", 0, async (done: Function) => {
      let set = new collections.Set<string | null | number | boolean>();
      set.add("a1");
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })
  })
}