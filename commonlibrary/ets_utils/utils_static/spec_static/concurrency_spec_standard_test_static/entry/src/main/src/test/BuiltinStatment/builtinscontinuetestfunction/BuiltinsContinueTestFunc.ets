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
export function BuiltinsStatementContinueTest0100() {
  const TAG = 'BuiltinsStatementContinueTest0100';
  let num = 1;
  let flag = false
  while (num <= 10) {
    num++;
    if (num % 3 === 0) {
      flag = true
      continue;
    }
  }
  if (!flag) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag is not true');
  }
}

export function BuiltinsStatementContinueTest0200() {
  const TAG = 'BuiltinsStatementContinueTest0200';
  let count = 1;
  let flag = false
  for (count; count <= 10; count++) {
    if (count % 3 === 0) {
      flag = true
      continue;
    }
    console.log(`count: ${count}`);
  }
  if (!flag) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag is not true');
  }
}

export function BuiltinsStatementContinueTest0300() {
  const TAG = 'BuiltinsStatementContinueTest0300';
  const arr = [5, 12, 15, 8, 17, 20, 11];
  let allOddAboveTen = true;
  let i = 0;
  do {
    const currentNum = arr[i];
    if (currentNum <= 10) {
      i++;
      continue;
    }
    if (currentNum % 2 === 0) {
      allOddAboveTen = false;
    }
    i++;
  } while (i < arr.length);
  console.log(`allOddAboveTen:${allOddAboveTen}`);
  if (allOddAboveTen) {
    console.info(`${TAG} Task execution failed: allOddAboveTen: ${allOddAboveTen}`);
    throw new Error('allOddAboveTen is not false');
  }
}

export function BuiltinsStatementContinueTest0400() {
  const TAG = 'BuiltinsStatementContinueTest0400';
  const arr = [1, 3, 2, 4, 1, 5];
  let hasElementTwo = false;
  let index = 0;
  do {
    const currentElement = arr[index] as int;
    switch (currentElement) {
      case 1:
        index++;
        continue;
      case 2:
        hasElementTwo = true;
        break;
      default:
        break;
    }
    index++;
  } while (index < arr.length);
  console.log(`Does the array have the element 2? ${hasElementTwo}`);
  if (!hasElementTwo) {
    console.info(`${TAG} Task execution failed: hasElementTwo: ${hasElementTwo}`);
    throw new Error('hasElementTwo is not true');
  }
}

export function BuiltinsStatementContinueTest0500() {
  const TAG = 'BuiltinsStatementContinueTest0500';
  const array = [1, 3, 2, 4, 1, 5];
  let elementFound = false;
  let index = 0;
  do {
    const current = array[index] as int;
    const shouldCheck = index < array.length;
    if (shouldCheck) {
      switch (current) {
        case 2:
          elementFound = true;
        default:
          index++;
      }
    }
  } while (index < array.length);
  console.log(`Does the array contain the element 2? ${elementFound}`);
  if (!elementFound) {
    console.info(`${TAG} Task execution failed: elementFound: ${elementFound}`);
    throw new Error('elementFound is not true');
  }
}

export function BuiltinsStatementContinueTest0600() {
  const TAG = 'BuiltinsStatementContinueTest0600';
  const twoDArray = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  let outerIndex = 0;
  let hasAllElementsGreaterThanTwo = false;
  do {
    let innerIndex = 0;
    const currentRow = twoDArray[outerIndex];
    let allGreater = true;
    do {
      const currentElement = currentRow[innerIndex];
      if (currentElement <= 2) {
        allGreater = false;
        innerIndex++;
        continue;
      }
      innerIndex++;
    } while (innerIndex < currentRow.length);
    if (allGreater) {
      hasAllElementsGreaterThanTwo = true;
    }
    outerIndex++;
  } while (outerIndex < twoDArray.length);
  console.log(`Is there a sub - array where all elements are greater than 2? ${hasAllElementsGreaterThanTwo}`);
  if (!hasAllElementsGreaterThanTwo) {
    console.info(`${TAG} Task execution failed: hasAllElementsGreaterThanTwo: ${hasAllElementsGreaterThanTwo}`);
    throw new Error('hasAllElementsGreaterThanTwo is not true');
  }
}

