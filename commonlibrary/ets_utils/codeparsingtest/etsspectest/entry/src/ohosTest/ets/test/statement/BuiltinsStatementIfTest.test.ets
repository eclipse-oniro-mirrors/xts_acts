/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { condition, Ob, St, Arr, Big, Box, Inter, Colour, cd } from '../../testability/pages/Function'

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function builtinsStatementIfTest() {
  describe('BuiltinsStatementIfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   builtinsStatementIfTest1001
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1001
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementIfTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let a: number = 0;
      try {
        if (0) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1002
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1002
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementIfTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let a: number = 0;
      try {
        if (NaN) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1003
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1003
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementIfTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let a: number = 0;
      try {
        if ('') {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1004
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1004
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementIfTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let a: number = 0;
      try {
        if (null) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1005
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1005
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (undefined) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1006
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1006
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (!'s') {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1007
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1007
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (!0) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1008
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1008
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (true) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1009
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1009
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (false) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1010
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1010
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (condition()) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1011
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1011
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if ((2 > 1) && (4 == 4)) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })


    /**
     * @tc.name   builtinsStatementIfTest1012
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1012
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (6) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1013
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1013
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let condition1: Array<number> = [1, 2, 3];
      let a: number = 0;
      try {
        if (condition1) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1014
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1014
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let condition1: string = 'abc'
      let a: number = 0;
      try {
        if (condition1) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1015
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1015
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let person: Ob = new Ob('a', 12)
      let a: number = 0;
      try {
        if (person) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1016
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1016
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: bigint = 10000000000000000000n
      let a: number = 0;
      try {
        if (num) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1017
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1017
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let str: St = new St('abcd')
      let a: number = 0;
      try {
        if (str) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1018
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1018
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Arr<number> = new Arr()
      let a: number = 0;
      try {
        if (array) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1019
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1019
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: Big = new Big(100000n)
      let a: number = 0;
      try {
        if (num) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1020
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1020
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let str: string = 'abc';
      let box: Box<string> = new Box(str)
      let a: number = 0;
      try {
        if (box) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1021
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1021
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 123;
      let box: Box<number> = new Box(num)
      let a: number = 0;
      try {
        if (box) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1022
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1022
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let bool: boolean = true;
      let box: Box<boolean> = new Box(bool)
      let a: number = 0;
      try {
        if (box) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1023
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1023
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let bignum: bigint = 110n;
      let box: Box<bigint> = new Box(bignum)
      let a: number = 0;
      try {
        if (box) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1024
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1024
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let i: Inter = {
        value: '888'
      }
      let a: number = 0;
      try {
        if (i) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1025
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1025
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let r: Colour = Colour.RED;
      let a: number = 0;
      try {
        if (r) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1026
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1026
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let g: Colour = Colour.GREEN;
      let a: number = 0;
      try {
        if (g) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1027
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1027
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type Tuple = [string, number, boolean];
      let t: Tuple = ['a', 1, true];
      let a: number = 0;
      try {
        if (t) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1028
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1028
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type ID = string | number;
      let i: ID = 10;
      let a: number = 0;
      try {
        if (i) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1029
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1029
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type Direction = 'north' | 'south' | 'east' | 'west';
      let d: Direction = 'north';
      let a: number = 0;
      try {
        if (d) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1031
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1031
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (true) {
          a++;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1032
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1032
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (true) {
          a++;
        } else {
          a--;
        }
      } catch (e) {
      }
      expect(1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1034
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1034
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (false) {
          a++;
        } else if (true) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a)
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1035
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1035
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (0) {
          a++;
        } else if (!0) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1036
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1036
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (NaN) {
          a++;
        } else if (!NaN) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1037
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1037
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if ('') {
          a++;
        } else if (!'') {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1038
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1038
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (null) {
          a++;
        } else if (!null) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1039
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1039
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (undefined) {
          a++;
        } else if (!undefined) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1040
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1040
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (undefined) {
          a++;
        } else if (!undefined) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1041
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1041
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (!'s') {
          a++;
        } else if ('s') {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })


    /**
     * @tc.name   builtinsStatementIfTest1042
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1042
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (cd()) {
          a++;
        } else if (condition()) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1043
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1043
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let condition1 = true;
      let condition2 = false;
      let a: number = 0;
      try {
        if (!condition1 || condition2) {
          a++;
        } else if (condition1 && !condition2) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1044
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1044
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let score = 85;
      let a: number = 0;
      try {
        if (score >= 90) {
          a++;
        } else if (score >= 80) {
          a += 2;
        } else if (score >= 70) {
          a += 3;
        } else if (score >= 60) {
          a += 4;
        } else {
          a += 5;
        }
      } catch (e) {
      }
      expect(2).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1045
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1045
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let condition1: Array<number> = [1, 2, 3];
      let a: number = 0;
      try {
        if (!condition1) {
          a++;
        } else if (condition1) {
          a--;
        }
      } catch (e) {
        console.info('error is', e.message)
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1046
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1046
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let condition1: string = 'abc';
      let a: number = 0;
      try {
        if (!condition1) {
          a++;
        } else if (condition1) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1047
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1047
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let person: Ob = new Ob('a', 12)
      let a: number = 0;
      try {
        if (!person) {
          a++;
        } else if (person) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1048
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1048
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: bigint = 10000000000000000000n
      let a: number = 0;
      try {
        if (!num) {
          a++;
        } else if (num) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1049
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1049
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let str: St = new St('abcd')
      let a: number = 0;
      try {
        if (!str) {
          a++;
        } else if (str) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1050
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1050
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Arr<number> = new Arr()
      let a: number = 0;
      try {
        if (!array) {
          a++;
        } else if (array) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1051
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1051
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: Big = new Big(100000n)
      let a: number = 0;
      try {
        if (!num) {
          a++;
        } else if (num) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1052
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1052
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let str: string = 'abc';
      let box: Box<string> = new Box(str)
      let a: number = 0;
      try {
        if (!box) {
          a++;
        } else if (box) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1053
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1053
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 123;
      let box: Box<number> = new Box(num)
      let a: number = 0;
      try {
        if (!box) {
          a++;
        } else if (box) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1054
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1054
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let bool: boolean = true;
      let box: Box<boolean> = new Box(bool)
      let a: number = 0;
      try {
        if (!box) {
          a++;
        } else if (box) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1055
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1055
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let bignum: bigint = 110n;
      let box: Box<bigint> = new Box(bignum)
      let a: number = 0;
      try {
        if (!box) {
          a++;
        } else if (box) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1056
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1056
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: Inter = {
        value: '888'
      }
      let b: number = 0;
      try {
        if (!a) {
          b++;
        } else if (a) {
          b--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(b);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1057
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1057
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: Colour = Colour.GREEN;
      let b: Colour = Colour.RED;
      let c: number = 0;
      try {
        if (b) {
          c++;
        } else if (a) {
          c--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(c);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1058
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1058
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type Tuple = [string, number, boolean];
      let a: Tuple = ['a', 1, true];
      let b: number = 0;
      try {
        if (!a) {
          b++;
        } else if (a) {
          b--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(b);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1059
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1059
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type ID = string | number;
      let a: ID = 10;
      let b: number = 0;
      try {
        if (!a) {
          b++;
        } else if (a) {
          b--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(b);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1060
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1060
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      type Direction = 'north' | 'south' | 'east' | 'west';
      let a: Direction = 'north';
      let b: number = 0;
      try {
        if (!a) {
          b++;
        } else if (a) {
          b--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(b);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1061
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1061
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 0;
      try {
        if (false) {
          a++;
        } else if (true) {
          a--;
        }
      } catch (e) {
      }
      expect(-1).assertEqual(a);
      Done();
    })

    /**
     * @tc.name   triangleInequalityTest
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1062
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('triangleInequalityTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let a: number = 10;
      let b: number = 5;
      let c: number = 8;
      let num: number = 0;
      try {
        if (a > 0 && b > 0 && c > 0) {
          num++;
          if (a + b > c) {
            num++;
            if (a + c > b) {
              num++;
              if (b + c > a) {
                num++;
                if (Math.abs(a - b) < c) {
                  num++;
                  Done();
                } else {
                  num--;
                }
              } else {
                num--;
              }
            } else {
              num--;
            }
          } else {
            num--;
          }
        } else {
          num--;
        }
      } catch (e) {
      }
      expect(5).assertEqual(num);
      Done();
    });

    /**
     * @tc.name   builtinsStatementIfTest1063
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1063
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 7;
      let a: number = 0;
      try {
        if (num > 10) {
          a++;
        } else {
          a--;
          if (num <= 5) {
            a++;
          } else {
            a--;
            if (num % 2 === 0) {
              a++;
            } else {
              a--;
              if (num % 3 === 0) {
                a++;
              } else {
                a--;
                if (num % 5 === 0) {
                  a++;
                } else {
                  a--;
                }
              }
            }
          }
        }
      } catch (e) {
      }
      expect(7).assertEqual(num);
      Done();
    })

    /**
     * @tc.name   builtinsStatementIfTest1064
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1064
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 15;
      try {
        if (num > 20) {
        } else if (num > 15) {
        } else if (num > 10) {
          if (num % 2 === 0) {
          } else if (num % 3 === 0) {
            expect(num % 3 === 0).assertEqual(true);
            Done();
          }
        } else if (num > 5) {
        } else {
        }
      } catch (e) {
      }
    });

    /**
     * @tc.name   builtinsStatementIfTest1065
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1065
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 50;
      try {
        if (num > 100) {
        } else {
          if (num > 80) {
          } else {
            if (num > 60) {
            } else {
              if (num > 40) {
                expect(true).assertEqual(num > 40);
                Done();
              } else {
                if (num > 20) {
                } else {
                  if (num > 10) {
                  } else {
                    if (num > 5) {
                    } else {
                      if (num > 2) {
                      } else {
                        if (num > 1) {
                        } else {
                          if (num === 0) {
                          } else {
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {
        console.info('error is', e.message);
      }
    });

    /**
     * @tc.name   builtinsStatementIfTest1066
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1066
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 50
      try {
        if (num > 100) {
        } else {
          expect(true).assertEqual(num <= 100);
          if (num > 90) {
          } else {
            expect(true).assertEqual(num <= 90);
            if (num > 80) {
            } else {
              expect(true).assertEqual(num <= 80);
              if (num > 70) {
              } else {
                expect(true).assertEqual(num <= 70);
                if (num > 60) {
                } else {
                  expect(true).assertEqual(num <= 60);
                  if (num > 50) {
                  } else {
                    expect(true).assertEqual(num <= 50);
                    if (num > 40) {
                      expect(true).assertEqual(num > 40);
                      Done();
                    } else {
                      if (num > 30) {
                      } else {
                        if (num > 20) {
                        } else {
                          if (num > 10) {
                          } else {
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {
      }
    })

    /**
     * @tc.name   builtinsStatementIfTest1067
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1067
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 50
      try {
        if (num > 100) {
        } else if (num > 90) {
        } else if (num > 80) {
        } else if (num > 70) {
        } else if (num > 60) {
        } else if (num > 50) {
        } else if (num > 40) {
          expect(true).assertEqual(num > 40 && num <= 50);
          Done();
        } else if (num > 30) {
        } else if (num > 20) {
        } else if (num > 10) {
        } else {
        }
      } catch (e) {
      }
    })

    /**
     * @tc.name   builtinsStatementIfTest1068
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1068
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      try {
        if (true) {
          num = 100;
        }
        expect(100).assertEqual(num);
        Done();
      } catch (e) {
      }
    })

    /**
     * @tc.name   builtinsStatementIfTest1069
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1069
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      try {
        if (false) {
        } else if (true) {
          num = 100;
        }
        expect(100).assertEqual(num);
        Done();
      } catch (e) {
      }
    })

    /**
     * @tc.name   builtinsStatementIfTest1070
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1070
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      try {
        if (false) {
        } else {
          num = 100;
        }
        expect(100).assertEqual(num);
        Done();
      } catch (e) {
      }
    })

    /**
     * @tc.name   builtinsStatementIfTest1071
     * @tc.number SUB_BUILTINS_STATEMENT_IF_TEST_1071
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementIfTest1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let result: string = "";
      try {
        let num: number = 15;
        if (num > 10) {
          result = "Number is greater than 10";
          if (num > 12) {
            result = "Number is greater than 12";
            if (num % 2 === 0) {
              result = "Number is even and greater than 12";
            } else {
              result = "Number is odd and greater than 12";
              if (num === 15) {
                result = "Number is exactly 15";
              } else {
                result = "Number is odd, greater than 12, but not 15";
              }
            }
          } else {
            result = "Number is between 11 and 12";
          }
        } else {
          result = "Number is not greater than 10";
        }
        expect('Number is exactly 15').assertEqual(result)
        Done();
      } catch (e) {
      }
    })
  })
}