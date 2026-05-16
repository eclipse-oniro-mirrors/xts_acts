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
} from '../../../../hypium/index';

class Err extends Error {}
class Er extends Error {}
class Er2 extends Er {}
class ZeroDivisor extends Error {}
function divide(a: number, b: number): number {
  if (b == 0) throw new ZeroDivisor();
  return a / b;
}
function processNumbers(a: number, b: number): number {
  try {
    let res = divide(a, b);
    return res;
  } catch (e) {
    return e instanceof ZeroDivisor ? -1 : 0;
  }
}
let pd: int = 0;
function f(i: int): void {
  switch (i) {
    case 0: { expect(i).assertEqual(0); break; }
    case 1: { expect(i).assertEqual(1); break; }
    default: { pd++; break; }
    case 2: { last++; break; }
  }
}
let def: int = 0;
let last: int = 0;
function f1(i: int): void {
  switch (i) {
    case 1: {  }
    default: { def++;  }
    case 2: { last++;  }
    case 3: { last++;  }
  }
}

function f3(i: int): int {
  switch (i) {
    case 0: i++;
    case 1: i++;
    default: i++;
  }
  return i;
}
let sr: int = -1;
function f4(i: int): void {
  switch (i) {
    case 0:
    case 1:
    case 2:
    default: sr = 42;
  }
}
const f5: string = 'AbyrvalG';
let result = 'miss';
function sint() {
  switch(`abc${f5}cba`) {
    case 'abc': break;
    case '123': break;
    case `abc${f5}cba`: result = 'hit';
  }
}
function switchMe(test: String): String {
  switch(test) {
    case 'Hello': return 'First';
    case 'World': return 'Second';
    default: return 'Sad';
  }
}
let res = "";
function ct(): boolean {
  res += "T";
  return true;
}
function retcode(s: string): int {
  if (res == s) {
    return 0;
  } else {
    return 1;
  }
}
function foo(i: number, j: number): number {
  if (ct())
    return retcode("T");
  else
    return i;
}
function foo1(i: number, j: number): number {
  if (((ct() && ct() && ct())))
    return retcode("TTT");
  else
    return i;
}
function cf(): boolean {
  res += "F";
  return false;
}
function foo2(i: number, j: number): number {
  if (cf())
    return i;
  else
    if (cf())
      return j;
  else
    if (cf())
      return i;
  else
    if (cf())
      return j;
  else
    return retcode("FFFF");
}
function foo3(i: number, j: number): number {
  if (ct())
    return retcode("T");
  else
  {}
  return 1;
}
function foo4(i: number, j: number): number {
  if (cf())
    return i;
  else {
    if (cf())
      return j;
    else
      return retcode("FF")
  }
}
function foo5(i: number, j: number): number {
  if (i) return 0;
  else return j;
}
function foo6(i: number, j: number): number {
  if (new Object()) return 0;
  else return j;
}
function foo7(i: number, j: number): number {
  if ("xyz") return 0;
  else return j;
}
function foo8(i: number, j: number): number {
  if (!"") return 0;
  else return j;
}
function foo9(i: number, j: number): number {
  if (!null) return 0;
  else return j;
}
function foo10(i: number, j: number): number {
  if ([1, 1]) return 0;
  else return j;
}
function foo11(i: number, j: number): number {
  let k: int[] = [];
  if (k) return 0;
  else return j;
}
function foo12(i: number, j: number): number {
  if (cf())
  {}
  else
    return retcode("F");
  return 1;
}
function foo13(i: number, j: number): number {
  if (cf())
    ;
  else
    return retcode("F");
  return 1;
}
function foo14(i: number, j: number): number {
  if (cf())
  {}
  else
    ;
  return 0;
}
function foo15(i: number, j: number): number {
  if (cf())
    if (ct())
      return j;
    else
      return i;
  else
    return retcode("F");
}
function foo16(i: number, j: number): number {
  if (cf() && ct()) {
    if (ct())
      return i;
  }
  else
    if (ct())
      return retcode("FT");
  else
    return j;
  return 1;
}
function foo17(i: number, j: number): number {
  if (cf() || ct())
    if (ct())
      return retcode("FTT");
    else
      return i;
  return j;
}
function foo18(i: number, j: number): number {
  if (cf()) {
    if (ct())
      return i;
  }
  else
    return retcode("F")
  return i;
}
function foo19(i: number, j: number): number {
  if (ct())
    if (ct())
      if (ct())
        if (ct())
          if (cf())
            return i;
          else
            return retcode("TTTTF");
        else
          return j;
      else
        return i;
    else
      return i;
  else
    return j;
}
function foo20(i: int): int {
  return ++i;
}
class A {
  foo20(i: int): int {
    return ++i;
  }
}

class A1 {
  i: int;
  constructor() {
    this.i = this.i + 1;
  }
}

