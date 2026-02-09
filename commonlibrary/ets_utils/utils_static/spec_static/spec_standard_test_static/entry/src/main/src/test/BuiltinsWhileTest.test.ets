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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "../../../hypium/index";
import { getNumber, MyClass, MyColor, MyObject, shouldContinue } from "./pages/Utils";

export default function builtinsWhileTest() {
  describe('builtinsStatementWhileTest', (): void => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0100
     * @tc.name builtinsStatementWhileTest0100
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (0) {    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        console.log('print:this is while statement' + 0);
        executed1 = true;
      }
      ;
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + 0);
        executed2 = true;
      } while (0);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0200
     * @tc.name builtinsStatementWhileTest0200
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (NaN) {
        console.log('print:this is while statement' + NaN);
        executed1 = true;
      }
      expect(executed1).assertEqual(!true)
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + NaN);
        executed2 = true;
      } while (NaN);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0300
     * @tc.name builtinsStatementWhileTest0300
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while ("") {
        console.log('print:this is while statement' + "");
        executed1 = true;
      }
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + "");
        executed2 = true;
      } while ("");
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0400
     * @tc.name builtinsStatementWhileTest0400
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (null) {
        console.log('print:this is while statement' + null);
        executed1 = true;
      }
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + null);
        executed2 = true;
      } while (null);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0500
     * @tc.name builtinsStatementWhileTest0500
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (undefined) {
        console.log('print:this is while statement' + undefined);
        executed1 = true;
      }
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + undefined);
        executed2 = true;
      } while (undefined);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0600
     * @tc.name builtinsStatementWhileTest0600
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (!'s') {
        console.log('print:this is while statement' + !'s');
        executed1 = true;
      }
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + !'s');
        executed2 = true;
      } while (!'s');
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0700
     * @tc.name builtinsStatementWhileTest0700
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (!0) {
        console.log('print:this is while statement' + !0);
        executed1 = true;
        break;
      }
      ;
      expect(executed1).assertEqual(true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + !0);
        executed2 = true;
        break;
      } while (!0);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0800
     * @tc.name builtinsStatementWhileTest0800
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (true) {
        console.log('print:this is while statement' + true);
        executed1 = true;
        break;
      }
      expect(executed1).assertEqual(true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + true);
        executed2 = true;
        break;
      } while (true);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_0900
     * @tc.name builtinsStatementWhileTest0900
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed1 = false;
      while (false) {
        console.log('print:this is while statement' + false);
        executed1 = true;
      }
      ;
      expect(executed1).assertEqual(!true);
      let executed2 = false;
      do {
        console.log('print:this is do while statement' + false);
        executed2 = true;
      } while (false);
      expect(executed2).assertEqual(true);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1000
     * @tc.name builtinsStatementWhileTest1000
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count1 = 1;
      let count2 = 1;
      while (shouldContinue()) {
        count1++;
      }
      do {
        count2++;
      } while (shouldContinue());
      expect(4).assertEqual(count1);
      expect(2).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1100
     * @tc.name builtinsStatementWhileTest1100
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count = 1;
      let limit = 5;
      let isRunning = true;
      while (count < limit && isRunning) {
        count++;
        if (count === 3) {
          isRunning = false;
        }
      }
      let x = 0;
      let y = 3;
      let max = 5;
      do {
        console.log(`x: ${x}, y: ${y}`);
        x++;
        y--;
      } while (x < max || y > 0)
      let a = 0;
      let b = 5;
      let c = false;
      while ((a < 3 && b > 2) || !c) {
        console.log(`a: ${a}, b: ${b}, c: ${c}`);
        a++;
        b--;
        if (a === 2) {
          c = true;
        }
      }
      expect(3).assertEqual(count);
      expect(5).assertEqual(x);
      expect(-2).assertEqual(y);
      expect(3).assertEqual(a);
      expect(2).assertEqual(b);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1200
     * @tc.name builtinsStatementWhileTest1200
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num1: number = 5;
      while (num1) {
        num1--;
      }
      let num2: number = 5;
      do {
        num2--;
      } while (num2);
      expect(0).assertEqual(num1);
      expect(0).assertEqual(num2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1300
     * @tc.name builtinsStatementWhileTest1300
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const arr: number[] = [1, 2, 3, 4];
      let index1 = 0;
      while (arr) {
        if (index1 >= arr.length) {
          break;
        }
        index1++;
      }
      let index2 = 0;
      do {
        if (index2 >= arr.length) {
          break;
        }
        index2++;
      } while (arr);
      expect(4).assertEqual(index1);
      expect(4).assertEqual(index2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1400
     * @tc.name builtinsStatementWhileTest1400
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str: string = "abcd";
      let index1 = 0;
      while (str) {
        if (index1 >= str.length) {
          break;
        }
        index1++;
      }
      ;
      let index2 = 0;
      do {
        if (index2 >= str.length) {
          break;
        }
        index2++;
      } while (str);
      expect(4).assertEqual(index1);
      expect(4).assertEqual(index2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1500
     * @tc.name builtinsStatementWhileTest1500
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const obj: MyObject = {
        a: 1, b: 2, c: 3
      };
      const keys = Object.keys(obj);
      let index1 = 0;
      while (obj) {
        if (index1 >= keys.length) {
          break;
        }
        const key = keys[index1];
        index1++;
      }
      let index2 = 0;
      do {
        if (index2 >= keys.length) {
          break;
        }
        const key = keys[index2];
        index2++;
      } while (obj);
      expect(3).assertEqual(index1);
      expect(3).assertEqual(index2);
      done();
    })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1600
     * @tc.name builtinsStatementWhileTest1600
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementWhileTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   const num: bigint = 3n;
    //   let current1: bigint = num;
    //   while (num) {
    //     if (current1 === 0n) {
    //       break;
    //     }
    //     current1--;
    //   }
    //   let current2: bigint = num;
    //   do {
    //     if (current2 === 0n) {
    //       break;
    //     }
    //     current2--;
    //   } while (num);
    //   expect(0n).assertEqual(current1);
    //   expect(0n).assertEqual(current2);
    //   done();
    // })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_1700
     * @tc.name builtinsStatementWhileTest1700
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const myInstance = new MyClass();
      const keys = Object.keys(myInstance);
      let index1 = 0;
      while (myInstance) {
        if (index1 >= keys.length) {
          break;
        }
        const key = keys[index1];
        index1++;
      }
      let index2 = 0;
      do {
        if (index2 >= keys.length) {
          break;
        }
        const key = keys[index2];
        index2++;
      } while (myInstance)
      expect(3).assertEqual(index1);
      expect(3).assertEqual(index2);
      done();
    })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2000
     * @tc.name builtinsStatementWhileTest2000
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementWhileTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   type MyUnionType = number | string;
    //   const values: MyUnionType[] = [10, "hello", 20, "world"];
    //   let index1 = 0;
    //   while (values[index1]) {
    //     const currentValue = values[index1];
    //     if (typeof currentValue === "string" && currentValue === "world") {
    //       break;
    //     }
    //     index1++;
    //     if (index1 >= values.length) {
    //       break;
    //     }
    //   }
    //   let index2 = 0;
    //   do {
    //     const currentValue = values[index2];
    //     if (typeof currentValue === "string" && currentValue === "world") {
    //       break;
    //     }
    //     index2++;
    //     if (index1 >= values.length) {
    //       break;
    //     }
    //     ;
    //   } while (values[index2]);
    //   expect(3).assertEqual(index1);
    //   expect(3).assertEqual(index2);
    //   done();
    // })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2100
     * @tc.name builtinsStatementWhileTest2100
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementWhileTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   type GenericArray<T> = T[];
    //   const numberArray: GenericArray<number> = [1, 2, 3, 4, 5];
    //   let index1 = 0;
    //   while (numberArray) {
    //     if (index1 >= numberArray.length) {
    //       break;
    //     }
    //     const currentItem = numberArray[index1];
    //     index1++;
    //   }
    //   let index2 = 0;
    //   do {
    //     if (index2 >= numberArray.length) {
    //       break;
    //     }
    //     const currentItem = numberArray[index2];
    //     index2++;
    //   } while (numberArray);
    //   expect(5).assertEqual(index1);
    //   expect(5).assertEqual(index2);
    //   done();
    // })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2200
     * @tc.name builtinsStatementWhileTest2200
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementWhileTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   type Direction = 'up' | 'down' | 'left' | 'right';
    //   let currentDirection: Direction = 'up';
    //   let step1 = 0;
    //   while (currentDirection) {
    //     console.log(`当前方向是: ${currentDirection}`);
    //     if (step1 === 0) {
    //       currentDirection = 'right';
    //     } else if (step1 === 1) {
    //       currentDirection = 'down';
    //     } else if (step1 === 2) {
    //       currentDirection = 'left';
    //     } else {
    //       console.log('循环结束，已经遍历完所有方向');
    //       break;
    //     }
    //     step1++;
    //   }
    //   let step2 = 0;
    //   do {
    //     console.log(`当前方向是: ${currentDirection}`);
    //     // 根据步数改变方向
    //     if (step2 === 0) {
    //       currentDirection = 'right';
    //     } else if (step2 === 1) {
    //       currentDirection = 'down';
    //     } else if (step2 === 2) {
    //       currentDirection = 'left';
    //     } else {
    //       console.log('循环结束，已经遍历完所有方向');
    //       break;
    //     }
    //     step2++;
    //   } while (currentDirection);
    //   expect(3).assertEqual(step1);
    //   expect(3).assertEqual(step2);
    //   done();
    // })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2300
     * @tc.name builtinsStatementWhileTest2300
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num1: number = 0;
      while (0) {
        console.log(`当前数字: ${num1}`);
        num1++;
      }
      let num2: number = 0;
      do {
        console.log(`当前数字: ${num2}`);
        num2++;
      } while (0);
      expect(0).assertEqual(num1);
      expect(1).assertEqual(num2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2400
     * @tc.name builtinsStatementWhileTest2400
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num1: number = 0;
      while (+0.0) {
        console.log(`当前数字: ${num1}`);
        num1++;
      }
      let num2: number = 0;
      do {
        console.log(`当前数字: ${num2}`);
        num2++;
      } while (+0.0);
      expect(0).assertEqual(num1);
      expect(1).assertEqual(num2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2500
     * @tc.name builtinsStatementWhileTest2500
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num1: number = 0;
      while (false) {
        console.log(`当前数字: ${num1}`);
        num1++;
      }
      let num2: number = 0;
      do {
        console.log(`当前数字: ${num2}`);
        num2++;
      } while (false);
      expect(0).assertEqual(num1);
      expect(1).assertEqual(num2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2600
     * @tc.name builtinsStatementWhileTest2600
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num1 = 5;
      let str = "hello";
      while (num1 && str) {
        console.log("所有值都是真值，继续循环");
        num1--;
        if (!num1) {
          console.log("num1 变为假值，跳出循环");
          break;
        }
      }
      let num2 = 0;
      let emptyStr = "";
      let anotherNum = 10;
      do {
        console.log("存在真值，继续循环");
        anotherNum--;
        if (!num2 && !emptyStr && !anotherNum) {
          console.log("所有值都变为假值，跳出循环");
          break;
        }
      } while (num2 || emptyStr || anotherNum);
      expect(0).assertEqual(num1);
      expect(0).assertEqual(anotherNum);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2700
     * @tc.name builtinsStatementWhileTest2700
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const getNextNumber = getNumber();
      let count1 = 0;
      while (getNextNumber()) {
        console.log(`当前数字: ${getNextNumber()}`);
        count1++;
      }
      let count2 = 0;
      do {
        console.log(`当前数字: ${getNextNumber()}`);
        count2++;
      } while (getNextNumber());
      expect(3).assertEqual(count1);
      expect(1).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2800
     * @tc.name builtinsStatementWhileTest2800
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      while (false) {
      }
      ;
      do {
      } while (false);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_2900
     * @tc.name builtinsStatementWhileTest2900
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let condition1 = true;
      let count1 = 0;
      while (condition1) {
        condition1 = false;
        count1++;
      }
      let condition2 = true;
      let count2 = 0;
      do {
        condition2 = false;
        count2++;
      } while (condition2);
      expect(1).assertEqual(count1);
      expect(1).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3000
     * @tc.name builtinsStatementWhileTest3000
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const maxIterations = 5
      let count1 = 0;
      while (count1 < maxIterations) {
        count1++;
      }
      let count2 = 0;
      do {
        count2++;
      } while (count2 < maxIterations);
      expect(5).assertEqual(count1);
      expect(5).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3100
     * @tc.name builtinsStatementWhileTest3100
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      while (false) {
        console.log('This is the loop body and it will not be executed.');
      }
      ;
      do {
        console.log('This is the loop body and it will not be executed a second time.');
      } while (false);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3200
     * @tc.name builtinsStatementWhileTest3200
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count1 = 0;
      try {
        while (count1 < 5) {
          if (count1 === 3) {
            throw new Error('Throw an exception when Count1 reaches 3');
          }
          console.log(`The current value of count1: ${count1}`);
          count1++;
        }
      } catch (error) {
        error = error as Error;
        console.error(`Exception caught: ${error.message}`);
      } finally {
        console.log('The finally block executes regardless of whether there is an exception');
      }
      let count2 = 0;
      try {
        do {
          if (count2 === 3) {
            throw new Error('Throw an exception when Count2 reaches 3');
          }
          console.log(`The current value of count2: ${count2}`);
          count2++;
        } while (count2 < 5);
      } catch (error) {
        error = error as Error;
        console.error(`Exception caught: ${error.message}`);
      } finally {
        console.log('The finally block executes regardless of whether there is an exception');
      }
      expect(3).assertEqual(count1);
      expect(3).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3300
     * @tc.name builtinsStatementWhileTest3300
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count1 = 0;
      while (count1 < 5) {
        count1 = count1 + 1;
        console.log(`The value of num within the loop: ${count1}`);
      }
      expect(5).assertEqual(count1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3400
     * @tc.name builtinsStatementWhileTest3400
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let count2 = 0;
      do {
        count2 = count2 + 1;
        console.log(`The value of num within the loop: ${count2}`);
      } while (count2 < 5);
      expect(5).assertEqual(count2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3500
     * @tc.name builtinsStatementWhileTest3500
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let loopIndex1 = 0;
      while (loopIndex1 < 3) {
        let innerVar = loopIndex1 * 2;
        console.log(`The value of innerVar within the loop: ${innerVar}`);
        loopIndex1++;
      }
      expect(3).assertEqual(loopIndex1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3600
     * @tc.name builtinsStatementWhileTest3600
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let loopIndex2 = 0;
      do {
        let innerVar = loopIndex2 * 2;
        console.log(`The value of innerVar within the loop: ${innerVar}`);
        loopIndex2++;
      } while (loopIndex2 < 5);
      expect(5).assertEqual(loopIndex2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3700
     * @tc.name builtinsStatementWhileTest3700
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num = 0;
      while (num < 10) {
        num++;
      }
      console.log(`The final cumulative data: ${num}`);
      expect(10).assertEqual(num);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3800
     * @tc.name builtinsStatementWhileTest3800
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num = 0;
      do {
        num++;
      } while (num < 10);
      console.log(`The final cumulative data: ${num}`);
      expect(10).assertEqual(num);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_3900
     * @tc.name builtinsStatementWhileTest3900
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let outerCounter = 0;
      while (outerCounter < 3) {
        console.log(`The first iteration of the outer loop ${outerCounter + 1}`);
        let innerCounter = 0;
        while (innerCounter < 2) {
          console.log(` The first iteration of the inner loop is ${innerCounter +
            1} and the current iteration of the outer loop is ${outerCounter + 1}.`);
          innerCounter++;
        }
        outerCounter++;
      }
      expect(3).assertEqual(outerCounter);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_4000
     * @tc.name builtinsStatementWhileTest4000
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let outerCounter = 0;
      do {
        console.log(`The outer do-while loop is the first iteration of ${outerCounter + 1}`);
        let innerCounter = 0;
        do {
          console.log(`  The first iteration of the inner do-while loop is ${innerCounter +
            1} and the current iteration of the outer do-while loop is ${outerCounter + 1}`);
          innerCounter++;
        } while (innerCounter < 2);
        outerCounter++;
      } while (outerCounter < 3);
      expect(3).assertEqual(outerCounter);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_4100
     * @tc.name builtinsStatementWhileTest4100
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter1 = 0;
      while (counter1 < 2) {
        console.log(`The first loop, the current iteration: ${counter1 + 1}`);
        let counter2 = 0;
        while (counter2 < 2) {
          console.log(`  The second layer loop, the current iteration: ${counter2 +
            1}，Outer loop iteration: ${counter1 + 1}`);
          let counter3 = 0;
          while (counter3 < 2) {
            console.log(`    The third layer loop, the current iteration: ${counter3 +
              1}，Outer loop iteration: ${counter2 + 1}-${counter1 + 1}`);
            let counter4 = 0;
            while (counter4 < 2) {
              console.log(`     Fourth layer loop, current iteration: ${counter4 + 1}，Outer loop iteration: ${counter3 +
                1}-${counter2 + 1}-${counter1 + 1}`);
              let counter5 = 0;
              while (counter5 < 2) {
                console.log(`        The fifth layer loop, the current iteration: ${counter5 +
                  1}，Outer loop iteration: ${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                counter5++;
              }
              counter4++;
            }
            counter3++;
          }
          counter2++;
        }
        counter1++;
      }
      expect(2).assertEqual(counter1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_4200
     * @tc.name builtinsStatementWhileTest4200
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter1 = 0;
      while (counter1 < 2) {
        console.log(`The first loop, the current iteration: ${counter1 + 1}`);
        let counter2 = 0;
        while (counter2 < 2) {
          console.log(`  The second layer loop, the current iteration: ${counter2 +
            1}，Outer loop iteration: ${counter1 + 1}`);
          let counter3 = 0;
          while (counter3 < 2) {
            console.log(`    The third layer loop, the current iteration: ${counter3 +
              1}，Outer loop iteration: ${counter2 + 1}-${counter1 + 1}`);
            let counter4 = 0;
            while (counter4 < 2) {
              console.log(`     Fourth layer loop, current iteration: ${counter4 + 1}，Outer loop iteration: ${counter3 +
                1}-${counter2 + 1}-${counter1 + 1}`);
              let counter5 = 0;
              while (counter5 < 2) {
                console.log(`        The fifth layer loop, the current iteration: ${counter5 +
                  1}，Outer loop iteration: ${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                let counter6 = 0;
                while (counter6 < 2) {
                  console.log(`         Layer 6 loop, current iteration: ${counter6 +
                    1}，Outer loop iteration: ${counter5 + 1}-${counter4 + 1}-${counter3 + 1}-${counter2 +
                    1}-${counter1 + 1}`);
                  let counter7 = 0;
                  while (counter7 < 2) {
                    console.log(`            Layer 7 loop, current iteration: ${counter7 +
                      1}，Outer loop iteration: ${counter6 + 1}-${counter5 + 1}-${counter4 + 1}-${counter3 +
                      1}-${counter2 + 1}-${counter1 + 1}`);
                    let counter8 = 0;
                    while (counter8 < 2) {
                      console.log(`              Layer 8 loop, current iteration: ${counter8 +
                        1}，Outer loop iteration: ${counter7 + 1}-${counter6 + 1}-${counter5 + 1}-${counter4 +
                        1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                      let counter9 = 0;
                      while (counter9 < 2) {
                        console.log(`                Layer 9 loop, current iteration: ${counter9 +
                          1}，Outer loop iteration: ${counter8 + 1}-${counter7 + 1}-${counter6 + 1}-${counter5 +
                          1}-${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                        let counter10 = 0;
                        while (counter10 < 2) {
                          console.log(`                  Layer 10 loop, current iteration: ${counter10 +
                            1}，Outer loop iteration: ${counter9 + 1}-${counter8 + 1}-${counter7 + 1}-${counter6 +
                            1}-${counter5 + 1}-${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                          counter10++;
                        }
                        counter9++;
                      }
                      counter8++;
                    }
                    counter7++;
                  }
                  counter6++;
                }
                counter5++;
              }
              counter4++;
            }
            counter3++;
          }
          counter2++;
        }
        counter1++;
      }
      expect(2).assertEqual(counter1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_4300
     * @tc.name builtinsStatementWhileTest4300
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter1: number = 0;
      do {
        console.log(`The first loop, the current iteration: ${counter1 + 1}`);
        let counter2: number = 0;
        do {
          console.log(`  The second layer loop, the current iteration: ${counter2 +
            1}，Outer loop iteration: ${counter1 + 1}`);
          let counter3: number = 0;
          do {
            console.log(`    The third layer loop, the current iteration: ${counter3 +
              1}，Outer loop iteration: ${counter2 + 1}-${counter1 + 1}`);
            let counter4: number = 0;
            do {
              console.log(`     Fourth layer loop, current iteration: ${counter4 + 1}，Outer loop iteration: ${counter3 +
                1}-${counter2 + 1}-${counter1 + 1}`);
              let counter5: number = 0;
              do {
                console.log(`       The fifth layer loop, the current iteration: ${counter5 +
                  1}，Outer loop iteration: ${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                counter5++;
              } while (counter5 < 2);
              counter4++;
            } while (counter4 < 2);
            counter3++;
          } while (counter3 < 2);
          counter2++;
        } while (counter2 < 2);
        counter1++;
      } while (counter1 < 2);
      expect(2).assertEqual(counter1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_WHILE_TEST_4400
     * @tc.name builtinsStatementWhileTest4400
     * @tc.desc test while and do while
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementWhileTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter1 = 0;
      do {
        console.log(`The first loop, the current iteration: ${counter1 + 1}`);
        let counter2 = 0;
        do {
          console.log(`  The second layer loop, the current iteration: ${counter2 +
            1}，Outer loop iteration: ${counter1 + 1}`);
          let counter3 = 0;
          do {
            console.log(`    The third layer loop, the current iteration: ${counter3 +
              1}，Outer loop iteration: ${counter2 + 1}-${counter1 + 1}`);
            let counter4 = 0;
            do {
              console.log(`      Fourth layer loop, current iteration: ${counter4 +
                1}，Outer loop iteration: ${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
              let counter5 = 0;
              do {
                console.log(`        The fifth layer loop, the current iteration: ${counter5 +
                  1}，Outer loop iteration: ${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                let counter6 = 0;
                do {
                  console.log(`         Layer 6 loop, current iteration: ${counter6 +
                    1}，Outer loop iteration: ${counter5 + 1}-${counter4 + 1}-${counter3 + 1}-${counter2 +
                    1}-${counter1 + 1}`);
                  let counter7 = 0;
                  do {
                    console.log(`            Layer 7 loop, current iteration: ${counter7 +
                      1}，Outer loop iteration: ${counter6 + 1}-${counter5 + 1}-${counter4 + 1}-${counter3 +
                      1}-${counter2 + 1}-${counter1 + 1}`);
                    let counter8 = 0;
                    do {
                      console.log(`              Layer 8 loop, current iteration: ${counter8 +
                        1}，Outer loop iteration: ${counter7 + 1}-${counter6 + 1}-${counter5 + 1}-${counter4 +
                        1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                      let counter9 = 0;
                      do {
                        console.log(`                Layer 9 loop, current iteration: ${counter9 +
                          1}，Outer loop iteration: ${counter8 + 1}-${counter7 + 1}-${counter6 + 1}-${counter5 +
                          1}-${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                        let counter10 = 0;
                        do {
                          console.log(`                  Layer 10 loop, current iteration: ${counter10 +
                            1}，Outer loop iteration: ${counter9 + 1}-${counter8 + 1}-${counter7 + 1}-${counter6 +
                            1}-${counter5 + 1}-${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
                          counter10++;
                        } while (counter10 < 2);
                        counter9++;
                      } while (counter9 < 2);
                      counter8++;
                    } while (counter8 < 2);
                    counter7++;
                  } while (counter7 < 2);
                  counter6++;
                } while (counter6 < 2);
                counter5++;
              } while (counter5 < 2);
              counter4++;
            } while (counter4 < 2);
            counter3++;
          } while (counter3 < 2);
          counter2++;
        } while (counter2 < 2);
        counter1++;
      } while (counter1 < 2);
      expect(2).assertEqual(counter1);
      done();
    })
  })
}