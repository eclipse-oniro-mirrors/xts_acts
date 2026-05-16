'use static'

/*
* Copyright (C) 2026 HiHope Open Source Organization.
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


export function BuiltinsStatementBreakTest0100() {
  const TAG = 'BuiltinsStatementBreakTest0100';
  let count = 0;
  while (true) {
    console.log(`count: ${count}`);
    count++;
    if (count >= 5) {
      break;
    }
  }
  if (count !== 5) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 5');
  }
}

export function BuiltinsStatementBreakTest0200() {
  const TAG = 'BuiltinsStatementBreakTest0200';
  let count = 0;
  for (count; count <= 10; count++) {
    console.log(`count: ${count}`);
    if (count === 5) {
      break;
    }
  }
  if (count !== 5) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 5');
  }
}

export function BuiltinsStatementBreakTest0300() {
  const TAG = 'BuiltinsStatementBreakTest0300';
  let count = 0;
  do {
    console.log(`count: ${count}`);
    count++;
    if (count === 5) {
      break;
    }
  } while (true);
  if (count !== 5) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 5');
  }
}

export function BuiltinsStatementBreakTest0400() {
  const TAG = 'BuiltinsStatementBreakTest0400';
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
  if (num !== 0) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 0');
  }
}

export function BuiltinsStatementBreakTest0500() {
  const TAG = 'BuiltinsStatementBreakTest0500';
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
  if (num !== -2) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected -2');
  }
}

export function BuiltinsStatementBreakTest0600() {
  const TAG = 'BuiltinsStatementBreakTest0600';
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
  if (loopResult !== 100) {
    console.info(`${TAG} Task execution failed: loopResult: ${loopResult}`);
    throw new Error('loopResult check failed, expected 100');
  }
}

export function BuiltinsStatementBreakTest0700() {
  const TAG = 'BuiltinsStatementBreakTest0700';
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
  if (!shouldBreak) {
    console.info(`${TAG} Task execution failed: shouldBreak: ${shouldBreak}`);
    throw new Error('shouldBreak is not true');
  }
}

export function BuiltinsStatementBreakTest0800() {
  const TAG = 'BuiltinsStatementBreakTest0800';
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
  if (result !== -1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -1');
  }
}

export function BuiltinsStatementBreakTest0900() {
  const TAG = 'BuiltinsStatementBreakTest0900';
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
  if (result !== 21) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 21');
  }
}

export function BuiltinsStatementBreakTest1000() {
  const TAG = 'BuiltinsStatementBreakTest1000';
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
  if (!loopResult) {
    console.info(`${TAG} Task execution failed: loopResult: ${loopResult}`);
    throw new Error('loopResult is not true');
  }
}

export function BuiltinsStatementBreakTest1100() {
  const TAG = 'BuiltinsStatementBreakTest1100';
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
  if (count !== 5) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 5');
  }
}

export function BuiltinsStatementBreakTest1200() {
  const TAG = 'BuiltinsStatementBreakTest1200';
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
  if (outerCounter !== 1) {
    console.info(`${TAG} Task execution failed: outerCounter: ${outerCounter}`);
    throw new Error('outerCounter check failed, expected 1');
  }
}

export function BuiltinsStatementBreakTest1300() {
  const TAG = 'BuiltinsStatementBreakTest1300';
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
  if (outerCounter !== 4) {
    console.info(`${TAG} Task execution failed: outerCounter: ${outerCounter}`);
    throw new Error('outerCounter check failed, expected 4');
  }
}

export function BuiltinsStatementBreakTest1400() {
  const TAG = 'BuiltinsStatementBreakTest1400';
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
  if (num !== 4) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 4');
  }
}

export function BuiltinsStatementBreakTest1500() {
  const TAG = 'BuiltinsStatementBreakTest1500';
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
  if (!conditionMet) {
    console.info(`${TAG} Task execution failed: conditionMet: ${conditionMet}`);
    throw new Error('conditionMet is not true');
  }
}

export function BuiltinsStatementBreakTest1600() {
  const TAG = 'BuiltinsStatementBreakTest1600';
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
  if (shouldBreakOuter) {
    console.info(`${TAG} Task execution failed: shouldBreakOuter: ${shouldBreakOuter}`);
    throw new Error('shouldBreakOuter is not false');
  }

  if (!shouldBreakMiddle) {
    console.info(`${TAG} Task execution failed: shouldBreakMiddle: ${shouldBreakMiddle}`);
    throw new Error('shouldBreakMiddle is not true');
  }

  if (shouldBreakOuter) {
    console.info(`${TAG} Task execution failed: shouldBreakOuter: ${shouldBreakOuter}`);
    throw new Error('shouldBreakOuter is not false');
  }
}

export function BuiltinsStatementBreakTest1700() {
  const TAG = 'BuiltinsStatementBreakTest1700';
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
  if (!breakInner) {
    console.info(`${TAG} Task execution failed: breakInner: ${breakInner}`);
    throw new Error('breakInner is not true');
  }

  if (!breakMiddle) {
    console.info(`${TAG} Task execution failed: breakMiddle: ${breakMiddle}`);
    throw new Error('breakMiddle is not true');
  }

  if (breakOuter) {
    console.info(`${TAG} Task execution failed: breakOuter: ${breakOuter}`);
    throw new Error('breakOuter is not false');
  }
}

export function BuiltinsStatementBreakTest1800() {
  const TAG = 'BuiltinsStatementBreakTest1800';
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
  if (!shouldBreakLoopA) {
    console.info(`${TAG} Task execution failed: shouldBreakLoopA: ${shouldBreakLoopA}`);
    throw new Error('shouldBreakLoopA is not true');
  }

  if (shouldBreakLoopB) {
    console.info(`${TAG} Task execution failed: shouldBreakLoopB: ${shouldBreakLoopB}`);
    throw new Error('shouldBreakLoopB is not false');
  }

  if (shouldBreakOuter) {
    console.info(`${TAG} Task execution failed: shouldBreakOuter: ${shouldBreakOuter}`);
    throw new Error('shouldBreakOuter is not false');
  }
}

export function BuiltinsStatementBreakTest1900() {
  const TAG = 'BuiltinsStatementBreakTest1900';
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
  if (!breakToInner) {
    console.info(`${TAG} Task execution failed: breakToInner: ${breakToInner}`);
    throw new Error('breakToInner is not true');
  }

  if (!breakToMiddle) {
    console.info(`${TAG} Task execution failed: breakToMiddle: ${breakToMiddle}`);
    throw new Error('breakToMiddle is not true');
  }

  if (!breakToOutermost) {
    console.info(`${TAG} Task execution failed: breakToOutermost: ${breakToOutermost}`);
    throw new Error('breakToOutermost is not true');
  }
}

export function BuiltinsStatementBreakTest2000() {
  const TAG = 'BuiltinsStatementBreakTest2000';
  let shouldBreak = false;
  outerBlock: while (!shouldBreak) {
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
  if (!shouldBreak) {
    console.info(`${TAG} Task execution failed: shouldBreak: ${shouldBreak}`);
    throw new Error('shouldBreak is not true');
  }
}

export function BuiltinsStatementBreakTest2100() {
  const TAG = 'BuiltinsStatementBreakTest2100';
  let flag = false;
  let value = 1;
  outerLogic: while (!flag) {
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
  if (!flag) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag is not true');
  }
}

export function BuiltinsStatementBreakTest2200() {
  const TAG = 'BuiltinsStatementBreakTest2200';
  const checkConditions = () => {
    let shouldExit = false;
    outerLogic: while (!shouldExit) {
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
  if (!flag) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag is not true');
  }
}

export function BuiltinsStatementBreakTest2300() {
  const TAG = 'BuiltinsStatementBreakTest2300';
  let shouldStop = false;
  const randomValue = 1;
  if (randomValue > 0.7) {
    shouldStop = true;
    console.log('Condition met. shouldStop is set to true.');
  } else {
    console.log('Condition not met. shouldStop remains false.');
  }
  if (!shouldStop) {
    console.info(`${TAG} Task execution failed: shouldStop: ${shouldStop}`);
    throw new Error('shouldStop is not true');
  }
}

export function BuiltinsStatementBreakTest2400() {
  const TAG = 'BuiltinsStatementBreakTest2400';
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
        if (middleCounter > 100) {
          break outer1;
        }
      }
    }
    if (outerCounter > 100) {
      break outer;
    }
  }
  console.log(`Final Counter: O:${outerCounter}, M:${middleCounter}, I:${innerCounter}`);
  if (!isAllConditionsMet) {
    console.info(`${TAG} Task execution failed: isAllConditionsMet: ${isAllConditionsMet}`);
    throw new Error('isAllConditionsMet is not true');
  }
}

export function BuiltinsStatementBreakTest2500() {
  const TAG = 'BuiltinsStatementBreakTest2500';
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
  if (innerBreakCount !== 1) {
    console.info(`${TAG} Task execution failed: innerBreakCount: ${innerBreakCount}`);
    throw new Error('innerBreakCount check failed, expected 1');
  }

  if (middleBreakCount !== 1) {
    console.info(`${TAG} Task execution failed: middleBreakCount: ${middleBreakCount}`);
    throw new Error('middleBreakCount check failed, expected 1');
  }

  if (!isAllConditionsPassed) {
    console.info(`${TAG} Task execution failed: isAllConditionsPassed: ${isAllConditionsPassed}`);
    throw new Error('isAllConditionsPassed is not true');
  }
}
