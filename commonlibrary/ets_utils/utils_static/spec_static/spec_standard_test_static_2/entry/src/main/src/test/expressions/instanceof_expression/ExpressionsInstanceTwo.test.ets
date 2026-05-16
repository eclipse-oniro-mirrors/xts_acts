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
} from "../../../../../hypium";

let a7: float[] = [1.0f, 1.0f]
let a11: char[] = [c'a', c'a']
class A {}
let a28 = [1.0f, 1.0f]
let a32 = [c'a', c'a']

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

interface I8<T> {}
interface J<T> {}
class A17<T> implements I8<T> {}
class B<T> extends A17<T> implements J<T> {}
class C<T> {}
let c: C<int>
enum Color1 { Red, Green }
enum Color2 { Red, Green }
enum Rating1: double { A = 1.0, B = 1.5 }
enum Color3 { Red = 'r', Green = 'g' }
enum Color4 { Red, Green }
enum Rating2: double { A = 1.0, B = 1.5 }
enum Rating3: double { A = 1.0, B = 1.5 }
enum Color5 { Red = 'r', Green = 'g' }
let a89: Array<number> = [1.0, 2.0]            
let a90: FixedArray<number> = [1.0, 2.0]       
type TT1 = [int, string]                       
let a91: TT1 = [42, "abc"]
type TT2 = [int, string]
let a92: TT2 = [42, "abc"]
let a93: TT2 = [42, "abc"]
class A18<T> {}
let func1 = (p: int) => p + p
let a94: Record<string, int> = { '1': 1 }
type TT28 = Char
let test28: TT28 = c''

