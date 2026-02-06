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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "../../../hypium/index";

export default function builtinsBreakTest() {
  describe('BuiltinsStatementBreakTest', (): void => {
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll((): void => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(async () : Promise<void> => {
    //   await Utils.msSleep(100);
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach((): void => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    // })
    // afterAll((): void => {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0100
     * @tc.name BuiltinsStatementBreakTest0100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count = 0;
      while (true) {
        console.log(`count: ${count}`);
        count++;
        if (count >= 5) {
          break;
        }
      }
      expect(count).assertEqual(5);
      done();
    });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0200
     * @tc.name BuiltinsStatementBreakTest0200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count = 0;
      for (count; count <= 10; count++) {
        console.log(`count: ${count}`);
        if (count === 5) {
          break;
        }
      }
      expect(count).assertEqual(5);
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0300
     * @tc.name BuiltinsStatementBreakTest0300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count = 0;
      do {
        console.log(`count: ${count}`);
        count++;
        if (count === 5) {
          break;
        }
      } while (true);
      expect(count).assertEqual(5);
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0400
     * @tc.name BuiltinsStatementBreakTest0400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 0;
      let range: int = 0;
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0500
     * @tc.name BuiltinsStatementBreakTest0500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 0;
      let range: int = 0;
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0600
     * @tc.name BuiltinsStatementBreakTest0600
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0700
     * @tc.name BuiltinsStatementBreakTest0700
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0800
     * @tc.name BuiltinsStatementBreakTest0800
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST0900
     * @tc.name BuiltinsStatementBreakTest0900
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1000
     * @tc.name BuiltinsStatementBreakTest1000
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1100
     * @tc.name BuiltinsStatementBreakTest1100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1200
     * @tc.name BuiltinsStatementBreakTest1200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1300
     * @tc.name BuiltinsStatementBreakTest1300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1400
     * @tc.name BuiltinsStatementBreakTest1400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1500
     * @tc.name BuiltinsStatementBreakTest1500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1600
     * @tc.name BuiltinsStatementBreakTest1600
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1700
     * @tc.name BuiltinsStatementBreakTest1700
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1800
     * @tc.name BuiltinsStatementBreakTest1800
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST1900
     * @tc.name BuiltinsStatementBreakTest1900
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2000
     * @tc.name BuiltinsStatementBreakTest2000
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let shouldBreak = false;
      outerBlock: while(!shouldBreak) {
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
          console.log(`Caught error:` + JSON.stringify(error));
          break outerBlock;
        }
        console.log('This code will not execute if shouldBreak becomes true.');
      }
      console.log('Exited the outer block.');
      expect(shouldBreak).assertTrue();
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2100
     * @tc.name BuiltinsStatementBreakTest2100
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag = false;
      let value = 1;
      outerLogic: while(!flag) {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2200
     * @tc.name BuiltinsStatementBreakTest2200
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const checkConditions = () => {
        let shouldExit = false;
        outerLogic: while(!shouldExit) {
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
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2300
     * @tc.name BuiltinsStatementBreakTest2300
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let shouldStop = false;
      const randomValue = 1;
      if (randomValue > 0.7) {
        shouldStop = true;
        console.log('Condition met. shouldStop is set to true.');
      } else {
        console.log('Condition not met. shouldStop remains false.');
      }
      expect(shouldStop).assertTrue();
      done();
    });


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2400
     * @tc.name BuiltinsStatementBreakTest2400
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let isAllConditionsMet = false;
      let outerCounter = 0;
      let middleCounter = 0;
      let innerCounter = 0;

      outer: while (!isAllConditionsMet) {
        outerCounter++;
        let outerEntry = (outerCounter % 5 === 0);
        if (outerEntry) {
          outer1: while (!isAllConditionsMet) {
            middleCounter++;
            let middleEntry = (middleCounter % 3 === 0);
            if (middleEntry) {
              outer2: while (!isAllConditionsMet) {
                innerCounter++;
                if (innerCounter >= 2) {
                  isAllConditionsMet = true;
                  break outer2;
                }
              }
            }
            if (middleCounter > 100) break outer1;
          }
        }
        if (outerCounter > 100) break outer;
      }
      console.log(`Final Counter: O:${outerCounter}, M:${middleCounter}, I:${innerCounter}`);
      expect(isAllConditionsMet).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_BREAK_TEST2500
     * @tc.name BuiltinsStatementBreakTest2500
     * @tc.desc test Break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsStatementBreakTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let isAllConditionsPassed = false;
      let innerBreakCount = 0;
      let middleBreakCount = 0;
      outerLoop: for (let i = 0; i < 5; i++) {
        middleLoop: for (let j = 0; j < 5; j++) {
          innerLoop: for (let k = 0; k < 5; k++) {
            if (i === 0 && j === 0 && k === 2) {
              innerBreakCount++;
              break innerLoop;
            }
            if (i === 0 && j === 2) {
              middleBreakCount++;
              break middleLoop;
            }
            if (i === 1) {
              isAllConditionsPassed = true;
              break outerLoop;
            }
          }
        }
      }
      expect(innerBreakCount).assertEqual(1);
      expect(middleBreakCount).assertEqual(1);
      expect(isAllConditionsPassed).assertTrue();
      done();
    })

  })
}
