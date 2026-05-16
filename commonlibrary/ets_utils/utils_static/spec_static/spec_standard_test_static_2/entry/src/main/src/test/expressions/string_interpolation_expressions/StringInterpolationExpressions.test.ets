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

// 合法枚举定义（ArkTS 标准语法）
enum Color {
  Red = 0,
  Blue = 2
}

enum Flags {
  Read = 0,
  Write = 1,
  Full = 1
}
enum Flags1 {
  Read = 'Read',
  Write = 'Write',
  Full = 'Full'
}

// 合法类定义
class AClass {
  static hello: string = "Hello";
  world: string = "World";
}

// 合法接口定义
interface IPerson {
  name?: string;
  id: number;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

const sentence = `This is an example of
a multiline string, contains 4 lines and with an interpolation
which should be enclosed in
backticks`

function getEgg(): string {
  return `${'egg'}`
}

function foo(p: number): number {
  return p + p
}

function boo(p: string): string {
  return p + p
}

const triple: [number, string, boolean] = [1, 'Test', true]

const pair: Record<string, number> = {'key1': 1, 'key2': 2}

export default function StringInterpolationExpressions(): void {
  describe("StringInterpolationExpressions", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0100
     * @tc.name      testStringInterpolationExpressions0001
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pString_1 = 'String'
      let iss_1: string = `Hello ${pString_1}`
      pString_1 = 'String'
      expect('Hello String').assertEqual(iss_1)
      pString_1 = 'World'
      expect('Hello String').assertEqual(iss_1)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0200
     * @tc.name      testStringInterpolationExpressions0002
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exp = "This is an example of\na multiline string, contains 4 lines and with an interpolation\nwhich should be enclosed in\nbackticks"
      expect(exp).assertEqual(sentence)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0300
     * @tc.name      testStringInterpolationExpressions0003
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nsi = `God, a ${`${'red nugget'}`}, a fat ${getEgg()} under a dog`
      let exp = 'God, a red nugget, a fat egg under a dog'
      expect(exp).assertEqual(nsi)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0400
     * @tc.name      testStringInterpolationExpressions0004
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: number = -128
      const b2: number = 0
      const b3: number = 127
      const s1: number = -32768
      const s2: number = 0
      const s3: number = 32767
      const i1: number = -2147483648
      const i2: number = 0
      const i3: number = 2147483647
      const l1: bigint = -9223372036854775808n
      const l2: bigint = 0n
      const l3: bigint = 9223372036854775807n
      const f1: number = 1e-45
      const f2: number = 0.0
      const f3: number = 3.4028235e+38
      const n1: number = 5e-324
      const n2: number = 0.0
      const n3: number = 1.7976931348623157e+308
      const v = `A ${b1} B ${b2} C ${b3} D ${s1} E ${s2} F ${s3} G ${i1} H ${i2} I ${i3} J ${l1} K ${l2} L ${l3} M ${f1} N ${f2} P ${f3} Q ${n1} R ${n2} S ${n3}`
      const expected = 'A -128 B 0 C 127 D -32768 E 0 F 32767 G -2147483648 H 0 I 2147483647 J -9223372036854775808 K 0 L 9223372036854775807 M 1e-45 N 0 P 3.4028235e+38 Q 5e-324 R 0 S 1.7976931348623157e+308'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0500
     * @tc.name      testStringInterpolationExpressions0005
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: number = -128
      const b2: number = 0
      const b3: number = 127
      const s1: number = -32768
      const s2: number = 0
      const s3: number = 32767
      const i1: number = -2147483648
      const i2: number = 0
      const i3: number = 2147483647
      const l1: bigint = -9223372036854775808n
      const l2: bigint = 0n
      const l3: bigint = 9223372036854775807n
      const f1: number = 1e-45
      const f2: number = 0.0
      const f3: number = 3.4028235e+38
      const n1: number = 5e-324
      const n2: number = 0.0
      const n3: number = 1.7976931348623157e+308
      const v = `A ${b1} B ${b2} C ${b3} D ${s1} E ${s2} F ${s3} G ${i1} H ${i2} I ${i3} J ${l1} K ${l2} L ${l3} M ${f1} N ${f2} P ${f3} Q ${n1} R ${n2} S ${n3}`
      const expected = 'A -128 B 0 C 127 D -32768 E 0 F 32767 G -2147483648 H 0 I 2147483647 J -9223372036854775808 K 0 L 9223372036854775807 M 1e-45 N 0 P 3.4028235e+38 Q 5e-324 R 0 S 1.7976931348623157e+308'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0600
     * @tc.name      testStringInterpolationExpressions0006
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: number = -Infinity
      const f2: number = NaN
      const f3: number = Infinity
      const n1: number = -Infinity
      const n2: number = NaN
      const n3: number = Infinity
      const v = `...${f1}...${f2}...${f3}...${n1}...${n2}...${n3}...`
      const expected = '...-Infinity...NaN...Infinity...-Infinity...NaN...Infinity...'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0700
     * @tc.name      testStringInterpolationExpressions0007
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: null = null
      const b: undefined = undefined
      const v = `...${a}...${b}...`
      const expected = '...null...undefined...'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0800
     * @tc.name      testStringInterpolationExpressions0008
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `___${Color.Red}___${Color.Blue}___`
      const expected = '___0___2___'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_0900
     * @tc.name      testStringInterpolationExpressions0009
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `--${'a' + 'b' + 42}--${foo(42) > 0 ? boo('abc') : foo(5)}--${foo(42) < 0 ? boo('abc') : foo(5)}--`
      const expected = '--ab42--abcabc--10--'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1000
     * @tc.name      testStringInterpolationExpressions0010
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `'value' = ${'\u0000' + '0000'}`
      const expected = "'value' = \u00000000"
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1100
     * @tc.name      testStringInterpolationExpressions0011
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `(escaped expression) \${14/2} = ${14/2}`
      const expected = '(escaped expression) ${14/2} = 7'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1200
     * @tc.name      testStringInterpolationExpressions0012
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `(slash at curly braces) $\{true || false\}`
      const expected = '(slash at curly braces) ${true || false}'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1300
     * @tc.name      testStringInterpolationExpressions0013
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `nested ${`backtick = \``}`
      const expected = 'nested backtick = `'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1400
     * @tc.name      testStringInterpolationExpressions0014
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = 'c`${2+2}`'
      const v = `nested ${"a" + `b${c}d` + "e"}`
      const expected = 'nested abc`${2+2}`de'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1500
     * @tc.name      testStringInterpolationExpressions0015
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `func${((p: number): number => { return p * p })(3)}`
      const expected = 'func9'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1600
     * @tc.name      testStringInterpolationExpressions0016
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'Hello'
      let b = 'World'
      const v = `$ { a }, $ { b } !`
      const expected = '$ { a }, $ { b } !'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1700
     * @tc.name      testStringInterpolationExpressions0017
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'Hello'
      let b = 'World'
      const v = `${a   }, ${  b} !`
      const expected = 'Hello, World !'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1800
     * @tc.name      testStringInterpolationExpressions0018
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iss = "Hello, String!"
      const v = iss
      const expected = 'Hello, String!'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_1900
     * @tc.name      testStringInterpolationExpressions0019
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: AClass = new AClass()
      const v = `${AClass.hello}, ${a.world}!`
      const expected = 'Hello, World!'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2000
     * @tc.name      testStringInterpolationExpressions0020
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IPerson = {name: 'Bob', id: 25}
      const v = `Hello ${a.name}, ${a.id}!`
      const expected = 'Hello Bob, 25!'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2100
     * @tc.name      testStringInterpolationExpressions0021
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IPerson = {name: 'Bob', id: 25}
      let name: string = ''
      let id: number = 0
      const v = `Hello ${name = a.name!}, ${id = a.id}!`
      const expected = 'Hello Bob, 25!'
      expect(v).assertEqual(expected)
      expect(name).assertEqual('Bob')
      expect(id).assertEqual(25)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2200
     * @tc.name      testStringInterpolationExpressions0022
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IPerson = {id: 25}
      let name: string | undefined = 'Bob'
      let id: number = 0
      const v = `Hello ${name = a.name}, ${id = a.id}!`
      const expected = 'Hello undefined, 25!'
      expect(v).assertEqual(expected)
      expect(name).assertEqual(undefined)
      expect(id).assertEqual(25)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2300
     * @tc.name      testStringInterpolationExpressions0023
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IPerson = {id: 25}
      let name: string | undefined = 'Bob'
      let id: number = 0
      const v = `Hello ${name = (a.name == undefined ? 'Mary' : a.name)}, ${id = a.id}!`
      const expected = 'Hello Mary, 25!'
      expect(v).assertEqual(expected)
      expect(name).assertEqual('Mary')
      expect(id).assertEqual(25)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2400
     * @tc.name      testStringInterpolationExpressions0024
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IPerson = {id: 25}
      let id: number = 0
      const v = `Hello ${a.name ?? 'Jane'}, ${id = a.id}!`
      const expected = 'Hello Jane, 25!'
      expect(v).assertEqual(expected)
      expect(id).assertEqual(25)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2500
     * @tc.name      testStringInterpolationExpressions0025
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `___${Flags.Read}___${Flags.Write}___${Flags.Full}`
      const expected = '___0___1___1'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2600
     * @tc.name      testStringInterpolationExpressions0026
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `___${Flags1.Read}___${Flags1.Write}___${Flags1.Full}`
      const expected = '___Read___Write___Full'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2700
     * @tc.name      testStringInterpolationExpressions0027
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `___${triple[0]}___${triple[1]}___${triple[2]}`
      const expected = '___1___Test___true'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2800
     * @tc.name      testStringInterpolationExpressions0028
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `___${pair['key1']}___${pair['key2']}`
      const expected = '___1___2'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_2900
     * @tc.name      testStringInterpolationExpressions0029
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [1,2,3,4,5]
      const v: string = `Hello ${values}`
      const expected = 'Hello 1,2,3,4,5'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_3000
     * @tc.name      testStringInterpolationExpressions0030
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [1,2,3,4,5]
      const v: string = `Hello ${[...values]}`
      const expected = 'Hello 1,2,3,4,5'
      expect(v).assertEqual(expected)
    })

    /**
     * @tc.number    SUB_STRING_INTERPOLATION_EXPRESSIONS_3100
     * @tc.name      testStringInterpolationExpressions0031
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringInterpolationExpressions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = `...${null}...${undefined}...`
      const expected = '...null...undefined...'
      expect(v).assertEqual(expected)
    })
  })
}