export function BuiltinsStatementContinueTest0700() {
  const TAG = 'BuiltinsStatementContinueTest0700';
  const simulateContinueOutsideLoop = () => {
    throw new Error('continue used outside of a loop context');
  };
  const handleLoopWithPossibleException = () => {
    try {
      const array = [1, 2, 3, 4, 5];
      for (let i = 0; i < array.length; i++) {
        if (array[i] === 3) {
          continue;
        }
        if (array[i] === 4) {
          simulateContinueOutsideLoop();
        }
      }
      return true;
    } catch (error) {
      console.error(`An error occurred: ` + JSON.stringify(error));
      return false;
    }
  };
  const result = handleLoopWithPossibleException();
  if (result) {
    console.log('The operation completed successfully.');
  } else {
    console.log('An exception occurred during the operation.');
  }
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function BuiltinsStatementContinueTest0800() {
  const TAG = 'BuiltinsStatementContinueTest0800';
  let index = 0;
  let processedCount = 0;
  let skippedCount = 0;

  while (index < 10) {
    switch (index) {
      case 0:
      case 1:
      case 2:
        // Skip first three indices using continue
        skippedCount++;
        index++;
        continue;
      default:
      // Process remaining indices
        processedCount++;
        index++;
        break;
    }
  }

  // Verify that 3 indices were skipped and 7 were processed
  if (skippedCount !== 3) {
    console.info(`${TAG} Task execution failed: skippedCount: ${skippedCount}`);
    throw new Error('skippedCount check failed, expected 3');
  }

  if (processedCount !== 7) {
    console.info(`${TAG} Task execution failed: processedCount: ${processedCount}`);
    throw new Error('processedCount check failed, expected 7');
  }

  if (index !== 10) {
    console.info(`${TAG} Task execution failed: index: ${index}`);
    throw new Error('index check failed, expected 10');
  }
}

export function BuiltinsStatementContinueTest0900() {
  const TAG = 'BuiltinsStatementContinueTest0900';
  const processArray = () => {
    const numbers = [1, 2, 3, 4, 5];
    let sum = 0;
    for (let i = 0; i < numbers.length; i++) {
      if (numbers[i] % 2 === 0) {
        continue;
      }
      sum += numbers[i];
    }
    return sum === 9;
  }
  const result = processArray();
  console.log(result + 'The array processing should complete as expected.');
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function BuiltinsStatementContinueTest1000() {
  const TAG = 'BuiltinsStatementContinueTest1000';
  let outerCount = 0;
  let innerCount = 0;
  outerLoop: while (outerCount < 3) {
    while (innerCount < 3) {
      if (outerCount === 1 && innerCount === 1) {
        console.log(`  Condition met, skip remaining of current outer loop iteration`);
        continue outerLoop;
      }
      innerCount++;
    }
    outerCount++;
  }
  console.log(`Inner loop iteration ${innerCount}`);
  console.log(`Outer loop iteration ${outerCount} ends`);
  if (outerCount !== 3) {
    console.info(`${TAG} Task execution failed: outerCount: ${outerCount}`);
    throw new Error('outerCount check failed, expected 3');
  }

  if (innerCount !== 3) {
    console.info(`${TAG} Task execution failed: innerCount: ${innerCount}`);
    throw new Error('innerCount check failed, expected 3');
  }
}

export function BuiltinsStatementContinueTest1100() {
  const TAG = 'BuiltinsStatementContinueTest1100';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      if (i === 1 && j === 1) {
        console.log(`Skipping iteration when i = 1 and j = 1`);
        continue outerLoop;
      }
      total += i + j;
    }
  }
  if (total !== 13) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 13');
  }
}

