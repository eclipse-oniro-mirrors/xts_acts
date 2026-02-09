/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sym } from './Grammar';

let TAG = '';

interface GeneratedObjectLiteralInterface_1 {}

let log = '';

function addLog() {
  log += 'called';
}

function isPositive(n: number) {
  return n > 0;
}


interface GeneratedObjectLiteralInterface_2 {
  prop: string;
}


function getValue() {
  return 3;
}

interface GeneratedObjectLiteralInterface_3 {
  a: number;
}

interface GeneratedObjectLiteralInterface_5 {
  b: number;
}

interface GeneratedObjectLiteralInterface_4 {
  id: number;
}

function getObj() {
  return ({ id: 1 } as GeneratedObjectLiteralInterface_4);
}

function testReturn(val: number) {
  switch (val) {
    case 1:
      return 'one';
    case 2:
      return 'two';
  }
  return "";
}

interface GeneratedObjectLiteralInterface_6 {
  prop: string;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsStatementTest() {
  describe('ActsStatementTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   testStatement001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement001';
      try {
        let a = 0;
        {
          a++;
          a *= 2;
        }
        expect(a).assertEqual(2);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testStatement002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement002';
      try {
        let y = 1;
        {
          let y = 2;
        }
        expect(y).assertEqual(1);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testStatement003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      try {
        let res = 0;
        if (true) {
          res += 1;
          res *= 3;
        }
        expect(res).assertEqual(3);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement004';
      try {
        let sum = 0;
        for (let i = 0; i < 3; i++) {
          sum += i;
        }
        expect(sum).assertEqual(3);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement005';
      try {
        let m = 10;
        {
          let m = 20;
          {
            expect(m).assertEqual(20);
          }
        }
        expect(m).assertEqual(10);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement006';
      try {
        let flag = false;
        if (5 > 3) {
          flag = true;
        }
        expect(flag).assertEqual(true);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement007';
      try {
        let msg = '';
        if (1 > 2) {
          msg = 'if';
        } else {
          msg = 'else';
        }
        expect(msg).assertEqual('else');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement008
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement008';
      try {
        let c = 0;
        if (true) {
          c++;
        }
        expect(c).assertEqual(1);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement009
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_0900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement009';
      try {
        let a = "";
        if (false) {
          a = "a";
        } else {
          a = "b";
        }
        expect(a).assertEqual("b");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement010
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement010';
      try {
        let a = "";
        if (null) {
          a = "x";
        } else {
          a = "y";
        }
        expect(a).assertEqual("y");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement011
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement011';
      try {
        let u = undefined;
        let a = "";
        if (u) {
          a = "p";
        } else {
          a = "q";
        }
        expect(a).assertEqual("q");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement012
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement012';
      try {
        let a = "";
        if (0) {
          a = "yes";
        } else {
          a = "no";
        }
        expect(a).assertEqual("no");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement013
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement013';
      try {
        let a = "";
        if (NaN) {
          a = "ok";
        } else {
          a = "fail";
        }
        expect(a).assertEqual("fail");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement014
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement014';
      try {
        let a = "";
        if ("") {
          a = "empty";
        } else {
          a = "not empty";
        }
        expect(a).assertEqual("not empty");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement015
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement015';
      try {
        let a = "";
        if ("hello") {
          a = "hi";
        } else {
          a = "bye";
        }
        expect(a).assertEqual("hi");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement016
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement016';
      try {
        let a = "";
        if ([]) {
          a = 'array';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('array');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement017
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement017';
      try {
        let a = "";
        if (({} as GeneratedObjectLiteralInterface_1)) {
          a = 'obj';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('obj');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement018
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement018';
      try {
        let a = 0;
        if (a = 5) {
          expect(a).assertEqual(5);
        }
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement019
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_1900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement019';
      try {
        let b = 1;
        if (b = 0) {
          expect(b).assertEqual(1);
        } else {
          expect(b).assertEqual(0);
        }
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement020
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement020';
      try {
        let c = 0;
        if (true) {
          c++;
        }
        expect(c).assertEqual(1);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement021
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement021';
      try {
        let d = 0;
        if (2 > 1) {
          if (3 > 2) {
            d = 10;
          }
        }
        expect(d).assertEqual(10);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement022
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement022';
      try {
        let e = 0;
        if (2 > 1) {
          if (3 < 2) {
            e = 10;
          } else {
            e = 5;
          }
        }
        expect(e).assertEqual(5);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement023
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement023';
      try {
        const x = true, y = false, z = true;
        let a = "";
        if (x || y && z) {
          a = 'priority';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('priority');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement024
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement024';
      try {
        if (true) {
          addLog();
        }
        expect(log).assertEqual('called');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement025
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement025';
      try {
        const num = 5;
        let res = "";
        if (num > 0) {
          res = 'positive';
        } else if (num > 3) {
          res = 'large';
        }
        expect(res).assertEqual('positive');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement026
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement026';
      try {
        const flag = true;
        let val = "";
        if (flag) {
          val = 1 > 0 ? 'a' : 'b';
        }
        expect(val).assertEqual('a');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement027
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement027';
      try {
        const t = true;
        const result = t ? (() => {
          if (1) {
            return 'x';
          }
          return ""
        })() : 'y';
        expect(result).assertEqual('x');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement028
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement028';
      try {
        let a = "";
        if (isPositive(3)) {
          a = 'pos';
        } else {
          a = 'neg';
        }
        expect(a).assertEqual('pos');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement029
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_2900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement029';
      try {
        let a = "";
        if (new Boolean(false)) {
          a = 'obj true';
        } else {
          a = 'obj false';
        }
        expect(a).assertEqual('obj true');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement030
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement030';
      try {
        let a = "";
        if (1n > 0n) {
          a = 'big';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('big');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement031
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement031';
      try {
        let a = "";
        if (0n) {
          a = 'yes';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('no');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement032
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement032';
      try {
        const name = 'test';
        let a = ""
        if (`Hello ${name}`) {
          a = 'template';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('template');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement033
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement033';
      try {
        let a = "";
        if (/abc/) {
          a = 'regex';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('regex');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement034
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement034';
      try {
        const a = 5, b = 10;
        let c = "";
        if (a > 3 && b > 8) {
          c = 'both';
        } else {
          c = 'no';
        }
        expect(c).assertEqual('both');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement035
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement035';
      try {
        const c = 2, d = 7;
        let a = "";
        if (c > 3 || d > 8) {
          a = 'either';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('no');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement036
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement036';
      try {
        let a = "";
        if (!0) {
          a = 'not zero';
        } else {
          a = 'zero';
        }
        expect(a).assertEqual('not zero');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement037
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement037';
      try {
        const obj: GeneratedObjectLiteralInterface_2 = { prop: 'value' };
        let a = "";
        if (obj.prop) {
          a = 'has prop';
        } else {
          a = 'no';
        }
        expect(a).assertEqual('has prop');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement038
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement038';
      try {
        const arr = [1, 2];
        let a = "";
        if (arr.length) {
          a = 'has items';
        } else {
          a = 'empty';
        }
        expect(a).assertEqual('has items');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement039
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_3900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement039';
      try {
        const emptyArr = [];
        let a = "";
        if (emptyArr.length) {
          a = 'has';
        } else {
          a = 'empty';
        }
        expect(a).assertEqual('empty');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement040
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement040';
      try {
        const date = new Date();
        let a = "";
        if (date) {
          a = 'valid date';
        } else {
          a = 'invalid';
        }
        expect(a).assertEqual('valid date');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement041
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement041';
      try {
        const invalidDate = new Date('invalid');
        let a = "";
        if (invalidDate) {
          a = 'truthy';
        } else {
          a = 'falsy';
        }
        expect(a).assertEqual('truthy');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement042
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement042';
      try {
        const invalid = new Date('invalid');
        let a = "";
        if (isNaN(invalid.getTime())) {
          a = 'invalid';
        } else {
          a = 'valid';
        }
        expect(a).assertEqual('invalid');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement043
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement043';
      try {
        let color = 'purple';
        let hex = "";
        switch (color) {
          case 'red':
            hex = '#ff0000';
            break;
          default:
            hex = 'unknown';
        }
        expect(hex).assertEqual('unknown');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement044
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement044';
      try {
        let x = 1;
        let log = '';
        switch (x) {
          case 1:
            log += 'a';
          case 2:
            log += 'b';
            break;
          case 3:
            log += 'c';
        }
        expect(log).assertEqual('ab');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement045
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement045';
      try {
        let y = 2;
        let val = 0;
        switch (y) {
          case 2:
            val += 2;
          case 3:
            val += 3;
          case 4:
            val += 4;
            break;
        }
        expect(val).assertEqual(9);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement046
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement046';
      try {
        let z = 5;
        let out = '';
        switch (z) {
          default:
            out = 'def'; break;
          case 1:
            out = '1';
        }
        expect(out).assertEqual('def');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement047
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement047';
      try {
        let w = 1;
        let out2 = '';
        switch (w) {
          default:
            out2 = 'def'; break;
          case 1:
            out2 = '1';
            break;
        }
        console.log(out2);
        expect(out2).assertEqual('1');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement048
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement048';
      try {
        let num = 2;
        let res = "";
        switch (num) {
          case 1:
            res = 'one';
            break;
          case 2:
            res = 'two';
            break;
          default:
            res = 'other';
        }
        expect(res).assertEqual('two');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement049
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_4900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement049';
      try {
        let str = 'apple';
        let fruit = "";
        switch (str) {
          case 'banana':
            fruit = 'yellow';
            break;
          case 'apple':
            fruit = 'red';
            break;
        }
        expect(fruit).assertEqual('red');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement050
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement050';
      try {
        let n = null;
        let res5 = "";
        switch (n) {
          case null:
            res5 = 'null';
            break;
          case undefined:
            res5 = 'undef';
        }
        expect(res5).assertEqual('null');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement051
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement051';
      try {
        let u = undefined;
        let res6 = "";
        switch (u) {
          case null:
            res6 = 'null';
            break;
          case undefined:
            res6 = 'undef';
        }
        expect(res6).assertEqual('undef');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement052
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement052';
      try {
        let nan = NaN;
        let res7 = "";
        switch (nan) {
          case NaN:
            res7 = 'match';
            break;
          default:
            res7 = 'no match';
        }
        expect(res7).assertEqual('no match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testStatement053
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement053';
      try {
        let num2 = 3;
        let res8 = "";
        switch (num2) {
          case getValue():
            res8 = 'matched';
            break;
          default:
            res8 = 'no';
        }
        expect(res8).assertEqual('matched');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement054
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement054';
      try {
        let day = 'Sat';
        let type = "";
        switch (day) {
          case 'Sat':
          case 'Sun':
            type = 'weekend';
            break;
          default:
            type = 'weekday';
        }
        expect(type).assertEqual('weekend');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement055
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement055';
      try {
        let score = 85;
        let grade = "";
        switch (true) {
          case score >= 90:
            grade = 'A';
            break;
          case score >= 80:
            grade = 'B';
            break;
          default:
            grade = 'C';
        }
        expect(grade).assertEqual('B');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement056
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement056';
      try {
        let obj: GeneratedObjectLiteralInterface_3 = { a: 1 };
        let res9 = "";
        switch (obj) {
          case { a: 1 } as GeneratedObjectLiteralInterface_3:
            res9 = 'match';
            break;
          default:
            res9 = 'no';
        }
        expect(res9).assertEqual('no');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement057
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement057';
      try {
        let obj2: GeneratedObjectLiteralInterface_5 = { b: 2 };
        let ref = obj2;
        let res10 = "";
        switch (ref) {
          case obj2:
            res10 = 'match';
            break;
          default:
            res10 = 'no';
        }
        expect(res10).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement058
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement058';
      try {
        const big = 3n;
        let res = "";
        switch (big) {
          case 3n:
            res = 'match';
            break;
          default:
            res = 'default';
        }
        expect(res).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement059
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_5900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement059';
      try {
        const str = 'hello world';
        let match = "";
        switch (str) {
          case 'hello world':
            match = 'yes';
            break;
          default:
            match = 'no';
        }
        expect(match).assertEqual('yes');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement060
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement060';
      try {
        let s = "";
        switch (sym) {
          case sym:
            s = 'match';
            break;
          default:
            s = 'no';
        }
        expect(s).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement061
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement061';
      try {
        const a = 1, b = 2;
        let nested = '';
        switch (a) {
          case 1:
            switch (b) {
              case 2:
                nested = 'inner match';
                break;
            }
            break;
        }
        expect(nested).assertEqual('inner match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement062
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement062';
      try {
        const num = 3;
        let mix = '';
        switch (num) {
          case 3:
            if (num > 2) {
              mix = 'if true';
            } else {
              mix = 'if false';
            }
            break;
        }
        expect(mix).assertEqual('if true');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement063
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement063';
      try {
        const date = new Date(2023, 0, 1);
        const sameDate = date;
        const otherDate = new Date(2023, 0, 1);
        let d = "";
        switch (sameDate) {
          case date:
            d = 'match';
            break;
          case otherDate:
            d = 'no';
            break;
        }
        expect(d).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement064
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement064';
      try {
        const match = /(\d+)/.exec('test 123');
        let reg = "";
        switch (match) {
          case null:
            reg = 'no match';
            break;
          default:
            reg = `matched ${match[1]}`; break;
        }
        expect(reg).assertEqual('matched 123');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement065
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement065';
      try {
        const arr = [1, 2];
        const arr2 = [1, 2];
        let a = "";
        switch (arr) {
          case arr:
            a = 'match';
            break;
          case arr2:
            a = 'no';
            break;
        }
        expect(a).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement066
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement066';
      try {
        const obj = getObj();
        let funcObj = "";
        switch (obj) {
          case getObj():
            funcObj = 'no';
            break;
          default:
            funcObj = 'default';
        }
        expect(funcObj).assertEqual('default');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement067
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement067';
      try {
        const nan = NaN;
        let handleNan = "";
        switch (true) {
          case isNaN(nan):
            handleNan = 'is NaN';
            break;
          default:
            handleNan = 'no';
        }
        expect(handleNan).assertEqual('is NaN');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement068
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement068';
      try {
        const inf = Infinity;
        let infinity = "";
        switch (inf) {
          case Infinity:
            infinity = 'inf';
            break;
          case -Infinity:
            infinity = 'neg inf';
            break;
        }
        expect(infinity).assertEqual('inf');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement069
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_6900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement069';
      try {
        expect(testReturn(2)).assertEqual('two');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement070
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement070';
      try {
        const score = 75;
        let gradeSwitch = "";
        switch (true) {
          case score >= 90:
            gradeSwitch = 'A';
            break;
          case score >= 70:
            gradeSwitch = 'B';
            break;
          default:
            gradeSwitch = 'C';
        }
        let gradeIf = "";
        if (score >= 90) {
          gradeIf = 'A';
        } else if (score >= 70) {
          gradeIf = 'B';
        } else {
          gradeIf = 'C';
        }
        expect(gradeSwitch).assertEqual(gradeIf);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement071
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement071';
      try {
        let key = 'x';
        let out3 = '';
        switch (key) {
          case 'a':
            out3 = 'a';
            break;
          default:
            out3 = 'def'; break;
          case 'b':
            out3 = 'b';
        }
        expect(out3).assertEqual('def');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement072
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement072';
      try {
        switch (1) {}
        let a = "executed";
        expect(a).assertEqual('executed');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement073
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement073';
      try {
        const num = 5;
        let out = "";
        switch (num) {
          case 2 + 3:
            out = '5';
            break;
          default:
            out = 'no';
        }
        expect(out).assertEqual('5');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement074
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement074';
      try {
        const x = true;
        let log = "";
        switch (x) {
          case true && true:
            log = 'true';
            break;
          default:
            log = 'no';
        }
        expect(log).assertEqual('true');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement075
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement075';
      try {
        const val = 2;
        let dup = "";
        switch (val) {
          case 2:
            dup = 'first';
            break;
          case 2:
            dup = 'second';
            break;
          default:
            dup = 'def';
        }
        expect(dup).assertEqual('first');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement076
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement076';
      try {
        const val2 = 2;
        let dup2 = '';
        switch (val2) {
          case 2:
            dup2 += 'a';
          case 2:
            dup2 += 'b';
            break;
          default:
            dup2 += 'c';
        }
        expect(dup2).assertEqual('ab');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement077
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7700
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement077';
      try {
        const name = 'Alice';
        const input = 'Hello Alice';
        let temp = "";
        switch (input) {
          case `Hello ${name}`:
            temp = 'template match';
            break;
          default:
            temp = 'no';
        }
        expect(temp).assertEqual('template match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement078
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7800
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement078';
      try {
        let u = undefined;
        let undef = "";
        switch (u) {
          case undefined:
            undef = 'match';
            break;
          case null:
            undef = 'no';
            break;
        }
        expect(undef).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement079
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_7900
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement079';
      try {
        const bool = true;
        let b = "";
        switch (bool) {
          case true:
            b = 'true';
            break;
          default:
            b = '1';
            break;
        }
        expect(b).assertEqual('true');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement080
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8000
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement080';
      try {
        const bool2 = false;
        let b2 = "";
        switch (bool2) {
          case false:
            b2 = 'false';
            break;
          default:
            b2 = '0';
        }
        expect(b2).assertEqual('false');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement081
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8100
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement081';
      try {
        const n = null;
        let nl = "";
        switch (n) {
          case null:
            nl = 'match';
            break;
          case undefined:
            nl = 'no';
            break;
        }
        expect(nl).assertEqual('match');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement082
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8200
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement082';
      try {
        const key2 = 'x';
        let def2 = '';
        let swA = (key2: string) => {
          switch (key2) {
            default:
              def2 += 'def';
            case '':
              def2 += 'y';
              break;
          }
        }
        swA(key2);
        expect(def2).assertEqual('defy');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement083
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8300
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement083';
      try {
        const key = 'none';
        let def = '';
        let swK = (key: string) => {
          switch (key) {
            case 'a':
              def += 'a';
            default:
              def += 'def'; break;
            case 'b':
              def += 'b';
          }
        }
        swK(key);
        expect(def).assertEqual('def');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement084
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8400
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement084';
      try {
        let bool2 = false;
        let res4 = "";
        let swB = (bool2: boolean) => {
          switch (bool2) {
            case true:
              res4 = 'yes';
              break;
            case false:
              res4 = 'no';
          }
        }
        swB(bool2);
        expect(res4).assertEqual('no');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement085
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8500
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement085';
      try {
        let bool = true;
        let res3 = "";
        let swB1 = (bool: boolean) => {
          switch (bool) {
            case true:
              res3 = 'yes';
              break;
            case false:
              res3 = 'no';
          }
        }
        swB1(bool);
        expect(res3).assertEqual('yes');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStatement086
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_STATEMENT_8600
     * @tc.desc   Test control flow and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStatement086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testStatement086';
      try {
        let s = '2';
        let match = true;
        let swS = (s: number | string) => {
          switch (s) {
            case 2:
              match = true;
              break;
            default:
              match = false;
          }
        }
        swS(s);
        expect(match).assertEqual(false);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
  })
}