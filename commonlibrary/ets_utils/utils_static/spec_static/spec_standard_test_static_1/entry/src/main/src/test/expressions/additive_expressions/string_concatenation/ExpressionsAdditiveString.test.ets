/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Bird {
  static fly() {
    return "Fly ";
  }
}
class Fish {
  static swim() {
    return "1";
  }
}

interface GeneratedObjectLiteralInterface_1 {
  name: string;
}

const Dog: GeneratedObjectLiteralInterface_1 = {
  name: "Pete",
};
const cat1: GeneratedObjectLiteralInterface_1 = {
  name: "Tom",
};
const c = 2
const c1 = "str"
const c2 = "1"
let v = 2
let v1 = "str"
let v2 = "1"
function nop() {}
enum Color {
  Red = "Red",
}

interface GeneratedObjectLiteralInterface_2 {
  Blue: string | number;
}

const Color1: GeneratedObjectLiteralInterface_2 = {
  Blue: "Light Blue",
};

interface GeneratedObjectLiteralInterface_3 {
  Blue: number;
  Green: number;
}

const Color2: GeneratedObjectLiteralInterface_3 = {
  Blue: 8,
  Green: 7,
};
const Color3: GeneratedObjectLiteralInterface_3 = {
  Blue: 8,
  Green: 1,
};