export function BuiltinsStatementContinueTest1200() {
  const TAG = 'BuiltinsStatementContinueTest1200';
  let total = 0;
  let outerIndex = 0;
  let innerIndex = 0;
  outerLoop: do {
    innerIndex = 0;
    do {
      const combinedIndex = outerIndex * 3 + innerIndex;
      switch (combinedIndex) {
        case 4:
          console.log("Breaking out of outer loop at index (outerIndex = 1, innerIndex = 1)");
          break outerLoop;
        default:
          total += outerIndex + innerIndex;
          break;
      }
      innerIndex++;
    } while (innerIndex < 3);
    outerIndex++;
  } while (outerIndex < 3);
  console.log(`The final total is: ${total}`);
  if (total !== 4) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 4');
  }
}

export function BuiltinsStatementContinueTest1300() {
  const TAG = 'BuiltinsStatementContinueTest1300';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      if (i === 1 && j === 1) {
        console.log("Skipping iteration: i = 1, j = 1");
        continue outerLoop;
      }
      total += i + j;
    }
  }
  console.log(`The final result is: ${total}`);
  if (total !== 13) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 13');
  }
}

export function BuiltinsStatementContinueTest1400() {
  const TAG = 'BuiltinsStatementContinueTest1400';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      switch (i * 3 + j) {
        case 4:
          console.log("Breaking out of outer loop at index (i = 1, j = 1)");
          break outerLoop;
        default:
          total += i + j;
          break;
      }
    }
  }
  console.log(`The final sum is: ${total}`);
  if (total !== 4) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 4');
  }
}

export function BuiltinsStatementContinueTest1500() {
  const TAG = 'BuiltinsStatementContinueTest1500';
  let total = 0;
  let outerCount = 0;
  let innerCount = 0;
  outerLoop: do {
    innerCount = 0;
    do {
      const index = outerCount * 3 + innerCount;
      switch (index) {
        case 1:
          console.log(`Index is 1, skipping this inner iteration`);
        case 2:
          console.log(`Index is 2, moving to next outer iteration`);
          outerCount++;
          continue outerLoop;
        default:
          total += outerCount + innerCount;
      }
      innerCount++;
    } while (innerCount < 3);
    outerCount++;
  } while (outerCount < 3);
  console.log(`The final result is: ${total}`);
  if (total !== 15) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 15');
  }
}

export function BuiltinsStatementContinueTest1600() {
  const TAG = 'BuiltinsStatementContinueTest1600';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    middleLoop: for (let j = 0; j < 3; j++) {
      for (let k = 0; k < 3; k++) {
        if (i === 1 && j === 1 && k === 1) {
          console.log("Using continue to skip the middle loop iteration");
          continue middleLoop;
        }
        total += i + j + k;
      }
    }
  }
  console.log(`The final sum is: ${total}`);
  if (total !== 74) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 74');
  }
}

export function BuiltinsStatementContinueTest1700() {
  const TAG = 'BuiltinsStatementContinueTest1700';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    middleLoop: for (let j = 0; j < 3; j++) {
      innerLoop: for (let k = 0; k < 3; k++) {
        if (i === 1 && j === 1 && k === 1) {
          console.log("Using continue to skip the inner loop iteration");
          continue innerLoop;
        }
        if (i === 1 && j === 1) {
          console.log("Using continue to skip the middle loop iteration");
          continue middleLoop;
        }
        if (i === 1) {
          console.log("Using continue to skip the outer loop iteration");
          continue outerLoop;
        }
        total += i + j + k;
      }
    }
  }
  console.log(`The final total is: ${total}`);
  if (total !== 54) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 54');
  }
}

