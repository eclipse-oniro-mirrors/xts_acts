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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import JSON from "@ohos.util.json";
import util from '@ohos.util'
import url from '@ohos.url'

const BigIntMode = {  
  DEFAULT: 0,  
  PARSE_AS_BIGINT: 1,  
  ALWAYS_PARSE_AS_BIGINT: 2  
};  
Object.freeze(BigIntMode);

export default function JsonTest() {
describe('JsonTest', function () {

  /**
   * @tc.name   testparse0001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0001
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testparse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    const jsonText = '{"name": "John", "age": 30}';
    let obj = JSON.parse(jsonText);
    expect( obj.hasOwnProperty('name')).assertEqual(true);
  });

  /**
   * @tc.name   testparse0002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0002
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testparse0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    function reviverFunc(key, value) {
      if (key === "age") {
        return value + 1;
      }
      return value;
    }
    const jsonText = '{"name": "John", "age": 30}';
    let obj = JSON.parse(jsonText, reviverFunc);
    expect(obj["age"]).assertEqual(31);
  });
  
  /**
   * @tc.name   testparse0003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0003
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testparse0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let obj = JSON.parse("null");
    expect(obj).assertEqual(null);
  });

  /**
   * @tc.name   testparse0004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0004
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testparse0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let obj = JSON.parse("true");
    expect(obj).assertEqual(true);
  });

  /**
   * @tc.name   testparse0005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0005
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testparse0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let obj = JSON.parse("false");
    expect(obj).assertEqual(false);
  });

  /**
   * @tc.name   teststringify0006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0006
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("teststringify0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let obj = JSON.stringify({});
    expect(obj).assertEqual("{}");
  });

  /**
   * @tc.name   teststringify0007
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0007
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("teststringify0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let obj = JSON.stringify({name: "joy", age: 30});
    expect(obj).assertEqual('{"name":"joy","age":30}');
  });

  /**
   * @tc.name   teststringify0008
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0008
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("teststringify0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr);
    expect(rst).assertEqual('{"1":"John","2":30}');
  });

  /**
   * @tc.name   teststringify0009
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0009
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("teststringify0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, 1);
    expect(rst).assertEqual('{\n "1": "John",\n "2": 30\n}');
  });

  /**
   * @tc.name   teststringify0010
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0010
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("teststringify0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, "www");
    expect(rst).assertEqual('{\nwww"1": "John",\nwww"2": 30\n}');
  });

  /**
   * @tc.name   teststringify0011
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0011
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, "  ");
    expect(rst).assertEqual('{\n  "1": "John",\n  "2": 30\n}');
  });

  /**
   * @tc.name   teststringify0012
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0012
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let arr = [];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr);
    expect(rst).assertEqual('{}');
  });

  /**
   * @tc.name   teststringify0013
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0013
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer);
    expect(rst).assertEqual('{"1":"JOHN","2":30,"3":"NEW YORK"}');
  });

  /**
   * @tc.name   teststringify0014
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0014
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer, undefined);
    expect(rst).assertEqual('{"1":"JOHN","2":30,"3":"NEW YORK"}');
  });

  /**
   * @tc.name   teststringify0015
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0015
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer, "000");
    expect(rst).assertEqual('{\n000"1": "JOHN",\n000"2": 30,\n000"3": "NEW YORK"\n}');
  });

  /**
   * @tc.name   testhas0016
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0016
   * @tc.desc   Checks whether the object parsed from a JSON string contains the property.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testhas0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    let rst = JSON.has(obj, 'name');
    expect(rst).assertEqual(true);
  });

  /**
   * @tc.name   testhas0017
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0017
   * @tc.desc   Checks whether the object parsed from a JSON string contains the property.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testhas0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    let rst = JSON.has(obj, 'sex');
    expect(rst).assertEqual(false);
  });

  /**
   * @tc.name   tesremove0018
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0018
   * @tc.desc   Removes a property from the object parsed from a JSON string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("tesremove0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    JSON.remove(obj, "name");
    let rst = JSON.has(obj, "name");
    expect(rst).assertEqual(false);
  });

  /**
   * @tc.name   tesremove0019
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0019
   * @tc.desc   Removes a property from the object parsed from a JSON string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("tesremove0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    JSON.remove(obj, "sex");
    let rst = JSON.has(obj, "name");
    expect(rst).assertEqual(true);
  });

    /**
     * @tc.name   testparse0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0020
     * @tc.desc   Parsing JSON strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testparse0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let rst = JSON.parse('12\t\r\n 34')
      } catch (e) {
        let name = e.name;
        expect(name).assertEqual('BusinessError');
      }
    });

  /**
   * @tc.name   testparse0021
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0021
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let rst = JSON.parse('\u2028\u20291234');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   testparse0022
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0022
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = JSON.parse('\t\r \n{\t\r \n' +
      '"property"\t\r \n:\t\r \n{\t\r \n}\t\r \n,\t\r \n' +
      '"prop2"\t\r \n:\t\r \n' +
      '[\t\r \ntrue\t\r \n,\t\r \nnull\t\r \n,123.456\t\r \n]' +
      '\t\r \n}\t\r \n');
    let strRst = JSON.stringify(rst);
    expect(strRst).assertEqual('{"property":{},"prop2":[true,null,123.456]}');
  });

  /**
   * @tc.name   testparse0023
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0023
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let rst = JSON.parse('12 34');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   testparse0024
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0024
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = JSON.parse('"abc"');
    expect(rst).assertEqual(rst);
  });

  /**
   * @tc.name   testparse0025
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0025
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let rst = JSON.parse('""');
      let rst1 = JSON.stringify(rst);
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   testparse0026
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0026
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let rst = JSON.parse('"\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007"');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   testparse0027
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0027
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = JSON.parse('"\\u0058"');
    expect(rst).assertEqual('X');
  });

  /**
   * @tc.name   testparse0028
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0028
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = JSON.parse('"\\\\"');
    expect(rst).assertEqual('\\');
  });

  /**
   * @tc.name   testparse0029
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0029
   * @tc.desc   Parsing JSON strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    var nullChars = new Array();
    nullChars[0] = '\"\u0000\"';
    try {
       let obj = JSON.parse('{ "name" : ' + nullChars[0] + "John" + nullChars[0] + ' } ');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   testparse0030
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0030
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    let jsonText = '{"large":112233445566778899}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["large"]).assertEqual(112233445566778899n);
  });

  /**
   * @tc.name   testparse0031
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0031
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.ALWAYS_PARSE_AS_BIGINT,
    }
    let jsonText = '{"small":123}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["small"]).assertEqual(123n);
  });

  /**
   * @tc.name   testparse0032
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0032
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    let jsonText = '{"deci":1234567890.0123456}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["deci"]).assertEqual(1234567890.0123456);
  });

  /**
   * @tc.name   testparse0033
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0033
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.DEFAULT,
    }
    let jsonText = '{"normal":511428}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["normal"]).assertEqual(511428);
  });

  /**
   * @tc.name   testparse0034
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0034
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    let jsonText = '{"shortExp":1.79e+308}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["shortExp"]).assertEqual(1.79e+308);
  });

  /**
   * @tc.name   testparse0035
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0035
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    let jsonText = '{"long":9007199254740900}';
    let obj = JSON.parse(jsonText,undefined,options);
    expect(obj["long"]).assertEqual(9007199254740900);
  });

  /**
   * @tc.name   testparse0036
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0036
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.ALWAYS_PARSE_AS_BIGINT,
    }
    function reviverFunc(key, value) {
      if (key === "number") {
        return value + 1n;
      }
      return value;
    }
    let jsonText = '{"number":1122}';
    let obj = JSON.parse(jsonText,reviverFunc,options);
    expect(obj["number"]).assertEqual(1123n);
  });

  /**
   * @tc.name   testparse0037
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0037
   * @tc.desc   Parsing JSON strings supports BigInt
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testparse0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    function reviverFunc(key, value) {
      if (key === "big") {
        return value + 1n;
      }
      return value;
    }
    let jsonText = '{"big":112233445566778898}';
    let obj = JSON.parse(jsonText,reviverFunc,options);
    expect(obj["big"]).assertEqual(112233445566778899n);
  });

  /**
   * @tc.name   teststringify0038
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0038
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let options = {
      bigIntMode: BigIntMode.PARSE_AS_BIGINT,
    }
    function reviverFunc(key, value) {
      if (key === "big") {
        return value + 1n;
      }
      return value;
    }
    let jsonText = '{"big":112233445566778898}';
    let obj = JSON.parse(jsonText,reviverFunc,options);
    let jsonStr = JSON.stringify(obj);
    expect(jsonStr).assertEqual('{"big":112233445566778899}');
  });

  /**
   * @tc.name   teststringify0039
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0039
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let obj = JSON.stringify(null);
    expect(obj).assertEqual('null');
  });

  /**
   * @tc.name   teststringify0040
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0040
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let obj = JSON.stringify(undefined);
    expect(obj).assertEqual(undefined);
  });

  /**
   * @tc.name   teststringify0041
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0041
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let obj = JSON.stringify(123);
    expect(obj).assertEqual('123');
  });

  /**
   * @tc.name   teststringify0042
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0042
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let obj = JSON.stringify(-123);
    expect(obj).assertEqual('-123');
  });

  /**
   * @tc.name   teststringify0043
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0043
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = " ";
    let obj = JSON.stringify(rst);
    expect(obj).assertEqual('" "');
  });

  /**
   * @tc.name   teststringify0044
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0044
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("name=cc&name=3f&1=a&4=c");
    let obj = JSON.stringify(rst);
    expect(obj).assertEqual('{"urlClass":{},"parentUrl":null}');
  });

  /**
   * @tc.name   teststringify0045
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0045
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("name=cc&name=3f&1=a&4=c");
    let obj = JSON.stringify(rst.toString());
    expect(obj).assertEqual('"name=cc&name=3f&1=a&4=c"');
  });

  /**
   * @tc.name   teststringify0046
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0046
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("name=cc&name=3f&1=a&4=c");
    let obj = JSON.stringify(rst.entries());
    expect(obj).assertEqual('[["name","cc"],["name","3f"],["1","a"],["4","c"]]');
  });

  /**
   * @tc.name   teststringify0047
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0047
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("sclal=value&aa=89&ux=78");
    let obj = JSON.stringify(rst.keys());
    expect(obj).assertEqual('["sclal","aa","ux"]');
  });

  /**
   * @tc.name   teststringify0048
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0048
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("sclal=value&aa=89&ux=78");
    let obj = JSON.stringify(rst.values());
    expect(obj).assertEqual('["value","89","78"]');
  });

  /**
   * @tc.name   teststringify0049
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0049
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("sclal=value&aa=89&ux=78&djj=12");
    let obj = JSON.stringify(rst.has('ux'));
    expect(obj).assertEqual('true');
  });

  /**
   * @tc.name   teststringify0050
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0050
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("ux=value&aa=89&ux=78&ux=12");
    let obj = JSON.stringify(rst.getAll('ux'));
    expect(obj).assertEqual('["value","78","12"]');
  });

  /**
   * @tc.name   teststringify0051
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0051
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new url.URLParams("ux=value&aa=89&ux=78&ux=12");
    let obj = JSON.stringify(rst.get('cc'));
    expect(obj).assertEqual(undefined);
  });

  /**
   * @tc.name   teststringify0052
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0052
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = url.URL.parseURL("https://www.test1111.com/jkaj?aa=bb&ss=c87#sajh");
    let obj = JSON.stringify(rst.params.values());
    expect(obj).assertEqual('["bb","c87"]');
  });

  /**
   * @tc.name   teststringify0053
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0053
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = url.URL.parseURL("https://www.test1111.com/jkaj?aa=bb#sajh");
    let obj = JSON.stringify(rst.params.entries());
    expect(obj).assertEqual('[["aa","bb"]]');
  });

  /**
   * @tc.name   teststringify0054
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0054
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = url.URL.parseURL("https://www.test1111.com/jkaj?aa=bb#sajh");
    let obj = JSON.stringify(rst.origin);
    expect(obj).assertEqual('"https://www.test1111.com"');
  });

  /**
   * @tc.name   teststringify0055
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0055
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let rst1 = url.URL.parseURL("https://www.test1111.com/jkaj?aa=bb#sajh");
      JSON.parse(rst1.host)
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.name   teststringify0056
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0056
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
    let obj = JSON.stringify(rst);
    let str = '{"0":132,"1":189,"2":247,"3":150,"4":102,"5":204,"6":70,"7":85,"8":155,' +
        '"9":137,"10":214,"11":33,"12":141,"13":16,"14":15,"15":156}';
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0057
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0057
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rst = new util.TextDecoder();
    let obj = JSON.stringify(rst);
    expect(obj).assertEqual('{"encodeStr":"utf-8","flags":0,"isIgnoreBOM":false,"isFatal":false,"textDecoder":{}}');
  });

  /**
   * @tc.name   teststringify0058
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0058
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textDecoderOptions = {
      fatal: false,
      ignoreBOM : true
    }
    let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
    let obj = JSON.stringify(textDecoder);
    expect(obj).assertEqual('{"encodeStr":"utf-8","flags":4,"isIgnoreBOM":true,"isFatal":false,"textDecoder":{}}');
  });

  /**
   * @tc.name   teststringify0059
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0059
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textDecoderOptions = {
      fatal: false,
      ignoreBOM : true
    }
    let decodeToStringOptions = {
      stream: false
    }
    let textDecoder = util.TextDecoder.create('base64', textDecoderOptions);
    let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]);
    let retStr = textDecoder.decodeToString(uint8, decodeToStringOptions);
    let obj = JSON.stringify(textDecoder);
    expect(obj).assertEqual('{"encodeStr":"base64","flags":4,"isIgnoreBOM":true,"isFatal":false,"textDecoder":{}}');
    expect(JSON.stringify(retStr)).assertEqual(undefined)
  });

  /**
   * @tc.name   teststringify0060
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0060
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textEncoder = new util.TextEncoder("utf-8");
    let obj = JSON.stringify(textEncoder);
    expect(obj).assertEqual('{}');
  });

  /**
   * @tc.name   teststringify0061
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0061
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textEncoder = util.TextEncoder.create("utf-8");
    let obj = JSON.stringify(textEncoder);
    expect(obj).assertEqual(undefined);
  });

  /**
   * @tc.name   teststringify0062
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0062
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textEncoder = new util.TextEncoder();
    let result = textEncoder.encodeInto("\uD800\uD801");
    let obj = JSON.stringify(result);
    expect(obj).assertEqual('{"0":237,"1":160,"2":128,"3":237,"4":160,"5":129}');
  });

  /**
   * @tc.name   teststringify0063
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0063
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textEncoder = new util.TextEncoder();
    let result = textEncoder.encodeInto("this is test");
    let obj = JSON.stringify(result);
    let str = '{"0":116,"1":104,"2":105,"3":115,"4":32,"5":105,"6":115,"7":32,"8":116,"9":101,"10":115,"11":116}';
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0064
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0064
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(4);
    let uint8 = new Uint8Array(buffer);
    let result = textEncoder.encodeIntoUint8Array('abcd', uint8);
    let obj = JSON.stringify(result);
    expect(obj).assertEqual('{"read":4,"written":4}');
  });

  /**
   * @tc.name   teststringify0065
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0065
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rationalNumber = new util.RationalNumber();
    let obj = JSON.stringify(rationalNumber);
    expect(obj).assertEqual('{"mnum":0,"mden":0}');
  });

  /**
   * @tc.name   teststringify0066
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0066
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
    let obj = JSON.stringify(rationalNumber);
    expect(obj).assertEqual('{"mnum":1,"mden":2}');
  });

  /**
   * @tc.name   teststringify0067
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0067
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let rational = util.RationalNumber.createRationalFromString("3/4");
    let obj = JSON.stringify(rational);
    expect(obj).assertEqual('{"mnum":3,"mden":4}');
  });

  /**
   * @tc.name   teststringify0068
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0068
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();;
    let obj = JSON.stringify(pro);
    let str = '{"maxSize":64,"maxNumber":2147483647,"putCount":0,' +
          '"createCount":0,"evictionCount":0,"hitCount":0,"missCount":0,"length":0,"cache":{}}';
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0069
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0069
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();
    pro.updateCapacity(100);
    let obj = JSON.stringify(pro);
    let str = '{"maxSize":100,"maxNumber":2147483647,"putCount":0,"createCount":0,' +
        '"evictionCount":0,"hitCount":0,"missCount":0,"length":0,"cache":{}}';
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0070
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0070
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();
    pro.put(2, 10);
    let str = '{"maxSize":64,"maxNumber":2147483647,"putCount":1,' +
        '"createCount":0,"evictionCount":0,"hitCount":0,"missCount":0,"length":1,"cache":{}}';
    let obj = JSON.stringify(pro);
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0071
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0071
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();
    pro.put(2, 10);
    pro.updateCapacity(2);
    pro.put(50, 22);
    let str = '{"maxSize":2,"maxNumber":2147483647,"putCount":2,"createCount":0,' +
        '"evictionCount":0,"hitCount":0,"missCount":0,"length":2,"cache":{}}';
    let obj = JSON.stringify(pro);
    expect(obj).assertEqual(str);
  });

  /**
   * @tc.name   teststringify0072
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0072
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();
    pro.put(2, 10);
    pro.put(2, "anhu");
    pro.put("afaf", "grfb");
    let result = pro.values();
    let obj = JSON.stringify(result);
    expect(obj).assertEqual('["anhu","grfb"]');
  });

  /**
   * @tc.name   teststringify0073
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0073
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let pro = new util.LRUCache();
    pro.put(2, 10);
    pro.put(2, "anhu");
    pro.put("afaf", "grfb");
    let result = pro.keys();
    let obj = JSON.stringify(result);
    expect(obj).assertEqual('[2,"afaf"]');
  });

  /**
   * @tc.name   teststringify0074
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_JSON_0074
   * @tc.desc   Convert a JavaScript object or value to a JSON string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("teststringify0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let textDecoderOptions = {
      fatal: false,
      ignoreBOM : true
    }
    let decodeToStringOptions = {
      stream: false
    }
    let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
    let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]);
    let retStr = textDecoder.decodeToString(uint8, decodeToStringOptions);
    let obj = JSON.stringify(retStr);
    expect(obj).assertEqual('"abc"');
  });
})}