export default function ExpressionsAdditiveStringTest() {
  describe("ExpressionsAdditiveStringTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0100
     * @tc.name      testExpressionsAdditiveString0001
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" + "")).assertEqual("");
      expect(("" + "a")).assertEqual("a");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0200
     * @tc.name      testExpressionsAdditiveString0002
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("a" + "")).assertEqual("a");
      expect(("a" + "a")).assertEqual("aa");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0300
     * @tc.name      testExpressionsAdditiveString0003
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("aaa" + "AAA")).assertEqual("aaaAAA");
      expect(("фыва" + "ФЫВА")).assertEqual("фываФЫВА");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0400
     * @tc.name      testExpressionsAdditiveString0004
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((`multiline\rstring\rliteral 1\r` + `multiline\rstring\rliteral 2\r`)).assertEqual(`multiline\rstring\rliteral 1\rmultiline\rstring\rliteral 2\r`);
      expect("str1 " + "str2 " + "str3").assertEqual("str1 str2 str3");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0500
     * @tc.name      testExpressionsAdditiveString0005
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str" + 2 + 3).assertEqual("str23");
      expect(2 + 3 + "str").assertEqual("5str");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0600
     * @tc.name      testExpressionsAdditiveString0006
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + (3 + "str")).assertEqual("23str");
      expect(("str1 " + "str2 ") + "str3").assertEqual("str1 str2 str3");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0700
     * @tc.name      testExpressionsAdditiveString0007
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str1 " + ("str2 " + "str3")).assertEqual("str1 str2 str3");
      expect(("str1 " + "str2 ") + ("str3 " + "str4")).assertEqual("str1 str2 str3 str4");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0800
     * @tc.name      testExpressionsAdditiveString0008
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str1 " + (("str2 " + "str3 ") + "str4")).assertEqual("str1 str2 str3 str4");
      expect("str" + (2 + 3)).assertEqual("str5");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_0900
     * @tc.name      testExpressionsAdditiveString0009
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str" + (3 - 2)).assertEqual("str1");
      expect("str" + 2 * 3).assertEqual("str6");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1000
     * @tc.name      testExpressionsAdditiveString0010
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str" + 6 / 3).assertEqual("str2");
      expect("str " + ("str1" == "str1")).assertEqual("str true");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1100
     * @tc.name      testExpressionsAdditiveString0011
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("str1" === "str2") + " str").assertEqual("false str");
      expect("str " + null).assertEqual("str null");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1200
     * @tc.name      testExpressionsAdditiveString0012
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("str " + undefined).assertEqual("str undefined");
      expect("boolean " + true).assertEqual("boolean true");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1300
     * @tc.name      testExpressionsAdditiveString0013
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("boolean " + false).assertEqual("boolean false");
      expect("tuple " + 1 + ",2").assertEqual("tuple 1,2");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1400
     * @tc.name      testExpressionsAdditiveString0014
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("tuple " + 1 + ",Two").assertEqual("tuple 1,Two");
      expect("color " + Color3.Green).assertEqual("color 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1500
     * @tc.name      testExpressionsAdditiveString0015
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("color " + Color2.Green).assertEqual("color 7");
      expect("color " + Color2.Blue).assertEqual("color 8");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1600
     * @tc.name      testExpressionsAdditiveString0016
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("color " + Color1.Blue).assertEqual("color Light Blue");
      expect("color " + Color[Color.Red]).assertEqual("color Red");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1700
     * @tc.name      testExpressionsAdditiveString0017
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("function " + nop).assertEqual("function " + nop.toString())
      expect("variable " + v).assertEqual("variable 2");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1800
     * @tc.name      testExpressionsAdditiveString0018
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(v1 + v2).assertEqual("str1");
      expect("constant " + c).assertEqual("constant 2");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_1900
     * @tc.name      testExpressionsAdditiveString0019
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(c1 + c2).assertEqual("str1");
      expect("cat " + cat1.name).assertEqual("cat Tom");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2000
     * @tc.name      testExpressionsAdditiveString0020
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Dog.name + 1).assertEqual("Pete1");
      expect("str " + Fish.swim()).assertEqual("str 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2100
     * @tc.name      testExpressionsAdditiveString0021
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Bird.fly() + 2).assertEqual("Fly 2");
      expect("decimal number is " + 123).assertEqual("decimal number is 123");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2200
     * @tc.name      testExpressionsAdditiveString0022
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(123 + " is decimal number").assertEqual("123 is decimal number");
      expect("zero is " + 0).assertEqual("zero is 0");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2300
     * @tc.name      testExpressionsAdditiveString0023
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 + " is zero").assertEqual("0 is zero");
      expect("negative number is " + -1).assertEqual("negative number is -1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2400
     * @tc.name      testExpressionsAdditiveString0024
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-327 + " is negative number").assertEqual("-327 is negative number");
      expect("underscored number is " + 1_000_000).assertEqual("underscored number is 1000000");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2500
     * @tc.name      testExpressionsAdditiveString0025
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1_000 + " is underscored number").assertEqual("1000 is underscored number");
      expect("negative underscored number is " + -1_000).assertEqual("negative underscored number is -1000");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2600
     * @tc.name      testExpressionsAdditiveString0026
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-3_23 + " is negative underscored number").assertEqual("-323 is negative underscored number");
      expect("hex number is " + 0xA2E).assertEqual("hex number is 2606");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2700
     * @tc.name      testExpressionsAdditiveString0027
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0x134 + " is hex number").assertEqual("308 is hex number");
      expect("hex zero is " + 0x0).assertEqual("hex zero is 0");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2800
     * @tc.name      testExpressionsAdditiveString0028
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0x0 + " is hex zero").assertEqual("0 is hex zero");
      expect("negative hex number is " + -0x790).assertEqual("negative hex number is -1936");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_2900
     * @tc.name      testExpressionsAdditiveString0029
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0xFFFF + " is negative hex number").assertEqual("-65535 is negative hex number");
      expect("octal number is " + 0o702).assertEqual("octal number is 450");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3000
     * @tc.name      testExpressionsAdditiveString0030
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0o067 + " is octal number").assertEqual("55 is octal number");
      expect("octal zero is " + 0o0).assertEqual("octal zero is 0");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3100
     * @tc.name      testExpressionsAdditiveString0031
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0o0 + " is octal zero").assertEqual("0 is octal zero");
      expect("negative octal number is " + -0o0762).assertEqual("negative octal number is -498");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3200
     * @tc.name      testExpressionsAdditiveString0032
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0o326 + " is negative octal number").assertEqual("-214 is negative octal number");
      expect("binary number is " + 0b101).assertEqual("binary number is 5");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3300
     * @tc.name      testExpressionsAdditiveString0033
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b011 + " is binary number").assertEqual("3 is binary number");
      expect("binary zero is " + 0b0).assertEqual("binary zero is 0");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3400
     * @tc.name      testExpressionsAdditiveString0034
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b0 + " is binary zero").assertEqual("0 is binary zero");
      expect("negative binary number is " + -0b101).assertEqual("negative binary number is -5");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3500
     * @tc.name      testExpressionsAdditiveString0035
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0b011 + " is negative binary number").assertEqual("-3 is negative binary number");
      expect("BigInt is " + 123n).assertEqual("BigInt is 123");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3600
     * @tc.name      testExpressionsAdditiveString0036
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(123n + " is BigInt").assertEqual("123 is BigInt");
      expect("BigInt zero is " + 0n).assertEqual("BigInt zero is 0");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3700
     * @tc.name      testExpressionsAdditiveString0037
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0n + " is BigInt zero").assertEqual("0 is BigInt zero");
      expect("negative BigInt is " + -123n).assertEqual("negative BigInt is -123");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3800
     * @tc.name      testExpressionsAdditiveString0038
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-123n + " is negative BigInt").assertEqual("-123 is negative BigInt");
      expect("byte is " + (1 as byte)).assertEqual("byte is 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_3900
     * @tc.name      testExpressionsAdditiveString0039
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 as byte + " is byte").assertEqual("1 is byte");
      expect("short is " + (1 as short)).assertEqual("short is 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4000
     * @tc.name      testExpressionsAdditiveString0040
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 as short + " is short").assertEqual("1 is short");
      expect("long is " + (1 as long)).assertEqual("long is 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4100
     * @tc.name      testExpressionsAdditiveString0041
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 as long + " is long").assertEqual("1 is long");
      expect("float is " + (1 as float)).assertEqual("float is 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4200
     * @tc.name      testExpressionsAdditiveString0042
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 as float + " is float").assertEqual("1 is float");
      expect("double is " + (1 as double)).assertEqual("double is 1");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4300
     * @tc.name      testExpressionsAdditiveString0043
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 as double + " is double").assertEqual("1 is double");
      expect("max long number is " + 9223372036854775807).assertEqual("max long number is 9223372036854775807");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4400
     * @tc.name      testExpressionsAdditiveString0044
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9223372036854775807 + " is max long number").assertEqual("9223372036854775807 is max long number");
      expect(NaN + " is not a number").assertEqual("NaN is not a number");
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_STRING_4500
     * @tc.name      testExpressionsAdditiveString0045
     * @tc.desc      String concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveString0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Positive infinity is " + Double.POSITIVE_INFINITY).assertEqual("Positive infinity is Infinity");
      expect("Negative infinity is " + Double.NEGATIVE_INFINITY).assertEqual("Negative infinity is -Infinity");
    })
  });
}