export function BuiltinsStatementContinueTest1800() {
  const TAG = 'BuiltinsStatementContinueTest1800';
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    middleLoop1: for (let j = 0; j < 3; j++) {
      middleLoop2: for (let k = 0; k < 3; k++) {
        if (i === 1 && j === 1 && k === 1) {
          console.log("Continue middleLoop1");
          continue middleLoop1;
        }
        if (i === 1 && j === 2 && k === 2) {
          console.log("Continue middleLoop2");
          continue middleLoop2;
        }
        if (i === 2) {
          console.log("Continue outerLoop");
          continue outerLoop;
        }
        total += i + j + k;
      }
    }
  }
  console.log(`The final sum is: ${total}`);
  if (total !== 33) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 33');
  }
}

export function BuiltinsStatementContinueTest1900() {
  const TAG = 'BuiltinsStatementContinueTest1900';
  let total = 0;
  outerMostLoop: for (let i = 0; i < 3; i++) {
    outerLoop: for (let j = 0; j < 3; j++) {
      middleLoop: for (let k = 0; k < 3; k++) {
        innerLoop: for (let l = 0; l < 3; l++) {
          if (i === 0 && j === 1 && k === 1 && l === 1) {
            console.log("Continue innerLoop");
            continue innerLoop;
          }
          if (i === 0 && j === 1 && k === 2) {
            console.log("Continue middleLoop");
            continue middleLoop;
          }
          if (i === 1 && j === 2) {
            console.log("Continue outerLoop");
            continue outerLoop;
          }
          if (i === 2) {
            console.log("Continue outerMostLoop");
            continue outerMostLoop;
          }
          total += i + j + k + l;
        }
      }
    }
  }
  console.log(`The final total is: ${total}`);
  if (total !== 129) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 129');
  }
}

export function BuiltinsStatementContinueTest2000() {
  const TAG = 'BuiltinsStatementContinueTest2000';
  const tasks = [1, 2, 3, 4, 5];
  let allTasksSuccess = true;
  for (const task of tasks) {
    try {
      if (task === 3) {
        throw new Error(`Task ${task} failed due to an internal issue.`);
      }
      console.log(`Task ${task} processed successfully.`);
    } catch (error) {
      if (error instanceof Error) {
        console.log(`Error processing task ${task}: ${error.message}`);
        allTasksSuccess = false;
        continue;
      }
    }
    console.log(`Additional steps after task ${task} success.`);
  }
  if (allTasksSuccess) {
    console.info(`${TAG} Task execution failed: allTasksSuccess: ${allTasksSuccess}`);
    throw new Error('allTasksSuccess is not false');
  }
}

export function BuiltinsStatementContinueTest2100() {
  const TAG = 'BuiltinsStatementContinueTest2100';
  const processSingleTask = (taskId: number) => {
    try {
      if (taskId === 3) {
        throw new Error(`Task ${taskId} failed due to an exception.`);
      }
      console.log(`Task ${taskId} processed successfully.`);
      return true;
    } catch (error) {
      if (error instanceof Error) {
        console.log(`Error processing task ${taskId}: ${error.message}`);
        return false;
      }
      return false;
    }
  }
  const processAllTasks = () => {
    const tasks = [1, 2, 3, 4, 5];
    for (const task of tasks) {
      const result = processSingleTask(task);
      if (!result) {
        continue;
      }
    }
    return true;
  }
  const allTasksSuccess = processAllTasks();
  if (!allTasksSuccess) {
    console.info(`${TAG} Task execution failed: allTasksSuccess: ${allTasksSuccess}`);
    throw new Error('allTasksSuccess is not true');
  }
}

export function BuiltinsStatementContinueTest2200() {
  const TAG = 'BuiltinsStatementContinueTest2200';
  let value = 1
  const mightThrowError = () => {
    if (value > 0.5) {
      throw new Error('An error occurred during the operation.');
    }
    console.log('Operation completed successfully.');
    return true;
  }
  let overallResult: boolean = false;
  try {
    const result = mightThrowError();
    overallResult = result;
    console.log('Proceeding with subsequent operations...');
  } catch (error) {
    if (error instanceof Error) {
      console.log(`Caught an error: ${error.message}`);
    }
  }
  if (overallResult) {
    console.info(`${TAG} Task execution failed: overallResult: ${overallResult}`);
    throw new Error('overallResult is not false');
  }
}