class A2 {
  data: string[] = ['a', 'b', 'c'];
  $_iterator() {
    return new CIterator(this);
  }
}
class CIterator implements Iterator<string> {
  index = 0;
  base: A2;
  constructor (base: A2) {
    this.base = base;
  }
  next(): IteratorResult<string> {
    return new IteratorResult<string>(this.index >= this.base.data.length,
      this.index >= this.base.data.length ? undefined : this.base.data[this.index++]);
  }
}
function foo21<T extends String>(s: T): T[] {
  return [s, s, s];
}
let t1 = 1, t2 = 2;
let ret: int;
function foo22(): int {
  try {
    if (t1 != t2) throw new Er();
    ret += 1;
  } finally {
    ret += 100;
  }
  return ret;
}
function foo23(): int {
  try {
    if (t1 != t2) throw new Er2();
    ret += 1;
  } catch (e) {
    ret += 10;
  } finally {
    ret += 1000;
  }
  return ret;
}
function foo24(): int {
  try {
    if (t1 != t2) throw new Er2();
    ret += 1;
  } catch (e) {
    ret += 10;
    throw e as Error;
  } finally {
    ret += 1000;
  }
  return ret;
}
function foo25(): int {
  let er: Error|null = null;
  try {
    if (t1 != t2) throw new Er();
    ret += 1;
  } catch (e) {
    ret += 10;
    er = e as Error;
  } finally {
    ret += 1000;
    throw er! as Error;
  }
}
function foo26(e: Er, cnt: int): Er {
  if (cnt > 0) throw foo26(e, --cnt);
  return e;
}

interface I {}
class ErImpl extends Er implements I {}
type UT = string[] | string;