export default function ExpressionsInstanceTwoTest(): void {
  describe("ExpressionsInstanceTwoTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0100
     * @tc.name      testExpressionsInstanceTwo0001
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0200
     * @tc.name      testExpressionsInstanceTwo0002
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0300
     * @tc.name      testExpressionsInstanceTwo0003
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0400
     * @tc.name      testExpressionsInstanceTwo0004
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0500
     * @tc.name      testExpressionsInstanceTwo0005
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof boolean
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof boolean)
      expect(v2).assertEqual(1)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0600
     * @tc.name      testExpressionsInstanceTwo0006
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0700
     * @tc.name      testExpressionsInstanceTwo0007
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0800
     * @tc.name      testExpressionsInstanceTwo0008
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_0900
     * @tc.name      testExpressionsInstanceTwo0009
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1000
     * @tc.name      testExpressionsInstanceTwo0010
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1100
     * @tc.name      testExpressionsInstanceTwo0011
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1200
     * @tc.name      testExpressionsInstanceTwo0012
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => false)() instanceof boolean
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => false)() instanceof boolean)
      expect(v2).assertEqual(1)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1300
     * @tc.name      testExpressionsInstanceTwo0013
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1400
     * @tc.name      testExpressionsInstanceTwo0014
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1500
     * @tc.name      testExpressionsInstanceTwo0015
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1600
     * @tc.name      testExpressionsInstanceTwo0016
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1700
     * @tc.name      testExpressionsInstanceTwo0017
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1800
     * @tc.name      testExpressionsInstanceTwo0018
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_1900
     * @tc.name      testExpressionsInstanceTwo0019
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0n)() instanceof bigint
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0n)() instanceof bigint)
      expect(v2).assertEqual(1)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2000
     * @tc.name      testExpressionsInstanceTwo0020
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2100
     * @tc.name      testExpressionsInstanceTwo0021
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2200
     * @tc.name      testExpressionsInstanceTwo0022
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2300
     * @tc.name      testExpressionsInstanceTwo0023
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2400
     * @tc.name      testExpressionsInstanceTwo0024
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2500
     * @tc.name      testExpressionsInstanceTwo0025
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color1.Red)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color1.Red)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2600
     * @tc.name      testExpressionsInstanceTwo0026
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color2.Red)() instanceof Color2
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color2.Red)() instanceof Color2)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2700
     * @tc.name      testExpressionsInstanceTwo0027
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2800
     * @tc.name      testExpressionsInstanceTwo0028
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_2900
     * @tc.name      testExpressionsInstanceTwo0029
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3000
     * @tc.name      testExpressionsInstanceTwo0030
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3100
     * @tc.name      testExpressionsInstanceTwo0031
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3200
     * @tc.name      testExpressionsInstanceTwo0032
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof double
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof double)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3300
     * @tc.name      testExpressionsInstanceTwo0033
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating1.B)() instanceof Rating1
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating1.B)() instanceof Rating1)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3400
     * @tc.name      testExpressionsInstanceTwo0034
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3500
     * @tc.name      testExpressionsInstanceTwo0035
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3600
     * @tc.name      testExpressionsInstanceTwo0036
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3700
     * @tc.name      testExpressionsInstanceTwo0037
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3800
     * @tc.name      testExpressionsInstanceTwo0038
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_3900
     * @tc.name      testExpressionsInstanceTwo0039
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4000
     * @tc.name      testExpressionsInstanceTwo0040
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color3.Red)() instanceof Color3
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color3.Red)() instanceof Color3)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4100
     * @tc.name      testExpressionsInstanceTwo0041
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4200
     * @tc.name      testExpressionsInstanceTwo0042
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4300
     * @tc.name      testExpressionsInstanceTwo0043
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4400
     * @tc.name      testExpressionsInstanceTwo0044
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4500
     * @tc.name      testExpressionsInstanceTwo0045
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4600
     * @tc.name      testExpressionsInstanceTwo0046
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof int)
      expect(v2).assertEqual(0)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4700
     * @tc.name      testExpressionsInstanceTwo0047
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color4.Red)() instanceof Color4
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color4.Red)() instanceof Color4)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4800
     * @tc.name      testExpressionsInstanceTwo0048
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_4900
     * @tc.name      testExpressionsInstanceTwo0049
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5000
     * @tc.name      testExpressionsInstanceTwo0050
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5100
     * @tc.name      testExpressionsInstanceTwo0051
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5200
     * @tc.name      testExpressionsInstanceTwo0052
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5300
     * @tc.name      testExpressionsInstanceTwo0053
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating2.B)() instanceof double
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating2.B)() instanceof double)
      expect(v2).assertEqual(0)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5400
     * @tc.name      testExpressionsInstanceTwo0054
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Rating3.B)() instanceof Rating3
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Rating3.B)() instanceof Rating3)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5500
     * @tc.name      testExpressionsInstanceTwo0055
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5600
     * @tc.name      testExpressionsInstanceTwo0056
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5700
     * @tc.name      testExpressionsInstanceTwo0057
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5800
     * @tc.name      testExpressionsInstanceTwo0058
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_5900
     * @tc.name      testExpressionsInstanceTwo0059
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof string)
      expect(v2).assertEqual(0)
    }); /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6000
     * @tc.name      testExpressionsInstanceTwo0060
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6100
     * @tc.name      testExpressionsInstanceTwo0061
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => Color5.Red)() instanceof Color5
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => Color5.Red)() instanceof Color5)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6200
     * @tc.name      testExpressionsInstanceTwo0062
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6300
     * @tc.name      testExpressionsInstanceTwo0063
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6400
     * @tc.name      testExpressionsInstanceTwo0064
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6500
     * @tc.name      testExpressionsInstanceTwo0065
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6600
     * @tc.name      testExpressionsInstanceTwo0066
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof Array
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof Array)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6700
     * @tc.name      testExpressionsInstanceTwo0067
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a89)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a89)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6800
     * @tc.name      testExpressionsInstanceTwo0068
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a89)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a89)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_6900
     * @tc.name      testExpressionsInstanceTwo0069
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a89)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a89)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7000
     * @tc.name      testExpressionsInstanceTwo0070
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a89)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a89)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7100
     * @tc.name      testExpressionsInstanceTwo0071
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a89)() instanceof Array
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a89)() instanceof Array)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7200
     * @tc.name      testExpressionsInstanceTwo0072
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a90)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a90)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7300
     * @tc.name      testExpressionsInstanceTwo0073
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a90)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a90)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7400
     * @tc.name      testExpressionsInstanceTwo0074
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a90)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a90)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7500
     * @tc.name      testExpressionsInstanceTwo0075
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a90)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a90)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7600
     * @tc.name      testExpressionsInstanceTwo0076
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a90)() instanceof Array
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a90)() instanceof Array)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7700
     * @tc.name      testExpressionsInstanceTwo0077
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7800
     * @tc.name      testExpressionsInstanceTwo0078
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_7900
     * @tc.name      testExpressionsInstanceTwo0079
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8000
     * @tc.name      testExpressionsInstanceTwo0080
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8100
     * @tc.name      testExpressionsInstanceTwo0081
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8200
     * @tc.name      testExpressionsInstanceTwo0082
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a91)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a91)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8300
     * @tc.name      testExpressionsInstanceTwo0083
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a92)() instanceof Array
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a92)() instanceof Array)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8400
     * @tc.name      testExpressionsInstanceTwo0084
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a93)() instanceof Tuple2
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a93)() instanceof Tuple2)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8500
     * @tc.name      testExpressionsInstanceTwo0085
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new A18<string>())() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new A18<string>())() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8600
     * @tc.name      testExpressionsInstanceTwo0086
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new A18<string>())() instanceof A18
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new A18<string>())() instanceof A18)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8700
     * @tc.name      testExpressionsInstanceTwo0087
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8800
     * @tc.name      testExpressionsInstanceTwo0088
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_8900
     * @tc.name      testExpressionsInstanceTwo0089
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_9000
     * @tc.name      testExpressionsInstanceTwo0090
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_9100
     * @tc.name      testExpressionsInstanceTwo0091
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof Function
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof Function)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_9200
     * @tc.name      testExpressionsInstanceTwo0092
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => func1)() instanceof ((p: Any) => never)
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => func1)() instanceof ((p: Any) => never))
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TWO_9300
     * @tc.name      testExpressionsInstanceTwo0093
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceTwo0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a94)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a94)() instanceof Any)
      expect(v2).assertEqual(1)
    });

  });
}