export function BuiltinsStatementContinueTest2300() {
  const TAG = 'BuiltinsStatementContinueTest2300';
  let overallResult: boolean = false;
  try {
    const randomValue = 0.3;
    if (randomValue < 0.5) {
      throw new Error('An error occurred during the operation.');
    }
    console.log('Operation completed successfully.');
    overallResult = true;
    console.log('Performing follow - up tasks after successful operation.');
  } catch (error) {
    if (error instanceof Error) {
      console.log(`Error caught: ${error.message}`);
    }
  }
  if (overallResult) {
    console.info(`${TAG} Task execution failed: overallResult: ${overallResult}`);
    throw new Error('overallResult is not false');
  }
}

export function BuiltinsStatementContinueTest2400() {
  const TAG = 'BuiltinsStatementContinueTest2400';
  const tasks = [1, 2, 3, 4, 5];
  let allTasksSuccess = true;
  outerLoop: for (let i = 0; i < tasks.length; i++) {
    const task = tasks[i];
    outerLoop1: for (let j = 0; j < 2; j++) {
      try {
        if (task === 3) {
          throw new Error(`Task ${task} failed due to an internal issue.`);
        }
        console.log(`Task ${task} processed successfully.`);
      } catch (error) {
        if (error instanceof Error) {
          console.log(`Error processing task ${task}: ${error.message}`);
          allTasksSuccess = false;
          continue outerLoop1;
        }
      }
      console.log(`Additional steps after task ${task} success.`);
    }
  }
  if (allTasksSuccess) {
    console.info(`${TAG} Task execution failed: allTasksSuccess: ${allTasksSuccess}`);
    throw new Error('allTasksSuccess is not false');
  }
}

export function BuiltinsStatementContinueTest2500() {
  const TAG = 'BuiltinsStatementContinueTest2500';
  const tasks = [1, 2, 3, 4, 5];
  let allTasksSuccess = true;
  outerLoop: for (let i = 0; i < tasks.length; i++) {
    const task = tasks[i];
    outerLoop1: for (let j = 0; j < 2; j++) {
      try {
        if (task === 3) {
          throw new Error(`Task ${task} failed due to an internal issue.`);
        }
        console.log(`Task ${task} processed successfully in iteration ${j}.`);
      } catch (error) {
        if (error instanceof Error) {
          console.log(`Error processing task ${task}: ${error.message}`);
          allTasksSuccess = false;
          continue outerLoop1;
        }
      }
      console.log(`Additional steps after task ${task} success in iteration ${j}.`);
    }
    console.log(`Finished processing task ${task} overall.`);
  }
  if (allTasksSuccess) {
    console.info(`${TAG} Task execution failed: allTasksSuccess: ${allTasksSuccess}`);
    throw new Error('allTasksSuccess is not false');
  }
}

export function BuiltinsStatementContinueTest2600() {
  const TAG = 'BuiltinsStatementContinueTest2600';
  const tasks: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  let allTasksSuccess: boolean = true;
  for (const task of tasks) {
    try {
      if (task % 2 === 0) {
        console.log(`Task ${task} is an even number, skipping some steps.`);
        continue;
      }
      if (task === 3) {
        throw new Error(`Task ${task} failed due to an internal issue.`);
      }
      if (task > 7) {
        console.log(`Task ${task} is greater than 7, skipping some steps.`);
        continue;
      }
      console.log(`Task ${task} processed successfully.`);
    } catch (error) {
      if (error instanceof Error) {
        console.log(`Error processing task ${task}: ${error.message}`);
        allTasksSuccess = false;
        continue;
      }
    }
    console.log(`Additional steps after task ${task} success.`);
  }
  ;
  if (allTasksSuccess) {
    console.info(`${TAG} Task execution failed: allTasksSuccess: ${allTasksSuccess}`);
    throw new Error('allTasksSuccess is not false');
  }
}
