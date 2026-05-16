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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
enum bitwise_complement_enum_Color { Red, Green, Blue }
export default function ExpressionsBitwiseComplementTest(): void {
  describe("ExpressionsBitwiseComplementTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0100
     * @tc.name      testExpressionsBitwiseComplement0001
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0;
      expect(~a).assertEqual(-1);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0200
     * @tc.name      testExpressionsBitwiseComplement0002
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 1;
      expect(~a).assertEqual(-2);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0300
     * @tc.name      testExpressionsBitwiseComplement0003
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127;
      expect(~a).assertEqual(-128);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0400
     * @tc.name      testExpressionsBitwiseComplement0004
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -86;
      expect(~a).assertEqual(85);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0500
     * @tc.name      testExpressionsBitwiseComplement0005
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 15;
      expect(~a).assertEqual(-16);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0600
     * @tc.name      testExpressionsBitwiseComplement0006
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 51;
      expect(~a).assertEqual(-52);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0700
     * @tc.name      testExpressionsBitwiseComplement0007
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      expect(~a).assertEqual(-1);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0800
     * @tc.name      testExpressionsBitwiseComplement0008
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      expect(~a).assertEqual(-2);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_0900
     * @tc.name      testExpressionsBitwiseComplement0009
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 127;
      expect(~a).assertEqual(-128);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1000
     * @tc.name      testExpressionsBitwiseComplement0010
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -86;
      expect(~a).assertEqual(85);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1100
     * @tc.name      testExpressionsBitwiseComplement0011
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 15;
      expect(~a).assertEqual(-16);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1200
     * @tc.name      testExpressionsBitwiseComplement0012
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 51;
      expect(~a).assertEqual(-52);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1300
     * @tc.name      testExpressionsBitwiseComplement0013
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 255;
      expect(~a).assertEqual(-256);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1400
     * @tc.name      testExpressionsBitwiseComplement0014
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 21845;
      expect(~a).assertEqual(-21846);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1500
     * @tc.name      testExpressionsBitwiseComplement0015
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -3856;
      expect(~a).assertEqual(3855);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1600
     * @tc.name      testExpressionsBitwiseComplement0016
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      expect(~a).assertEqual(-32768);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1700
     * @tc.name      testExpressionsBitwiseComplement0017
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0;
      expect(~a).assertEqual(-1);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1800
     * @tc.name      testExpressionsBitwiseComplement0018
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 1;
      expect(~a).assertEqual(-2);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_1900
     * @tc.name      testExpressionsBitwiseComplement0019
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 127;
      expect(~a).assertEqual(-128);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2000
     * @tc.name      testExpressionsBitwiseComplement0020
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -86;
      expect(~a).assertEqual(85);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2100
     * @tc.name      testExpressionsBitwiseComplement0021
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 15;
      expect(~a).assertEqual(-16);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2200
     * @tc.name      testExpressionsBitwiseComplement0022
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 51;
      expect(~a).assertEqual(-52);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2300
     * @tc.name      testExpressionsBitwiseComplement0023
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 255;
      expect(~a).assertEqual(-256);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2400
     * @tc.name      testExpressionsBitwiseComplement0024
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 21845;
      expect(~a).assertEqual(-21846);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2500
     * @tc.name      testExpressionsBitwiseComplement0025
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -3856;
      expect(~a).assertEqual(3855);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2600
     * @tc.name      testExpressionsBitwiseComplement0026
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483647;
      expect(~a).assertEqual(-2147483648);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2700
     * @tc.name      testExpressionsBitwiseComplement0027
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 0;
      expect(~a).assertEqual(-1);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2800
     * @tc.name      testExpressionsBitwiseComplement0028
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 1;
      expect(~a).assertEqual(-2);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_2900
     * @tc.name      testExpressionsBitwiseComplement0029
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 127;
      expect(~a).assertEqual(-128);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3000
     * @tc.name      testExpressionsBitwiseComplement0030
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -86;
      expect(~a).assertEqual(85);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3100
     * @tc.name      testExpressionsBitwiseComplement0031
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 15;
      expect(~a).assertEqual(-16);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3200
     * @tc.name      testExpressionsBitwiseComplement0032
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 51;
      expect(~a).assertEqual(-52);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3300
     * @tc.name      testExpressionsBitwiseComplement0033
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 255;
      expect(~a).assertEqual(-256);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3400
     * @tc.name      testExpressionsBitwiseComplement0034
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 21845;
      expect(~a).assertEqual(-21846);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3500
     * @tc.name      testExpressionsBitwiseComplement0035
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -3856;
      expect(~a).assertEqual(3855);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3600
     * @tc.name      testExpressionsBitwiseComplement0036
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 9223372036854775807;
      expect(~a).assertEqual(-9223372036854775808);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3700
     * @tc.name      testExpressionsBitwiseComplement0037
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 0.0f;
      expect(~a).assertEqual(-1.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3800
     * @tc.name      testExpressionsBitwiseComplement0038
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 127.0f;
      expect(~a).assertEqual(-128.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_3900
     * @tc.name      testExpressionsBitwiseComplement0039
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 32767.0f;
      expect(~a).assertEqual(-32768.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4000
     * @tc.name      testExpressionsBitwiseComplement0040
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 32767.251f;
      expect(~a).assertEqual(-32768.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4100
     * @tc.name      testExpressionsBitwiseComplement0041
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 32767.851f;
      expect(~a).assertEqual(-32768.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4200
     * @tc.name      testExpressionsBitwiseComplement0042
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2147483647.0f;
      expect(~a).assertEqual(-2147483648.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4300
     * @tc.name      testExpressionsBitwiseComplement0043
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2147483648.0f;
      expect(~a).assertEqual(-2147483648.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4400
     * @tc.name      testExpressionsBitwiseComplement0044
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2147483649.0f;
      expect(~a).assertEqual(-2147483648.0f);
      expect((~a) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4500
     * @tc.name      testExpressionsBitwiseComplement0045
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 0.0;
      expect(~a).assertEqual(-1.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4600
     * @tc.name      testExpressionsBitwiseComplement0046
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 127.0;
      expect(~a).assertEqual(-128.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4700
     * @tc.name      testExpressionsBitwiseComplement0047
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 32767.0;
      expect(~a).assertEqual(-32768.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4800
     * @tc.name      testExpressionsBitwiseComplement0048
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 32767.251;
      expect(~a).assertEqual(-32768.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_4900
     * @tc.name      testExpressionsBitwiseComplement0049
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 32767.851;
      expect(~a).assertEqual(-32768.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5000
     * @tc.name      testExpressionsBitwiseComplement0050
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 2147483647.0;
      expect(~a).assertEqual(-2147483648.0);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5100
     * @tc.name      testExpressionsBitwiseComplement0051
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 9.223372036854776e+18;
      expect(~a).assertEqual(-9.223372036854776e+18);
      expect((~a) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5200
     * @tc.name      testExpressionsBitwiseComplement0052
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 0n;
      expect(~a).assertEqual(-1n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5300
     * @tc.name      testExpressionsBitwiseComplement0053
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 1n;
      expect(~a).assertEqual(-2n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5400
     * @tc.name      testExpressionsBitwiseComplement0054
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 127n;
      expect(~a).assertEqual(-128n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5500
     * @tc.name      testExpressionsBitwiseComplement0055
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = -86n;
      expect(~a).assertEqual(85n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5600
     * @tc.name      testExpressionsBitwiseComplement0056
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 15n;
      expect(~a).assertEqual(-16n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5700
     * @tc.name      testExpressionsBitwiseComplement0057
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 51n;
      expect(~a).assertEqual(-52n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5800
     * @tc.name      testExpressionsBitwiseComplement0058
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 255n;
      expect(~a).assertEqual(-256n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_5900
     * @tc.name      testExpressionsBitwiseComplement0059
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 21845n;
      expect(~a).assertEqual(-21846n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_6000
     * @tc.name      testExpressionsBitwiseComplement0060
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = -3856n;
      expect(~a).assertEqual(3855n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_6100
     * @tc.name      testExpressionsBitwiseComplement0061
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 9223372036854775807n;
      expect(~a).assertEqual(-9223372036854775808n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_6200
     * @tc.name      testExpressionsBitwiseComplement0062
     * @tc.desc      Bitwise complement operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 92233720368547745654568564565807n;
      expect(~a).assertEqual(-92233720368547745654568564565808n);
      expect((~a) instanceof bigint).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_BITWISE_COMPLEMENT_6300
     * @tc.name      testExpressionsBitwiseComplement0063
     * @tc.desc      Bitwise complement operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsBitwiseComplement0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ~bitwise_complement_enum_Color.Red
      let b = ~bitwise_complement_enum_Color.Green
      let c = ~bitwise_complement_enum_Color.Blue
      expect(a).assertEqual(-1)
      expect(b).assertEqual(-2)
      expect(c).assertEqual(-3)
    });
  });
}