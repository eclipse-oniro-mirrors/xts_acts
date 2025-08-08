/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";
import { sleep } from "../../testability/pages/Utils";


export default function BuiltinsStatementBreakTest() {
  describe('BuiltinsStatementBreakTest', () => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0100
     * @tc.name BuiltinsStatementBreakTest0100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsStatementBreakTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let count = 0;
      while (true) {
        console.log(`count: ${count}`);
        count++;
        if (count >= 5) {
          break;
        }
      }
      expect(count).assertEqual(5);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0200
     * @tc.name BuiltinsStatementBreakTest0200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsStatementBreakTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let count = 0;
      for (count; count <= 10; count++) {
        console.log(`count: ${count}`);
        if (count === 5) {
          break;
        }
      }
      expect(count).assertEqual(5);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0300
     * @tc.name BuiltinsStatementBreakTest0300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let count = 0;
      do {
        console.log(`count: ${count}`);
        count++;
        if (count === 5) {
          break;
        }
      } while (true);
      expect(count).assertEqual(5);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0400
     * @tc.name BuiltinsStatementBreakTest0400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      let range: number = 0;
      switch (range) {
        case -1:
          num = -1;
          break;
        case 0:
          num = 0;
          break;
        case 1:
          num = 1;
          break;
        case 2:
          num = 2;
          break;
        case 3:
          num = 3;
          break;
        default:
          num = -2;
      }
      expect(num).assertEqual(0);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0500
     * @tc.name BuiltinsStatementBreakTest0500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      let range: number = 0;
      switch (range) {
        case -1:
          num = -1;
        case 0:
          num = 0;
        case 1:
          num = 1;
        case 2:
          num = 2;
        case 3:
          num = 3;
        default:
          num = -2;
      }
      expect(num).assertEqual(-2);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0600
     * @tc.name BuiltinsStatementBreakTest0600
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let loopResult: boolean | number = -1;
      let i = 0;
      outerWhile: while (i < 5) {
        let j = 0;
        while (j < 5) {
          console.log(`i: ${i}, j: ${j}`);
          if (i === 1 && j === 4) {
            loopResult = true;
            break;
          }
          if (i === 3 && j === 2) {
            loopResult = 100;
            break;
          }
          if (i === 2 && j === 3) {
            loopResult = false;
            break;
          }
          j++;
        }
        i++;
      }
      console.log(`The result of the loop is: ${loopResult}`);
      expect(loopResult).assertEqual(100);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0700
     * @tc.name BuiltinsStatementBreakTest0700
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let shouldBreak = false;
      let i = 0;
      outerLoop: while (i < 5) {
        let j = 0;
        while (j < 5) {
          console.log(`i: ${i}, j: ${j}`);
          if (i === 2 && j === 3) {
            shouldBreak = true;
          }
          if (shouldBreak) {
            break outerLoop;
          }
          j++;
        }
        i++;
      }
      console.log("Loop execution completed.");
      expect(shouldBreak).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0800
     * @tc.name BuiltinsStatementBreakTest0800
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const executeNonLoopLogic = () => {
        let value = 0;
        value += 1;
        console.log(`Value after step 1: ${value}`);
        if (value === 1) {
          return -1;
        }
        value *= 2;
        console.log(`Value after step 2: ${value}`);
        return value;
      }
      const result = executeNonLoopLogic();
      expect(result).assertEqual(-1);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0900
     * @tc.name BuiltinsStatementBreakTest0900
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const loopWithBreak = () => {
        let sum = 0;
        for (let i = 0; i < 10; i++) {
          sum += i;
          console.log(`Current sum: ${sum}`);
          if (sum > 15) {
            break;
          }
        }
        return sum;
      }
      const result = loopWithBreak();
      expect(result).assertEqual(21);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1000
     * @tc.name BuiltinsStatementBreakTest1000
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let loopResult: boolean | number = -1;
      let i = 0;
      outerWhile: while (i < 5) {
        let j = 0;
        while (j < 5) {
          console.log(`i: ${i}, j: ${j}`);
          if (i === 1 && j === 4) {
            loopResult = true;
            break outerWhile;
          }
          if (i === 3 && j === 2) {
            loopResult = 100;
            break outerWhile;
          }
          if (i === 2 && j === 3) {
            loopResult = false;
            break outerWhile;
          }
          j++;
        }
        i++;
      }
      console.log(`The result of the loop is: ${loopResult}`);
      expect(loopResult).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1100
     * @tc.name BuiltinsStatementBreakTest1100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let count = 0;
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          console.log(`i: ${i}, j: ${j}`);
          if (i === 1 && j === 1) {
            count = 5;
            break outerLoop;
          }
        }
      }
      expect(count).assertEqual(5);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1200
     * @tc.name BuiltinsStatementBreakTest1200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let outerCounter = 0;
      outerDoWhile: do {
        do {
          console.log(`Outer counter: ${outerCounter}`);
          let innerCounter = 0;
          do {
            console.log(`  Inner counter: ${innerCounter}`);
            if (outerCounter === 1 && innerCounter === 2) {
              break outerDoWhile;
            }
            innerCounter++;
          } while (innerCounter < 3);
          outerCounter++;
        } while (outerCounter < 3);
      } while (false);
      console.log('Loop ended.');
      expect(outerCounter).assertEqual(1);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1400
     * @tc.name BuiltinsStatementBreakTest1300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let outerCounter = 0;
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          switch (i * 3 + j) {
            case 2:
              outerCounter = 2;
              console.log('Case 2: i =', i, ', j =', j);
              break;
            case 4:
              outerCounter = 4;
              console.log('Case 4: i =', i, ', j =', j);
              break outerLoop;
            default:
              outerCounter = 1;
              console.log('Default: i =', i, ', j =', j);
          }
        }
      }
      console.log('Loop ended.');
      expect(outerCounter).assertEqual(4);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1400
     * @tc.name BuiltinsStatementBreakTest1400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let num = 2;
      outerLabel: switch (num) {
        case 1:
          num = 1;
          console.log('The number is 1.');
        case 2:
          num = 2;
          console.log('The number is 2.');
        case 3:
          num = 3;
          console.log('The number is 3.');
        default:
          num = 4;
          console.log('The number is not 1, 2 or 3.');
      }
      console.log('Switch execution completed.');
      expect(num).assertEqual(4);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1500
     * @tc.name BuiltinsStatementBreakTest1500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let conditionMet = false;
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          let value = i * 3 + j;
          if (i === 1 && j === 0) {
            conditionMet = true;
          }
          switch (value) {
            case 2:
              console.log(`In case 2: i = ${i}, j = ${j}`);
              if (conditionMet) {
                console.log('Condition is met, breaking outer loop from case 2.');
                break outerLoop;
              }
              break;
            case 4:
              console.log(`In case 4: i = ${i}, j = ${j}`);
              if (i > 0) {
                console.log('i > 0, breaking outer loop from case 4.');
                break outerLoop;
              }
              break;
            default:
              console.log(`In default: i = ${i}, j = ${j}`);
              if (conditionMet && j === 2) {
                console.log('Condition is met and j = 2, breaking outer loop from default.');
                break outerLoop;
              }
          }
        }
      }
      console.log('Outer loop has ended.');
      expect(conditionMet).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1600
     * @tc.name BuiltinsStatementBreakTest1600
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let shouldBreakInner = false;
      let shouldBreakMiddle = false;
      let shouldBreakOuter = false;
      outerLoop: for (let i = 0; i < 3; i++) {
        middleLoop: for (let j = 0; j < 3; j++) {
          innerLoop: for (let k = 0; k < 3; k++) {
            if (i === 1 && j === 1 && k === 1) {
              shouldBreakInner = true;
            }
            if (i === 2 && j === 0) {
              shouldBreakMiddle = true;
            }
            if (i === 2 && j === 2 && k === 2) {
              shouldBreakOuter = true;
            }
            console.log(`i: ${i}, j: ${j}, k: ${k}`);
            if (shouldBreakInner) {
              console.log('Breaking inner loop');
              break innerLoop;
            }
            if (shouldBreakMiddle) {
              console.log('Breaking middle loop');
              break middleLoop;
            }
            if (shouldBreakOuter) {
              console.log('Breaking outer loop');
              break outerLoop;
            }
          }
        }
      }
      console.log('All loops finished.' + shouldBreakOuter + shouldBreakMiddle + shouldBreakOuter);
      expect(shouldBreakOuter).assertFalse();
      expect(shouldBreakMiddle).assertTrue();
      expect(shouldBreakOuter).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1700
     * @tc.name BuiltinsStatementBreakTest1700
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let breakInner = false;
      let breakMiddle = false;
      let breakOuter = false;
      outerLoop: for (let i = 0; i < 3; i++) {
        middleLoop: for (let j = 0; j < 3; j++) {
          innerLoop: for (let k = 0; k < 3; k++) {
            if (i === 0 && j === 1 && k === 2) {
              breakInner = true;
            }
            if (i === 1 && j === 0) {
              breakMiddle = true;
            }
            if (i === 2 && j === 2 && k === 1) {
              breakOuter = true;
            }
            console.log(`Outer: ${i}, Middle: ${j}, Inner: ${k}`);
            if (breakInner) {
              console.log('Breaking inner loop');
              break innerLoop;
            }
            if (breakMiddle) {
              console.log('Breaking middle loop');
              break middleLoop;
            }
            if (breakOuter) {
              console.log('Breaking outer loop');
              break outerLoop;
            }
          }
        }
      }
      console.log('All loops have finished.' + breakInner + breakMiddle + breakOuter);
      expect(breakInner).assertTrue();
      expect(breakMiddle).assertTrue();
      expect(breakOuter).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1800
     * @tc.name BuiltinsStatementBreakTest1800
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let shouldBreakLoopA = false;
      let shouldBreakLoopB = false;
      let shouldBreakOuter = false;
      outer: for (let i = 0; i < 3; i++) {
        loopA: for (let j = 0; j < 3; j++) {
          loopB: for (let k = 0; k < 3; k++) {
            if (i === 0 && j === 1 && k === 2) {
              shouldBreakLoopA = true;
            }
            if (i === 1 && j === 2 && k === 0) {
              shouldBreakLoopB = true;
            }
            if (i === 2 && j === 0 && k === 1) {
              shouldBreakOuter = true;
            }
            console.log(`Outer: ${i}, LoopA: ${j}, LoopB: ${k}`);
            if (shouldBreakLoopA) {
              console.log('Breaking to loopA');
              break loopA;
            }
            if (shouldBreakLoopB) {
              console.log('Breaking to loopB');
              break loopB;
            }
            if (shouldBreakOuter) {
              console.log('Breaking to outer loop');
              break outer;
            }
          }
        }
      }
      console.log('All loops are completed.' + shouldBreakLoopA + shouldBreakLoopB + shouldBreakOuter);
      expect(shouldBreakLoopA).assertTrue();
      expect(shouldBreakLoopB).assertFalse();
      expect(shouldBreakOuter).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1900
     * @tc.name BuiltinsStatementBreakTest1900
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let breakToInner = false;
      let breakToMiddle = false;
      let breakToOutermost = false;
      outermost: for (let i = 0; i < 3; i++) {
        middle: for (let j = 0; j < 3; j++) {
          inner: for (let k = 0; k < 3; k++) {
            if (i === 0 && j === 1 && k === 2) {
              breakToInner = true;
            }
            if (i === 1 && j === 2) {
              breakToMiddle = true;
            }
            if (i === 2) {
              breakToOutermost = true;
            }
            console.log(`Outermost: ${i}, Middle: ${j}, Inner: ${k}`);
            if (breakToInner) {
              console.log('Breaking to inner loop');
              break inner;
            }
            if (breakToMiddle) {
              console.log('Breaking to middle loop');
              break middle;
            }
            if (breakToOutermost) {
              console.log('Breaking to outermost loop');
              break outermost;
            }
          }
        }
      }
      console.log('All loops have ended.' + breakToInner + breakToMiddle + breakToOutermost);
      expect(breakToInner).assertTrue();
      expect(breakToMiddle).assertTrue();
      expect(breakToOutermost).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2000
     * @tc.name BuiltinsStatementBreakTest2000
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let shouldBreak = false;
      outerBlock: {
        try {
          for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 3; j++) {
              console.log(`i: ${i}, j: ${j}`);
              if (i === 1 && j === 1) {
                console.log('Condition 1 met: Setting shouldBreak to true');
                shouldBreak = true;
              }
              if (i === 2 && j === 2) {
                console.log('Condition 2 met: Setting shouldBreak to true');
                shouldBreak = true;
              }
              if (shouldBreak) {
                console.log('shouldBreak is true. Throwing an error.');
                throw new Error('Breaking loop due to condition met');
              }
            }
          }
        } catch (error) {
          console.log(`Caught error: ${error.message}`);
          break outerBlock;
        }
        console.log('This code will not execute if shouldBreak becomes true.');
      }
      console.log('Exited the outer block.');
      expect(shouldBreak).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2100
     * @tc.name BuiltinsStatementBreakTest2100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let flag = false;
      let value = 1;
      outerLogic: {
        if (value > 0.5) {
          flag = true;
          console.log('Condition met, flag set to true.');
        } else {
          console.log('Condition not met, flag remains false.');
        }
        if (flag) {
          console.log('Flag is true, breaking to outer logic.');
          break outerLogic;
        }
        console.log('This code will not execute if flag is true.');
      }
      console.log('Exited the outer logic block.');
      expect(flag).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2200
     * @tc.name BuiltinsStatementBreakTest2200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const checkConditions = () => {
        let shouldExit = false;
        outerLogic: {
          const value1 = 1;
          const value2 = 0.2;
          if (value1 > 0.6 && value2 < 0.3) {
            shouldExit = true;
            console.log('Complex condition met, shouldExit set to true.');
          } else {
            console.log('Complex condition not met, shouldExit remains false.');
          }
          if (shouldExit) {
            console.log('shouldExit is true, breaking to outer logic.');
            break outerLogic;
          }
          console.log('This part of code executes when shouldExit is false.');
        }
        console.log('Exited the outer logic block in the function.');
        return shouldExit;
      }
      const flag = checkConditions();
      expect(flag).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2300
     * @tc.name BuiltinsStatementBreakTest2300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let shouldStop = false;
      const randomValue = 1;
      if (randomValue > 0.7) {
        shouldStop = true;
        console.log('Condition met. shouldStop is set to true.');
      } else {
        console.log('Condition not met. shouldStop remains false.');
      }
      expect(shouldStop).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2400
     * @tc.name BuiltinsStatementBreakTest2400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let isAllConditionsMet = false;
      outer: {
        let outerCondition1 = Math.random() > 0.5;
        let outerCondition2 = false;
        let outerCondition3 = Math.random() < 0.4;
        if (outerCondition1) {
          outerCondition2 = true;
        }
        console.log(`Outer Condition 1: ${outerCondition1}, Outer Condition 2: ${outerCondition2}, Outer Condition 3: ${outerCondition3}`);
        if (outerCondition1 && outerCondition2 && outerCondition3) {
          console.log('All outer conditions are true. Entering middle block.');
          outer1: {
            let middleCondition1 = false;
            let middleCondition2 = Math.random() < 0.3;
            let middleCondition3 = Math.random() > 0.6;
            if (middleCondition2) {
              middleCondition1 = true;
            }
            console.log(`Middle Condition 1: ${middleCondition1}, Middle Condition 2: ${middleCondition2}, Middle Condition 3: ${middleCondition3}`);

            if (middleCondition1 && middleCondition2 && middleCondition3) {
              console.log('All middle conditions are true. Entering inner block.');
              outer2: {
                let innerCondition1 = true;
                let innerCondition2 = false;
                let innerCondition3 = Math.random() < 0.2;
                if (innerCondition1) {
                  innerCondition2 = Math.random() > 0.7;
                }
                console.log(`Inner Condition 1: ${innerCondition1}, Inner Condition 2: ${innerCondition2}, Inner Condition 3: ${innerCondition3}`);
                if (innerCondition1 && innerCondition2 && innerCondition3) {
                  console.log('All inner conditions are true. Breaking inner outer block.');
                  isAllConditionsMet = true;
                  break outer2;
                } else {
                  console.log('Not all inner conditions are true. Continuing inner block.');
                }
              }
              console.log('After inner outer block.');
            } else {
              console.log('Not all middle conditions are true. Continuing middle block.');
            }
          }
          console.log('After middle outer block.');
        } else {
          console.log('Not all outer conditions are true. Continuing outer block.');
        }
      }
      console.log(`Final result: All conditions are met? ${isAllConditionsMet}`);
      expect(isAllConditionsMet).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2500
     * @tc.name BuiltinsStatementBreakTest2500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let isAllConditionsPassed = false;
      outerLoop: for (let i = 0; i < 5; i++) {
        console.log(`Outer loop iteration: ${i}`);
        middleLoop: for (let j = 0; j < 5; j++) {
          console.log(`  Middle loop iteration: ${j}`);
          innerLoop: for (let k = 0; k < 5; k++) {
            console.log(`    Inner loop iteration: ${k}`);
            const condition1 = Math.random() > 0.7;
            const condition2 = Math.random() < 0.3;
            const condition3 = Math.random() > 0.5;
            if (condition1) {
              console.log('Condition 1 met, breaking inner loop');
              break innerLoop;
            }
            if (condition2) {
              console.log('Condition 2 met, breaking middle loop');
              break middleLoop;
            }
            if (condition3) {
              console.log('Condition 3 met, breaking outer loop');
              isAllConditionsPassed = true;
              break outerLoop;
            }
          }
        }
      }
      console.log(`Test result: All conditions passed? ${isAllConditionsPassed}`);
      expect(isAllConditionsPassed).assertTrue();
      Done();
    })
  })
}