type RT = Record<number, string>;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function StatementsTest() {

  describe("StatementsTest", () => {
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
     * @tc.number    SUB_STATEMENTS_0100
     * @tc.name      testStatements0001
     * @tc.desc      Local declaration in statement (const)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: int = 0;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0200
     * @tc.name      testStatements0002
     * @tc.desc      Local declaration in statement (var)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0300
     * @tc.name      testStatements0003
     * @tc.desc      If statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      if (i > 0) {
        i--;
      }
      expect(i).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0400
     * @tc.name      testStatements0004
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0500
     * @tc.name      testStatements0005
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo1(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0600
     * @tc.name      testStatements0006
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo2(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0700
     * @tc.name      testStatements0007
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo3(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0800
     * @tc.name      testStatements0008
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo4(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_0900
     * @tc.name      testStatements0009
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo5(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1000
     * @tc.name      testStatements0010
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo6(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1100
     * @tc.name      testStatements0011
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo7(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1200
     * @tc.name      testStatements0012
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo8(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1300
     * @tc.name      testStatements0013
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo9(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1400
     * @tc.name      testStatements0014
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo10(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1500
     * @tc.name      testStatements0015
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      expect(foo11(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1600
     * @tc.name      testStatements0016
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo12(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1700
     * @tc.name      testStatements0017
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo13(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1800
     * @tc.name      testStatements0018
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo14(i, j)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_1900
     * @tc.name      testStatements0019
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo15(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2000
     * @tc.name      testStatements0020
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo16(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2100
     * @tc.name      testStatements0021
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo17(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2200
     * @tc.name      testStatements0022
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo18(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2300
     * @tc.name      testStatements0023
     * @tc.desc      An if statement can be conditionally executed, or one of the two two statements can be selected conditionally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 1;
      let j = 1;
      expect(foo19(i, j)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2400
     * @tc.name      testStatements0024
     * @tc.desc      If thenStatement or elseStatement is any kind of a statement but not a block, then no block scope is created for such a statement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if (true) let x: number = 1;
      x = 2;
      if (true) {
        let x: number = 10;
        let y: number = x;
      }
      else {
        let x: number = 20;
      }
      expect(x).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2500
     * @tc.name      testStatements0025
     * @tc.desc      If thenStatement or elseStatement is any kind of a statement but not a block, then no block scope is created for such a statement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if (false) let x: number = 1;
      x = 2;
      if (false) {
        let x: number = 10;
        let y: number = x;
      }
      else {
        let x: number = 20;
      }
      expect(x).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2600
     * @tc.name      testStatements0026
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do i++; while (i < 10);
      expect(i).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2700
     * @tc.name      testStatements0027
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      let res = "";
      do res += "L"; while ((i += 2) < 7);
      expect(res).assertEqual("LLL");
    });

    /**
     * @tc.number    SUB_STATEMENTS_2800
     * @tc.name      testStatements0028
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do {} while (++i < 10);
      expect(i).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_2900
     * @tc.name      testStatements0029
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do do do i += 1; while (i < 3) while (i < 5) while (i < 7);
      expect(i).assertEqual(7);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3000
     * @tc.name      testStatements0030
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do { while (i < 7) i += 1 } while (i < 5);
      expect(i).assertEqual(7);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3100
     * @tc.name      testStatements0031
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do {
        let i: int = j;
        j = i * 2;
        i = j;
      } while (j < 3);
      expect(i).assertEqual(1);
      expect(j).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3200
     * @tc.name      testStatements0032
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do {i--} while (i+j);
      expect(i).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3300
     * @tc.name      testStatements0033
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      do {i--} while (i & j);
      expect(i).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3400
     * @tc.name      testStatements0034
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (i < 10) i++;
      expect(i).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3500
     * @tc.name      testStatements0035
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      let res = "";
      while ((i += 2) < 7) res += "L";
      expect(res).assertEqual("LL");
    });

    /**
     * @tc.number    SUB_STATEMENTS_3600
     * @tc.name      testStatements0036
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (++i < 10) {};
      expect(i).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3700
     * @tc.name      testStatements0037
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (++i < 7) while (++i < 5) while (++i < 3) j = i;
      expect(j).assertEqual(1);
      expect(i).assertEqual(8);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3800
     * @tc.name      testStatements0038
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (i < 7) do j = ++i; while (i < 5);
      expect(j).assertEqual(7);
    });

    /**
     * @tc.number    SUB_STATEMENTS_3900
     * @tc.name      testStatements0039
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while(++i < 10); { i-- }
      expect(i).assertEqual(9);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4000
     * @tc.name      testStatements0040
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (i+j) { i-- }
      expect(i).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4100
     * @tc.name      testStatements0041
     * @tc.desc      While statements and do statements execute an expression and a statement repeatedly while the expression value is true. The key difference is that whileStatement evaluates and checks expression first while doStatement executes statement first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 1;
      let j = 1;
      while (i & j) {i--}
      expect(i).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4200
     * @tc.name      testStatements0042
     * @tc.desc      For loop without any statement configured, no spaces ()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = 0;
      for (;;) {
        if( m++ > 1) break;
      }
      expect(m).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4300
     * @tc.name      testStatements0043
     * @tc.desc      For loop without any statement configured, spase as delimiter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = 0;
      for ( ; ; ) {
        if( m++ > 1) break;
      }
      expect(m).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4400
     * @tc.name      testStatements0044
     * @tc.desc      For loop with multiple forUpdate options configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for(let i = 0, j = 0; j<5; i++, i--, j++) {
        sum += i + j;
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4500
     * @tc.name      testStatements0045
     * @tc.desc      For loop with complicated expression option configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: Object|null = new Object();
      let o1: Object|null = null;
      let i = 0;
      for(; ( (o1 ?? o) && i<5); i++ ) { }
      expect(i).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4600
     * @tc.name      testStatements0046
     * @tc.desc      For loop with complicated forUpdate option configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c:string = '';
      for(let a = 0, b: string = 'string'; a < 10; a++, b += String.fromCharCode(a + 40) ) {
        c = b;
      }
      expect(c).assertEqual("string)*+,-./01");
    });

    /**
     * @tc.number    SUB_STATEMENTS_4700
     * @tc.name      testStatements0047
     * @tc.desc      For loop with complicated forUpdate option configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int;
      for(a  =0 ; a<10 ; a=foo20(a) ) {
        if(a >= 0) continue;
        expect(true).assertFalse();
      }
      expect(a).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4800
     * @tc.name      testStatements0048
     * @tc.desc      For loop with complicated forUpdate option configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int;
      for(a = 0 ; a<10 ; a = new A().foo20(a) ) {
        continue;
      }
      expect(a).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_4900
     * @tc.name      testStatements0049
     * @tc.desc      For loop with number type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:number;
      for(let i: number = 0 ; i<10 ; i += 1.01 ) {
        a = i;
      }
      expect(a).assertEqual(9.09);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5000
     * @tc.name      testStatements0050
     * @tc.desc      For loop with float type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:float;
      for(let i: float = 0 ; i<10 ; i += 1.01 ) {
        a = i;
      }
      expect(a).assertLarger(9);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5100
     * @tc.name      testStatements0051
     * @tc.desc      For loop with double type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:double;
      for(let i: double = 0 ; i<10 ; i += 1.01 ) {
        a = i;
      }
      expect(a).assertEqual(9.09);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5200
     * @tc.name      testStatements0052
     * @tc.desc      For loop with Int type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:Int = 0;
      for(let i: Int = 0 ; i<10 ; i += 1 ) {
        a = i;
      }
      expect(a).assertEqual(9);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5300
     * @tc.name      testStatements0053
     * @tc.desc      For loop with Number type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:Number = 0;
      for(let i: Number = 0 ; i<10 ; i += 1.01 ) {
        a = i;
      }
      expect(a).assertEqual(9.09);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5400
     * @tc.name      testStatements0054
     * @tc.desc      For loop with init as the only configured statement. Creating variable with already existing name during the for loop initialization.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = "string";
      for (let m = 1;;) {
        if(m == 1) break;
      }
      expect(m).assertEqual("string");
    });

    /**
     * @tc.number    SUB_STATEMENTS_5500
     * @tc.name      testStatements0055
     * @tc.desc      For loop with Double type in init.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:Double = 0.0;
      for(let i: Double = 0 ; i<10 ; i += 1.01 ) {
        a = i;
      }
      expect(a).assertEqual(9.09);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5600
     * @tc.name      testStatements0056
     * @tc.desc      For loop with expression as the only configured statement. Creating variable with already existing name at the for loop body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = "string";
      for (; 1;) {
        let m = 1;
        if(m == 1) break;
      }
      expect(m).assertEqual("string");
    });

    /**
     * @tc.number    SUB_STATEMENTS_5700
     * @tc.name      testStatements0057
     * @tc.desc      For loop with forUpdate as the only configured statement. Variable was created outside of the loop body and gets changed as forUpdate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m : int;
      for (;; m++) {
        if(m > 1) break;
      }
      expect(m).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5800
     * @tc.name      testStatements0058
     * @tc.desc      For loop with init and conditional statements configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: int = 0;
      for (let i = 0; i < 10;) {
        m += ++i;
      }
      expect(m).assertEqual(55);
    });

    /**
     * @tc.number    SUB_STATEMENTS_5900
     * @tc.name      testStatements0059
     * @tc.desc      For loop with init and forUpdate statements configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: int = 0;
      for (let i = 0;;i++) {
        m = i;
        if(i > 10) break;
      }
      expect(m).assertEqual(11);
    });

    /**
     * @tc.number    SUB_STATEMENTS_6000
     * @tc.name      testStatements0060
     * @tc.desc      For loop with condition and forUpdate statements configured. Verify 'continue' statement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: int = 10;
      for (; m > 0; m--) {
        if(1) continue;
        expect(true).assertFalse();
      }
      expect(m).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_6100
     * @tc.name      testStatements0061
     * @tc.desc      For loop with all parameters configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for (let i: int = 1; i < 4; i++) {
        sum += i;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number    SUB_STATEMENTS_6200
     * @tc.name      testStatements0062
     * @tc.desc      For loop with multiple init options configured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 1;
      for(let i = 0, j = 0; i<5; i++) {
        sum += i + j;
        j--;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_6300
     * @tc.name      testStatements0063
     * @tc.desc      Multiple nested for loops
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      for(let i=0; i<1; i++ ) {
        for(let i=0; i<1; i++) {
          for(let i=0; i<1; i++) {
            for(let i=0; i<1; i++) {
              for(let i=0; i<1; i++) {
                a++;
              }
              a++;
            }
            a++;
          }
          a++;
        }
        a++;
      }
      expect(a).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STATEMENTS_6400
     * @tc.name      testStatements0064
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: int[] = new int[0](0);
      for (let v of arr) res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_6500
     * @tc.name      testStatements0065
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: int[]|null = new int[0](0);
      for (let v of arr) res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_6600
     * @tc.name      testStatements0066
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let v: number;
      for (v of [1.1, 2.2, 3.3, 4.4]) res += v;
      expect(res).assertEqual("1.12.23.34.4");
    });

    /**
     * @tc.number    SUB_STATEMENTS_6700
     * @tc.name      testStatements0067
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      for (const ch of [c'1', c'2', c'3', c'4']) res += ch;
      expect(res).assertEqual("1234");
    });

    /**
     * @tc.number    SUB_STATEMENTS_6800
     * @tc.name      testStatements0068
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let ch: string;
      for (ch of "ABCD") res += ch;
      expect(res).assertEqual("ABCD");
    });

    /**
     * @tc.number    SUB_STATEMENTS_6900
     * @tc.name      testStatements0069
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let ch: string;
      for (ch of "ABCD") {
        res += ch;
        ch = ' ';
        res += ch;
      }
      expect(res).assertEqual("A B C D ");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7000
     * @tc.name      testStatements0070
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: Long[] = new Long[3](0);
      for (let i: int = 0; i < 3; i++) arr[i] = new Long(i.toLong());
      for (let i of arr) res += i;
      expect(res).assertEqual("012");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7100
     * @tc.name      testStatements0071
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: int[] = [1,2,3];
      let v = 4;
      for (v of arr); res += v;
      expect(res).assertEqual("3");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7200
     * @tc.name      testStatements0072
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      for (let v of foo21<String>("A")) res += v;
      expect(res).assertEqual("AAA");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7300
     * @tc.name      testStatements0073
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: String|null = "";
      for (let v of s) res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7400
     * @tc.name      testStatements0074
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: int[]|null = (): int[]|null => { return new int[0](0); }();
      for (let v of arr!) res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7500
     * @tc.name      testStatements0075
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: String|null = (): string|null => { return ""; }();
      for (let v of s!) res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_7600
     * @tc.name      testStatements0076
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: string|null = (): string|null => { return null; }();
      let expectedException = "NullPointerError";
      try {
        for (let v of s!) {
          res += v;
        }
        expect(true).assertFalse();
      } catch (error) {
        expect(error.toString()).assertEqual(expectedException);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_7700
     * @tc.name      testStatements0077
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: string|undefined = (): string|undefined => { return undefined; }();
      let expectedException = "NullPointerError";
      try {
        for (let v of s!) {
          res += v;
        }
        expect(true).assertFalse();
      } catch (error) {
        expect(error.toString()).assertEqual(expectedException);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_7800
     * @tc.name      testStatements0078
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let i = 0;
      i = 0;
      let array: A1[] = new A1[10](new A1());
      let c = 0;
      for (let x of array) c += x.i;
      expect(c).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_7900
     * @tc.name      testStatements0079
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: number[]|null = (): number[]|null => { return null; }();
      let expectedException = "NullPointerError";
      try {
        for (let v of s!) {
          res += v;
        }
        expect(true).assertFalse();
      } catch (error) {
        expect(error.toString()).assertEqual(expectedException);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_8000
     * @tc.name      testStatements0080
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let s: number[]|undefined = (): number[]|undefined => { return undefined; }();
      let expectedException = "NullPointerError";
      try {
        for (let v of s!) {
          res += v;
        }
        expect(true).assertFalse();
      } catch (error) {
        expect(error.toString()).assertEqual(expectedException);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_8100
     * @tc.name      testStatements0081
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let a = new A2();
      for (let x of a) res += x;
      expect(res).assertEqual("abc");
    });

    /**
     * @tc.number    SUB_STATEMENTS_8200
     * @tc.name      testStatements0082
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let ua: UT[] = [['abc', 'def'] as string[], 'ghi'];
      for (let x of ua) {
        for (let y of x) {
          res += y;
        }
      }
      expect(res).assertEqual('abcdefghi');
    });

    /**
     * @tc.number    SUB_STATEMENTS_8300
     * @tc.name      testStatements0083
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let sentence: String = '';
      let ua: RT = {1: 'Once', 2: 'Upon', 3: 'A', 4: 'Time'};
      for (let x of ua) {
        sentence += (x[1] + ' ');
      }
      expect(sentence).assertEqual('Once Upon A Time ');
    });

    /**
     * @tc.number    SUB_STATEMENTS_8400
     * @tc.name      testStatements0084
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let xa: readonly number [] = [1, 2, 3];
      let sum = 0;
      for (let x of xa) {
        sum += x;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number    SUB_STATEMENTS_8500
     * @tc.name      testStatements0085
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      for (let v of "") res += v;
      expect(res).assertEqual("");
    });

    /**
     * @tc.number    SUB_STATEMENTS_8600
     * @tc.name      testStatements0086
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      const nums: FixedArray<number> = [1, 2, 3, 4, 5];
      let sum = 0;
      for (let x of nums) {
        sum += x;
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number    SUB_STATEMENTS_8700
     * @tc.name      testStatements0087
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      const raa: ReadonlyArray<string> = ['a', 'b', 'c'];
      let sum = 0;
      for (let x of raa) {
        res += x;
      }
      expect(res).assertEqual('abc');
    });

    /**
     * @tc.number    SUB_STATEMENTS_8800
     * @tc.name      testStatements0088
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let arr: int[][] = [[1,2,3], [4,5,6], [7,8,9]];
      for (const v of arr) {
        res += ' ';
        for (const q of v)
          res += q;
      }
      expect(res).assertEqual(" 123 456 789");
    });

    /**
     * @tc.number    SUB_STATEMENTS_8900
     * @tc.name      testStatements0089
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      const v: int = 0;
      for (let v of [1,2,3,4]) res += v;
      expect(res).assertEqual("1234");
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9000
     * @tc.name      testStatements0090
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let v: int;
      for (v of [1,2,3,4]) res += v;
      expect(res).assertEqual("1234");
    });

    /**
     * @tc.number    SUB_STATEMENTS_9100
     * @tc.name      testStatements0091
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let v: Float;
      for (v of [1.1f,2.2f,3.3f,4.4f]) res += v;
      expect(res).assertEqual("1.12.23.34.4");
    });

    /**
     * @tc.number    SUB_STATEMENTS_9200
     * @tc.name      testStatements0092
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let v: double;
      for (v of [1.1,2.2,3.3,4.4]) res += v;
      expect(res).assertEqual("1.12.23.34.4");
    });

    /**
     * @tc.number    SUB_STATEMENTS_9300
     * @tc.name      testStatements0093
     * @tc.desc      In a 'for-of' statement type 'expr' must be either array or string, or an instance of iterable class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = "";
      let v: long;
      for (v of [1,2,3,4]) res += v;
      expect(res).assertEqual("1234");
    });

    /**
     * @tc.number    SUB_STATEMENTS_9400
     * @tc.name      testStatements0094
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 2;
      while (i > 0) {
        break;
      }
      expect(i).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9500
     * @tc.name      testStatements0095
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 2;
      for (;;) {
        break;
      }
      expect(i).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9600
     * @tc.name      testStatements0096
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flowCounter: int = 0;
      outer: do {
        do {
          break;
        } while(true);
        flowCounter++;
        do {
          break;
        } while(true);
        flowCounter++;
        break outer;
      } while(true);
      expect(flowCounter).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9700
     * @tc.name      testStatements0097
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 0;
      for (let ch of "string") {
        i++;
        break;
      }
      expect(i).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9800
     * @tc.name      testStatements0098
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 2;
      for (;;) {
        if (true) { break; }
      }
      expect(i).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_9900
     * @tc.name      testStatements0099
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 2;
      while (i > 0) {
        break;
        i--;
      }
      expect(i).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10000
     * @tc.name      testStatements0100
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flowCounter: int = 0;
      outer: do {
        do {
          break;
        } while(true);
        flowCounter++;
        do {
          break outer;
        } while(true);
        flowCounter++;
        break outer;
      } while(true);
      expect(flowCounter).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10100
     * @tc.name      testStatements0101
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flowCounter: int = 0;
      outer: do {
        do {
          break;
        } while(true);
        flowCounter++;
        do {
          break;
        } while(true);
        flowCounter++;
        break outer;
      } while(true);
      expect(flowCounter).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10200
     * @tc.name      testStatements0102
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 0;
      for (let ch of "string") {
        i++;
        if(ch == 'i' ) break;
      }
      expect(i).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10300
     * @tc.name      testStatements0103
     * @tc.desc      Break statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flowCounter: int = 0;
      outer: do {
        do {
          break;
        } while(true);
        flowCounter++;
        do {
          break outer;
        } while(true);
        flowCounter++;
        break outer;
      } while(true);
      expect(flowCounter).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10400
     * @tc.name      testStatements0104
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let y: int = 0; y < 10; y++) {
        let x = 0;
        while (x++ < 10) {
          let z = 0;
          do {
            if (z % 2 == 0) {
              continue;
            }
            sum += z;
          } while (z++ < 10);
          if (x % 2 == 0) {
            continue;
          }
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(2500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10500
     * @tc.name      testStatements0105
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
      for (let y of arr) {
        loop2: for (let x = 0; x < 20; x++) {
          let z = 0;
          do {
            let t = 100;
            while (t++ < 200) {
              if (t % 3 == 0) {
                continue;
              }
              sum += t;
            }
            if (z % 2 == 0) {
              continue loop2;
            }
          } while (z++ < 10);
          if (x % 2 == 0) {
            continue;
          }
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(2222000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10600
     * @tc.name      testStatements0106
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let x = 0;
      do {
        if (x % 2 == 0) {
          continue;
        }
        sum += x;
      } while (x++ < 100);
      expect(sum).assertEqual(2500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10700
     * @tc.name      testStatements0107
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y = 0;
      do {
        let x = 0;
        do {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        } while (x++ < 100);
      } while (y++ < 3);
      expect(sum).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10800
     * @tc.name      testStatements0108
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      do {
        let x = 0;
        loop2: do {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        } while (x++ < 100);
      } while (y++ < 3);
      expect(sum).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_10900
     * @tc.name      testStatements0109
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      do {
        let x = 0;
        do {
          sum += x;
        } while (x++ < 100);
        if (y % 2 == 0) {
          continue;
        }
      } while (y++ < 100);
      expect(sum).assertEqual(510050);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11000
     * @tc.name      testStatements0110
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: do {
        let x = 0;
        do {
          sum += x;
        } while (x++ < 100);
        if (y % 2 == 0) {
          continue loop1;
        }
      } while (y++ < 100);
      expect(sum).assertEqual(510050);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11100
     * @tc.name      testStatements0111
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      do {
        let x = 0;
        do {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        } while (x++ < 100);
        if (y % 2 == 0) {
          continue;
        }
      } while (y++ < 100);
      expect(sum).assertEqual(252500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11200
     * @tc.name      testStatements0112
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: do {
        let x = 0;
        loop2: do {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        } while (x++ < 100);
        if (y % 2 == 0) {
          continue loop1;
        }
      } while (y++ < 100);
      expect(sum).assertEqual(252500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11300
     * @tc.name      testStatements0113
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: do {
        let x = 0;
        loop2: do {
          if (x == 10) {
            continue loop1;
          }
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        } while (x++ < 100);
      } while (y++ < 3);
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11400
     * @tc.name      testStatements0114
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let x: int = 0; x < 100; x++) {
        if (x % 2 == 0) {
          continue;
        }
        sum += x;
      }
      expect(sum).assertEqual(2500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11500
     * @tc.name      testStatements0115
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let y: int = 0; y < 3; y++) {
        for (let x: int = 0; x < 100; x++) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(7500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11600
     * @tc.name      testStatements0116
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let y: int = 0; y < 3; y++) {
        loop2: for (let x: int = 0; x < 100; x++) {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(7500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11700
     * @tc.name      testStatements0117
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let y: int = 0; y < 100; y++) {
        for (let x: int = 0; x < 100; x++) {
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(495000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11800
     * @tc.name      testStatements0118
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      loop1: for (let y: int = 0; y < 100; y++) {
        for (let x: int = 0; x < 100; x++) {
          sum += x;
        }
        if (y % 2 == 0) {
          continue loop1;
        }
      }
      expect(sum).assertEqual(495000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_11900
     * @tc.name      testStatements0119
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      for (let y: int = 0; y < 100; y++) {
        for (let x: int = 0; x < 100; x++) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(250000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12000
     * @tc.name      testStatements0120
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      loop1: for (let y: int = 0; y < 100; y++) {
        loop2: for (let x: int = 0; x < 100; x++) {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
        if (y % 2 == 0) {
          continue loop1;
        }
      }
      expect(sum).assertEqual(250000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12100
     * @tc.name      testStatements0121
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      loop1: for (let y: int = 0; y < 3; y++) {
        loop2: for (let x: int = 0; x < 100; x++) {
          if (x == 10) {
            continue loop1;
          }
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(75);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12200
     * @tc.name      testStatements0122
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (let x of arr) {
        if (x % 2 == 0) {
          continue;
        }
        sum += x;
      }
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12300
     * @tc.name      testStatements0123
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let arr1: int[] = [0, 1, 2];
      let arr2: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (let y of arr1) {
        for (let x of arr2) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(75);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12400
     * @tc.name      testStatements0124
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let arr1: int[] = [0, 1, 2];
      let arr2: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (let y of arr1) {
        for (let x of arr2) {
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(135);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12500
     * @tc.name      testStatements0125
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let arr1: int[] = [0, 1, 2, 3, 4];
      let arr2: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (let y of arr1) {
        for (let x of arr2) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(125);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12600
     * @tc.name      testStatements0126
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      let x = 0;
      while (x++ < 100) {
        if (x % 2 == 0) {
          continue;
        }
        sum += x;
      }
      expect(sum).assertEqual(2500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12700
     * @tc.name      testStatements0127
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y = 0;
      while (y++ < 3) {
        let x = 0;
        while (x++ < 100) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(7500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12800
     * @tc.name      testStatements0128
     * @tc.desc      Continue statement (inside while statement)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 0;
      let j: int = 0;
      while (i < 20) {
        i++;
        if (i > 10) continue;
        j++;
      }
      expect(i).assertEqual(20);
      expect(j).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STATEMENTS_12900
     * @tc.name      testStatements0129
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      while (y++ < 3) {
        let x = 0;
        loop2: while (x++ < 100) {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(7500);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13000
     * @tc.name      testStatements0130
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      while (y++ < 100) {
        let x = 0;
        while (x++ < 100) {
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(505000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13100
     * @tc.name      testStatements0131
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: while (y++ < 100) {
        let x = 0;
        while (x++ < 100) {
          sum += x;
        }
        if (y % 2 == 0) {
          continue loop1;
        }
      }
      expect(sum).assertEqual(505000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13200
     * @tc.name      testStatements0132
     * @tc.desc      A continue statement stops execution of the current loop iteration and passes control to the next iteration with proper check of the loop exit condition depending on the loop kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      while (y++ < 100) {
        let x = 0;
        while (x++ < 100) {
          if (x % 2 == 0) {
            continue;
          }
          sum += x;
        }
        if (y % 2 == 0) {
          continue;
        }
      }
      expect(sum).assertEqual(250000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13300
     * @tc.name      testStatements0133
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: while (y++ < 100) {
        let x = 0;
        loop2: while (x++ < 100) {
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
        if (y % 2 == 0) {
          continue loop1;
        }
      }
      expect(sum).assertEqual(250000);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13400
     * @tc.name      testStatements0134
     * @tc.desc      A continue statement with label identifier transfers control out of the enclosing loop statement which has the same label identifier. Such statement must be in the body of the surrounding function or method otherwise compile-time error is raised by the compiler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0, y: int = 0;
      loop1: while (y++ < 3) {
        let x = 0;
        loop2: while (x++ < 100) {
          if (x == 10) {
            continue loop1;
          }
          if (x % 2 == 0) {
            continue loop2;
          }
          sum += x;
        }
      }
      expect(sum).assertEqual(75);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13500
     * @tc.name      testStatements0135
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last = 0;
      pd = 0;
      f(5);
      expect(pd).assertEqual(1);
      expect(last).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13600
     * @tc.name      testStatements0136
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last: int = 0;
      pd = 0;
      last = 0;
      f(2);
      expect(pd).assertEqual(0);
      expect(last).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13700
     * @tc.name      testStatements0137
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      def = 0;
      last = 0;
      f1(5);
      expect(def).assertEqual(1);
      expect(last).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_13800
     * @tc.name      testStatements0138
     * @tc.desc      Switch statement with interpolated string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      result = 'miss';
      sint();
      expect(result).assertEqual('hit');
    });

    /**
     * @tc.number    SUB_STATEMENTS_13900
     * @tc.name      testStatements0139
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(f3(0)).assertEqual(3);
      expect(f3(1)).assertEqual(3);
      expect(f3(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STATEMENTS_14000
     * @tc.name      testStatements0140
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      sr = -1;
      f4(0);
      expect(sr).assertEqual(42);
      sr = -1;
      f4(1);
      expect(sr).assertEqual(42);
      sr = -1;
      f4(2);
      expect(sr).assertEqual(42);
    });

    /**
     * @tc.number    SUB_STATEMENTS_14100
     * @tc.name      testStatements0141
     * @tc.desc      Switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(switchMe('Hello')).assertEqual('First');
      expect(switchMe('World')).assertEqual('Second');
      expect(switchMe('Unknown')).assertEqual('Sad');
    });

    /**
     * @tc.number    SUB_STATEMENTS_14200
     * @tc.name      testStatements0142
     * @tc.desc      Throw statements cause an exception or Error to be thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let v = 0;
      try {
        try {
          if (t1 != t2) throw new Err();
        } catch (e) {
          if (e instanceof Err) {
            v++;
            throw e;
          }
        }
      } catch (e) {
        if (e instanceof Err) {
          v++;
        }
      }
      expect(v).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATEMENTS_14300
     * @tc.name      testStatements0143
     * @tc.desc      Try statements run the block of code to handle exceptions and errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      try {} catch (e) { }
      expect(t1).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_14400
     * @tc.name      testStatements0144
     * @tc.desc      Try statements run the block of code to handle exceptions and errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      try {
        if (t1 != t2) throw new Er();
      } catch (e) {
      } finally {
        expect(t1).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_14500
     * @tc.name      testStatements0145
     * @tc.desc      Try statements run the block of code to handle exceptions and errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      try {
        if (t1 != t2) throw new Er();
      } catch (e) {
        expect(t1).assertEqual(1);
      } finally {
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_14600
     * @tc.name      testStatements0146
     * @tc.desc      Try statements run the block of code to handle exceptions and errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let res = 0;
      try {
        try {
          if (t1 != t2) throw new Er();
        } finally {
          res = 1;
        }
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(res).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_14700
     * @tc.name      testStatements0147
     * @tc.desc      Try statements run the block of code to handle exceptions and errors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let obj: Object|null = null;
      try {
        if (t1 != t2) throw new Er();
      } catch (e) {
        obj = e;
      }
      expect(obj instanceof Error).assertTrue();
    });

    /**
     * @tc.number    SUB_STATEMENTS_14800
     * @tc.name      testStatements0148
     * @tc.desc      A catch clause consists of two parts: - Catch identifier that provides access to the object associated with the error thrown; and - Block of code that handles the situation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processNumbers(4, 2)).assertEqual(2);
      expect(processNumbers(4, 0)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STATEMENTS_14900
     * @tc.name      testStatements0149
     * @tc.desc      A finally clause defines a set of actions as a block which is executed regardless how try-catch was fulfilled normally or abruptly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let ret:int = 1;
      try {
        if (t1 == t2) throw new Er();
      } finally {
        ret = 0;
      }
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_15000
     * @tc.name      testStatements0150
     * @tc.desc      A finally clause defines a set of actions as a block which is executed regardless how try-catch was fulfilled normally or abruptly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let ret:int = 1;
      try {
        if (t1 == t2) throw new Er();
        ret = 1;
      } catch (e) {
        ret = 1;
      } finally {
        ret = 0;
      }
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_15100
     * @tc.name      testStatements0151
     * @tc.desc      A finally clause defines a set of actions as a block which is executed regardless how try-catch was fulfilled normally or abruptly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let ret: int = 0;
      try {
        if (t1 == t2) throw new Er();
      } catch (e) {
        ret = 1;
      } finally {
      }
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_15200
     * @tc.name      testStatements0152
     * @tc.desc      A finally clause defines a set of actions as a block which is executed regardless how try-catch was fulfilled normally or abruptly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2;
      let ret: int = 0;
      try {
        if (t1 != t2) throw new Er();
      } catch (e) {
        ret = 1;
      } finally {
        ret = 0;
      }
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STATEMENTS_15300
     * @tc.name      testStatements0153
     * @tc.desc      The try block and the entire try statement completes normally if catch blocks are not executed. Try block execution completes abruptly if an exception or error x is thrown inside the try block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        foo26(new Er(), 100);
      } catch (e) {
        expect(e instanceof Er).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_STATEMENTS_15400
     * @tc.name      testStatements0154
     * @tc.desc      The try block and the entire try statement completes normally if catch blocks are not executed. Try block execution completes abruptly if an exception or error x is thrown inside the try block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStatements0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: I = new ErImpl();
      try {
        if (1 != 2) throw err as Error;
      } catch (e) {
        expect(e instanceof I).assertTrue();
        expect(e instanceof Er).assertTrue();
      }
    });

  })
}