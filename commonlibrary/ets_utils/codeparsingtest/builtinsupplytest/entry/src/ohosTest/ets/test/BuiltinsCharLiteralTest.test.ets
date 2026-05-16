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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsCharLiteralTest() {
  describe('BuiltinsCharLiteralTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   BuiltinsCharLiteralTest0100
     * @tc.number SUB_CHAR_LITERAL_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0100';
      console.log(`${caseName} test start`);
      let char1 = 'a';
      expect(char1).assertEqual('a');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest0200
     * @tc.number SUB_CHAR_LITERAL_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0200';
      console.log(`${caseName} test start`);
      let charArray = ['b', 'c', 'd'];
      expect(charArray[0]).assertEqual('b');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest0300
     * @tc.number SUB_CHAR_LITERAL_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0300';
      console.log(`${caseName} test start`);
      interface CharObj{
        charProp:string
      }
      let charObj:CharObj = { charProp: 'e' };
      expect(charObj.charProp).assertEqual('e');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest0400
     * @tc.number SUB_CHAR_LITERAL_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0400';
      console.log(`${caseName} test start`);
      let nestedCharArray = [['g'], ['h']];
      expect(nestedCharArray[0][0]).assertEqual('g');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest0500
     * @tc.number SUB_CHAR_LITERAL_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0500';
      console.log(`${caseName} test start`);
      let charTernary = true? 'i' : 'j';
      expect(charTernary).assertEqual('i');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest0600
     * @tc.number SUB_CHAR_LITERAL_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0600';
      console.log(`${caseName} test start`);
      let charTernary = true? 'i' : 'j';
      expect(charTernary).assertEqual('i');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest0700
     * @tc.number SUB_CHAR_LITERAL_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0700';
      console.log(`${caseName} test start`);
      let charAnd = 'm' && 'n';
      expect(charAnd).assertEqual('n');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest0800
     * @tc.number SUB_CHAR_LITERAL_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0800';
      console.log(`${caseName} test start`);
      let spreadCharArray = [...['q'], 'r'];
      expect(spreadCharArray[0]).assertEqual('q');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest0900
     * @tc.number SUB_CHAR_LITERAL_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest0900';
      console.log(`${caseName} test start`);
      let charSet = new Set(['t']);
      expect(charSet.has('t')).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1000
     * @tc.number SUB_CHAR_LITERAL_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1000';
      console.log(`${caseName} test start`);
      let charMap = new Map([['u', 'value']]);
      expect(charMap.get('u')).assertEqual('value');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1100
     * @tc.number SUB_CHAR_LITERAL_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1100';
      console.log(`${caseName} test start`);
      let charUnion: 'v' | 'w' = 'v';
      expect(charUnion).assertEqual('v');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1200
     * @tc.number SUB_CHAR_LITERAL_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1200';
      console.log(`${caseName} test start`);
      let charLoopArray = ['x', 'y', 'z'];
      for (let char of charLoopArray) {
        expect(char).assertEqual(char);
      }
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1300
     * @tc.number SUB_CHAR_LITERAL_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1300';
      console.log(`${caseName} test start`);
      let charWhileIndex = 0;
      let charWhileResult = '';
      while (charWhileIndex < 1) {
        charWhileResult = 'A';
        charWhileIndex++;
      }
      expect(charWhileResult).assertEqual('A');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest1400
     * @tc.number SUB_CHAR_LITERAL_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1400';
      console.log(`${caseName} test start`);
      let charDoWhileIndex = 0;
      let charDoWhileResult = '';
      do {
        charDoWhileResult = 'B';
        charDoWhileIndex++;
      } while (charDoWhileIndex < 1);
      expect(charDoWhileResult).assertEqual('B');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest1500
     * @tc.number SUB_CHAR_LITERAL_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1500';
      console.log(`${caseName} test start`);
      let charSwitchInput = 'C';
      let charSwitchResult = '';
      switch (charSwitchInput) {
        case 'C':
          charSwitchResult = 'Match';
          break;
        default:
          charSwitchResult = 'No match';
      }
      expect(charSwitchResult).assertEqual('Match');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1600
     * @tc.number SUB_CHAR_LITERAL_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1600';
      console.log(`${caseName} test start`);
      let charIfInput = 'D';
      let charIfResult = '';
      if (charIfInput === 'D') {
        charIfResult = 'Is D';
      } else {
        charIfResult = 'Not D';
      }
      expect(charIfResult).assertEqual('Is D');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1700
     * @tc.number SUB_CHAR_LITERAL_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1700';
      console.log(`${caseName} test start`);
      interface Obj{
        charField:string
      }
      let charJsonObj:Obj = { charField: 'E' };
      let charJsonString = JSON.stringify(charJsonObj);
      let charParsedObj:Obj = JSON.parse(charJsonString);
      expect(charParsedObj.charField).assertEqual('E');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1800
     * @tc.number SUB_CHAR_LITERAL_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1800';
      console.log(`${caseName} test start`);
      let charComparison1 = 'F' === 'F';
      expect(charComparison1).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest1900
     * @tc.number SUB_CHAR_LITERAL_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest1900';
      console.log(`${caseName} test start`);
      let charFilterArray = ['I', 'J', 'K'];
      let charFiltered = charFilterArray.filter(char => char === 'J');
      expect(charFiltered[0]).assertEqual('J');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2000
     * @tc.number SUB_CHAR_LITERAL_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2000';
      console.log(`${caseName} test start`);
      let charFilterArray = ['I', 'J', 'K'];
      let charFiltered = charFilterArray.filter(char => char === 'J');
      expect(charFiltered[0]).assertEqual('J');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsCharLiteralTest2100
     * @tc.number SUB_CHAR_LITERAL_TEST_2100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2100';
      console.log(`${caseName} test start`);
      let charTypeGuardVar: 'O' | 'P' = 'O';
      let isCharO = charTypeGuardVar === 'O';
      expect(isCharO).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2200
     * @tc.number SUB_CHAR_LITERAL_TEST_2200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2200';
      console.log(`${caseName} test start`);
      let charNullish: 'R' | undefined = 'R';
      let charNullishResult = charNullish?? 'S';
      expect(charNullishResult).assertEqual('R');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2300
     * @tc.number SUB_CHAR_LITERAL_TEST_2300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2300';
      console.log(`${caseName} test start`);
      let charA: 'a' = 'a';
      let charB: 'b' = 'b';
      let concatResult = charA + charB;
      expect(concatResult).assertEqual('ab');
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsCharLiteralTest2400
     * @tc.number SUB_CHAR_LITERAL_TEST_2400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2400';
      console.log(`${caseName} test start`);
      let charA: 'a' = 'a';
      let charB: 'b' = 'b';
      let concatResult = charA + charB;
      expect(concatResult).assertEqual('ab');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2500
     * @tc.number SUB_CHAR_LITERAL_TEST_2500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2500';
      console.log(`${caseName} test start`);
      let charStr = 'abc';
      let newCharStr = charStr.replace('b', 'd');
      let replacedChar = newCharStr[1];
      expect(replacedChar).assertEqual('d');
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsCharLiteralTest2600
     * @tc.number SUB_CHAR_LITERAL_TEST_2600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2600';
      console.log(`${caseName} test start`);
      let charSliceStr = 'hello';
      let slicedChar = charSliceStr.slice(1, 2);
      expect(slicedChar).assertEqual('e');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2700
     * @tc.number SUB_CHAR_LITERAL_TEST_2700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2700';
      console.log(`${caseName} test start`);
      let charBackspace: '\x7F' = '\x7F';
      expect(charBackspace).assertEqual('\x7F');
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsCharLiteralTest2800
     * @tc.number SUB_CHAR_LITERAL_TEST_2800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2800';
      console.log(`${caseName} test start`);
      let charBackspace: '\n' = '\n';
      expect(charBackspace).assertEqual('\n');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest2900
     * @tc.number SUB_CHAR_LITERAL_TEST_2900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest2900';
      console.log(`${caseName} test start`);
      let charBackspace: '\u0000' = '\u0000';
      expect(charBackspace).assertEqual('\u0000');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsCharLiteralTest3000
     * @tc.number SUB_CHAR_LITERAL_TEST_3000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsCharLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsCharLiteralTest3000';
      console.log(`${caseName} test start`);
      let charLower: 'x' = 'x';
      let charUpper = charLower.toUpperCase();
      expect(charUpper).assertEqual('X');
      console.log(`${caseName} test end`);
      Done();
    })
  })
}