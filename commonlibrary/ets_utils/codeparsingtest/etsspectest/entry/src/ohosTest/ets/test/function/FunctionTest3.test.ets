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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';
import {
  addWithDefaultHoistDeep,
  calcCube,
  calcQuintic,
  checkArgsNoReduce,
  checkArgsNoSplice,
  checkArrowNoPrototype,
  checkExprMemoization,
  checkExprMultiCall,
  checkInnerConstShadow,
  checkInnerLetShadow,
  checkIntegerValue,
  checkSafeIntegerValue,
  collectRestArgsComplex,
  collectRestArgsMixed,
  convertArgsToMap,
  convertArgsToSet,
  createAccumulatorClosure,
  createBoundedCounter,
  createCounterWithStep,
  createFiveCounterClosure,
  createMultiplierClosure,
  createSixCounterClosure,
  cubeWithArrow,
  factorialRecursiveWithCache,
  fibonacciHoisted,
  fibonacciRecursiveWithLimit,
  filterArrInClosure,
  freezeObjInClosure,
  gcdTwoNum,
  getArgByIndexEven,
  getArgByIndexOdd,
  getArgLengthAverage,
  getArgLengthMin,
  getArrComplexElemByDestruct,
  getArrDeepElemByDestruct,
  getFixedBoolean,
  getGlobalConfigShadowed,
  getGlobalVarShadowed,
  getOuterVarInDeepNested,
  getRandomBoolean,
  lcmTwoNum,
  mapArrInClosure,
  multiplyWithDefaultHoist,
  numFactorial,
  numSquareRoot,
  parseJsonWithReviver,
  productAllArgs,
  productDefaultAndRest,
  productWithApply,
  productWithArrowRest,
  productWithDefault,
  productWithUndefinedDefault,
  quintWithArrow,
  reverseArr,
  sortArrNum,
  strPadEnd,
  strReplace,
  strToUpper,
  strTruncate,
  sumAllArgs,
  sumDefaultAndRest,
  sumWithArrowRest,
  sumWithDefault,
  sumWithUndefinedDefault
} from './functionutils3';

interface GeneratedTypeLiteralInterface_11 {
  id: number;
}

interface GeneratedTypeLiteralInterface_1 {
  id: number;
}

interface TestPriceJson {
  name: string;
  price: number;
}

export default function functionTest3() {
  describe('FunctionTest3', () => {
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
     * @tc.name   FunctionTest0151
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0151
     * @tc.desc   Function declaration - number fifth power calculation (parameter verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 2;
        const result: number = calcQuintic(input);
        const isInputValid: boolean = typeof input === 'number' && Number.isFinite(input);
        expect(isInputValid).assertTrue();
        expect(result).assertEqual(32); // 2^5
      });

    /**
     * @tc.name   FunctionTest0152
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0152
     * @tc.desc   Anonymous function expression - greatest common divisor of two numbers (parameter validity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 24, b: number = 18;
        const result: number = gcdTwoNum(a, b);
        const isParamsValid: boolean = typeof a === 'number' && typeof b === 'number' && a > 0 && b > 0;
        expect(isParamsValid).assertTrue();
        expect(result).assertEqual(6);
      });

    /**
     * @tc.name   FunctionTest0153
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0153
     * @tc.desc   Named function expression - string replacement (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const str: string = 'hello world', search: string = 'world', replacement: string = 'there';
        const result: string = strReplace(str, search, replacement);
        const isStrValid: boolean = typeof str === 'string';
        expect(isStrValid).assertTrue();
        expect(result).assertEqual('hello there');
      });


    /**
     * @tc.name   FunctionTest0156
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0156
     * @tc.desc   Array parameter - number sorting (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: number[] = [5, 2, 8, 1];
        const sortedArr: number[] = sortArrNum(inputArr);
        expect(Array.isArray(sortedArr)).assertTrue();
        expect(sortedArr[0]).assertEqual(1);
      });

    /**
     * @tc.name   FunctionTest0157
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0157
     * @tc.desc   Function declaration - return fixed boolean value without parameters (type verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: boolean = getFixedBoolean();
        const isResultValid: boolean = typeof result === 'boolean';
        expect(isResultValid).assertTrue();
        expect(result).assertFalse();
      });

    /**
     * @tc.name   FunctionTest0158
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0158
     * @tc.desc   Anonymous function expression - string padding at the end (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const str: string = '5', length: number = 3, padStr: string = '0';
        const result: string = strPadEnd(str, length, padStr);
        expect(typeof result === 'string').assertTrue();
        expect(result).assertEqual('500');
      });

    /**
     * @tc.name   FunctionTest0159
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0159
     * @tc.desc   Named function expression - factorial calculation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 5; // 5! = 120
        const result: number = numFactorial(input);
        const isInputValid: boolean = typeof input === 'number' && input >= 0;
        expect(isInputValid).assertTrue();
        expect(result).assertEqual(120);
      });

    /**
     * @tc.name   FunctionTest0162
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0162
     * @tc.desc   Function expression - result accumulation with multiple calls (state maintenance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const GeneratedDestructObj_1 = checkExprMultiCall(3);
        const total = GeneratedDestructObj_1.total; // Call 3 times, +1 each time
        expect(total).assertEqual(3);
      });

    /**
     * @tc.name   FunctionTest0165
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0165
     * @tc.desc   Recursive call - Fibonacci with upper limit (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const limit: number = 100;
        const result: number[] = fibonacciRecursiveWithLimit(limit);
        expect(Array.isArray(result)).assertTrue();
        expect(result[result.length - 1]).assertEqual(89); // The last Fibonacci number not exceeding 100
      });

    /**
     * @tc.name   FunctionTest0166
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0166
     * @tc.desc   Function hoisting + default parameter calculation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 3, b: number = 4;
        const result: number = multiplyWithDefaultHoist(a, b); // Default c=2
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(24); // 3*4*2
      });

    /**
     * @tc.name   FunctionTest0169
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0169
     * @tc.desc   Function scope - let variable shadowing (block-level scope)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isLetShadowed: boolean = checkInnerLetShadow();
        expect(isLetShadowed).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0170
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0170
     * @tc.desc   Nested function - access outer variables in depth (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 1, b: number = 2;
        const result: number = getOuterVarInDeepNested(a, b);
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(3); // 1+2
      });

    /**
     * @tc.name   FunctionTest0173
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0173
     * @tc.desc   Scope conflict - global variable shadowed by multiple layers (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        globalThis.appConfig = { version: 1.0 };
        const result: number = getGlobalVarShadowed(); // Innermost version=3.0
        expect(typeof globalThis.appConfig === 'object').assertTrue();
        expect(result).assertEqual(3.0);
      });

    /**
     * @tc.name   FunctionTest0174
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0174
     * @tc.desc   Scope - nested function modifies outer array elements (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const outerArr: number[] = [10, 20, 30];
        const modifyElem = (arr: number[]): void => {
          arr[1] = 200;
        };
        modifyElem(outerArr);
        const isChanged: boolean = outerArr[1] === 200;
        expect(isChanged).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0175
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0175
     * @tc.desc   Scope - reassigning function parameters does not affect outer values (value passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        let outerVal: number = 5;
        const reassignParam = (x: number): void => {
          x = 10;
        };
        reassignParam(outerVal);
        const isUnchanged: boolean = outerVal === 5;
        expect(isUnchanged).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0176
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0176
     * @tc.desc   Basic closure - accumulator with step (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const accumulator: (step: number) => number = createAccumulatorClosure(0);
        const first: number = accumulator(5);
        const second: number = accumulator(3);
        expect(typeof accumulator === 'function').assertTrue();
        expect(first).assertEqual(5);
        expect(second).assertEqual(8);
      });

    /**
     * @tc.name   FunctionTest0178
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0178
     * @tc.desc   Closure encapsulation - counter with adjustable step (dynamic modification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const counter = createCounterWithStep(1, 1); // Initial 1, step 1
        counter.setStep(2);
        const first: number = counter.getNext();
        const second: number = counter.getNext();
        expect(typeof counter.setStep === 'function').assertTrue();
        expect(first).assertEqual(1);
        expect(second).assertEqual(3);
      });

    /**
     * @tc.name   FunctionTest0179
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0179
     * @tc.desc   Closure preserving array - filtering elements (condition filtering)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const initArr: number[] = [1, 2, 3, 4, 5];
        const filterFunc: (min: number) => number[] = filterArrInClosure(initArr);
        const filtered: number[] = filterFunc(3);
        expect(Array.isArray(filtered)).assertTrue();
        expect(filtered).assertContain(3); // [3,4,5]
      });

    /**
     * @tc.name   FunctionTest0181
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0181
     * @tc.desc   Multiple closure instances - five independent counters (state isolation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const counters = createFiveCounterClosure();
        const values = Object.values(counters).map(counter => counter());
        expect(values.length).assertEqual(5);
        expect(values.every(v => v === 1)).assertTrue();
        
      });

    /**
     * @tc.name   FunctionTest0182
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0182
     * @tc.desc   Closure handling strings - concatenating history records (state accumulation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const stringTracker: (str: string) => string = (() => {
          let history: string = '';
          return (str: string): string => {
            history += str;
            return history;
          };
        })();
        const first: string = stringTracker('a');
        const second: string = stringTracker('b');
        expect(typeof stringTracker === 'function').assertTrue();
        expect(first).assertEqual('a');
        expect(second).assertEqual('ab');
      });

    /**
     * @tc.name   FunctionTest0183
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0183
     * @tc.desc   Closure handling arrays - adding with deduplication (state maintenance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const uniqueAdder: (val: number) => number[] = (() => {
          const arr: number[] = [];
          return (val: number): number[] => {
            if (!arr.includes(val)) {
              arr.push(val);
            }
            return [...arr];
          };
        })();
        uniqueAdder(1);
        uniqueAdder(2);
        uniqueAdder(1); // Duplicate, not added
        const result: number[] = uniqueAdder(3);
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(3); // [1,2,3]
      });

    /**
     * @tc.name   FunctionTest0184
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0184
     * @tc.desc   arguments object - summation of parameters at even indices (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const args: number[] = [1, 2, 3, 4, 5];
        const result: number = getArgByIndexEven(...args); // Indices 0, 2, 4: 1+3+5=9
        expect(Array.isArray(args)).assertTrue();
        expect(result).assertEqual(9);
      });

    /**
     * @tc.name   FunctionTest0185
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0185
     * @tc.desc   arguments object - minimum parameter count verification (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const length: number = getArgLengthMin(); // No parameters
        expect(typeof length === 'number').assertTrue();
        expect(length).assertEqual(0);
        
      });

    /**
     * @tc.name   FunctionTest0186
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0186
     * @tc.desc   arguments object - conversion to Map (key-value pairs)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const keys: string[] = ['x', 'y'];
        const values: number[] = [10, 20];
        const result: Map<string, number> = convertArgsToMap(keys, values);
        expect(result instanceof Map).assertTrue();
        expect(result.get('y')).assertEqual(20);
      });

    /**
     * @tc.name   FunctionTest0187
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0187
     * @tc.desc   arguments object - summation of all parameters (dynamic quantity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const args: number[] = [3, 5, 7, 9];
        const result: number = sumAllArgs(...args);
        expect(Array.isArray(args)).assertTrue();
        expect(result).assertEqual(24); // 3+5+7+9
      });

    /**
     * @tc.name   FunctionTest0188
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0188
     * @tc.desc   arguments object - non-array characteristics (no splice method)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isSpliceFailed: boolean = checkArgsNoSplice(1, 2, 3);
        expect(isSpliceFailed).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0189
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0189
     * @tc.desc   Default parameters - basic summation characteristics (use of default values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 5;
        const result: number = sumWithDefault(a); // Default b=10
        expect(typeof a === 'number').assertTrue();
        expect(result).assertEqual(15); // 5+10
      });

    /**
     * @tc.name   FunctionTest0190
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0190
     * @tc.desc   Default parameters - passing undefined triggers default for summation (value verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = sumWithUndefinedDefault(undefined, 8); // Default a=2
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(10); // 2+8
      });

    /**
     * @tc.name   FunctionTest0191
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0191
     * @tc.desc   Rest parameters - collecting parameters of mixed types (array characteristics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const restArr: (number | string | boolean)[] = collectRestArgsMixed(1, 'a', true);
        expect(Array.isArray(restArr)).assertTrue();
        expect(restArr[2]).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0192
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0192
     * @tc.desc   Default + rest parameters - mixed summation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = sumDefaultAndRest(2, 3, 4); // Default a=1, rest=[3,4] → 2+3+4=9
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(9);
      });

    /**
     * @tc.name   FunctionTest0194
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0194
     * @tc.desc   Parameter destructuring - deep array element extraction (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: number[][][] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
        const result: number = getArrDeepElemByDestruct(inputArr); // Extract [0][1][0] = 3
        expect(Array.isArray(inputArr)).assertTrue();
        expect(result).assertEqual(3);
      });

    /**
     * @tc.name   FunctionTest0195
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0195
     * @tc.desc   Arrow function - fifth power calculation with single parameter (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 2;
        const result: number = quintWithArrow(input); // x => x**5
        expect(typeof input === 'number').assertTrue();
        expect(result).assertEqual(32); // 2^5
      });

    /**
     * @tc.name   FunctionTest0197
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0197
     * @tc.desc   Arrow function - summation with rest parameters (dynamic parameters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = sumWithArrowRest(1, 2, 3, 4); // Summation of ...rest
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(10); // 1+2+3+4
      });

    /**
     * @tc.name   FunctionTest0200
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0200
     * @tc.desc   Predefined function - Number.isInteger verification for integers (type judgment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isInt1: boolean = checkIntegerValue(10); // Returns true for integers
        const isInt2: boolean = checkIntegerValue(10.5); // Returns false for decimals
        expect(isInt1).assertTrue();
        expect(isInt2).assertFalse();
      });

    /**
     * @tc.name   FunctionTest0201
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0201
     * @tc.desc   Function declaration - number cube calculation (parameter verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 3;
        const result: number = calcCube(input);
        const isInputValid: boolean = typeof input === 'number' && Number.isFinite(input);
        expect(isInputValid).assertTrue();
        expect(result).assertEqual(27); // 3^3
      });

    /**
     * @tc.name   FunctionTest0202
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0202
     * @tc.desc   Anonymous function expression - least common multiple of two numbers (parameter validity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 12, b: number = 18;
        const result: number = lcmTwoNum(a, b);
        const isParamsValid: boolean = typeof a === 'number' && typeof b === 'number' && a > 0 && b > 0;
        expect(isParamsValid).assertTrue();
        expect(result).assertEqual(36);
      });

    /**
     * @tc.name   FunctionTest0203
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0203
     * @tc.desc   Named function expression - string to uppercase (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const str: string = 'hello';
        const result: string = strToUpper(str);
        const isStrValid: boolean = typeof str === 'string';
        expect(isStrValid).assertTrue();
        expect(result).assertEqual('HELLO');
      });

    /**
     * @tc.name   FunctionTest0206
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0206
     * @tc.desc   Array parameter - array reversal (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: number[] = [1, 2, 3, 4];
        const reversedArr: number[] = reverseArr(inputArr);
        expect(Array.isArray(reversedArr)).assertTrue();
        expect(reversedArr[0]).assertEqual(4);
      });

    /**
     * @tc.name   FunctionTest0207
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0207
     * @tc.desc   Function declaration - return random boolean value without parameters (type verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: boolean = getRandomBoolean();
        const isResultValid: boolean = typeof result === 'boolean';
        expect(isResultValid).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0208
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0208
     * @tc.desc   Anonymous function expression - string truncation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const str: string = 'hello world', length: number = 5;
        const result: string = strTruncate(str, length);
        expect(typeof result === 'string').assertTrue();
        expect(result).assertEqual('hello...');
        
      });

    /**
     * @tc.name   FunctionTest0209
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0209
     * @tc.desc   Named function expression - square root calculation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 16;
        const result: number = numSquareRoot(input);
        const isInputValid: boolean = typeof input === 'number' && input >= 0;
        expect(isInputValid).assertTrue();
        expect(result).assertEqual(4);
        
      });

    /**
     * @tc.name   FunctionTest0211
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0211
     * @tc.desc   Function declaration hoisting - call before declaration (Fibonacci result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 6; // The 6th Fibonacci number (1,1,2,3,5,8)
        const result: number = fibonacciHoisted(input);
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(8);
        
      });

    /**
     * @tc.name   FunctionTest0212
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0212
     * @tc.desc   Function expression - multiple calls with caching (performance optimization)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const GeneratedDestructObj_1 = checkExprMemoization(5);
      const calls = GeneratedDestructObj_1.calls;
      const result = GeneratedDestructObj_1.result; // Calculate 5! twice but actually execute once
      expect(calls).assertEqual(7);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.name   FunctionTest0214
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0214
     * @tc.desc   apply method - product of nested arrays (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: (number | number[])[] = [2, [3, 4], [5]];
        const result: number = productWithApply(inputArr);
        expect(Array.isArray(inputArr)).assertTrue();
        expect(result).assertEqual(120); // 2*3*4*5
      });

    /**
     * @tc.name   FunctionTest0215
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0215
     * @tc.desc   Recursive call - factorial with cache (performance optimization)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const GeneratedDestructObj_1 = factorialRecursiveWithCache(5);
        const result = GeneratedDestructObj_1.result;
        const cacheHits = GeneratedDestructObj_1.cacheHits; // Calculating 5! will cache results from 1-5
        expect(result).assertEqual(120);
        expect(cacheHits).assertEqual(0); // No cache hits for first calculation
      });

    /**
     * @tc.name   FunctionTest0216
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0216
     * @tc.desc   Function hoisting + deep default parameters (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 2, b: number = 3;
        const result: number = addWithDefaultHoistDeep(a, b); // Default c={d:4,e:{f:5}}
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(14); // 2+3+4+5
      });


    /**
     * @tc.name   FunctionTest0218
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0218
     * @tc.desc   apply method - single-element array parameter (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: number[] = [7];
        const result: number = productWithApply(inputArr);
        expect(Array.isArray(inputArr)).assertTrue();
        expect(result).assertEqual(7);
      });

    /**
     * @tc.name   FunctionTest0219
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0219
     * @tc.desc   Function scope - const variable shadowing (constant特性)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isConstShadowed: boolean = checkInnerConstShadow();
        expect(isConstShadowed).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0223
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0223
     * @tc.desc   Scope conflict - global configuration shadowed by multiple layers (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        globalThis.appConfig = { debug: false };
        const result: boolean = getGlobalConfigShadowed(); // Innermost debug=true
        expect(typeof globalThis.appConfig === 'object').assertTrue();
        expect(result).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0224
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0224
     * @tc.desc   Scope - nested function clearing outer array (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const outerArr: number[] = [1, 2, 3];
        const clearArr = (arr: number[]): void => {
          arr.length = 0;
        };
        clearArr(outerArr);
        const isEmpty: boolean = outerArr.length === 0;
        expect(isEmpty).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0225
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0225
     * @tc.desc   Scope - function parameter modification does not affect original variable (value passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const outerStr: string = 'original';
        const modifyParam = (s: string): void => {
          s = 'modified';
        };
        modifyParam(outerStr);
        const isUnchanged: boolean = outerStr === 'original';
        expect(isUnchanged).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0226
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0226
     * @tc.desc   Basic closure - multiplier with coefficient (state retention)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const multiplier: (num: number) => number = createMultiplierClosure(3); // Coefficient 3
        const first: number = multiplier(5);
        const second: number = multiplier(2);
        expect(typeof multiplier === 'function').assertTrue();
        expect(first).assertEqual(15); // 3*5
        expect(second).assertEqual(6); // 3*2
      });


    /**
     * @tc.name   FunctionTest0228
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0228
     * @tc.desc   Closure encapsulation - counter with upper and lower limits (boundary control)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const counter = createBoundedCounter(3, 1, 5); // Initial 3, step 1, upper limit 5
        counter.increment();
        counter.increment();
        counter.increment(); // Exceed upper limit, keep 5
        const result: number = counter.getValue();
        expect(typeof counter.increment === 'function').assertTrue();
        expect(result).assertEqual(5);
      });

    /**
     * @tc.name   FunctionTest0229
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0229
     * @tc.desc   Closure preserving array - mapping transformation (functional operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const initArr: number[] = [1, 2, 3];
        const mapFunc: (callback: (n: number) => number) => number[] = mapArrInClosure(initArr);
        const mapped: number[] = mapFunc(n => n * 2);
        expect(Array.isArray(mapped)).assertTrue();
        expect(mapped).assertDeepEquals([2, 4, 6]);
      });

    /**
     * @tc.name   FunctionTest0230
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0230
     * @tc.desc   Closure encapsulation - frozen object protection (non-modifiable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const protector = freezeObjInClosure({ value: 10 });
        const canModify: boolean = protector.tryModify('value', 20); // Attempt to modify frozen object
        expect(typeof protector.tryModify === 'function').assertTrue();
        expect(canModify).assertFalse();
      });

    /**
     * @tc.name   FunctionTest0231
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0231
     * @tc.desc   Multiple closure instances - six independent counters (state isolation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const counters = createSixCounterClosure();
        const values = Object.values(counters).map(counter => counter());
        expect(values.length).assertEqual(6);
        expect(values.every(v => v === 1)).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0232
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0232
     * @tc.desc   Closure handling numbers - cumulative product (state accumulation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const productTracker: (num: number) => number = (() => {
          let product: number = 1;
          return (num: number): number => {
            product *= num;
            return product;
          };
        })();
        const first: number = productTracker(2);
        const second: number = productTracker(3);
        expect(typeof productTracker === 'function').assertTrue();
        expect(first).assertEqual(2);
        expect(second).assertEqual(6);
      });

    /**
     * @tc.name   FunctionTest0233
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0233
     * @tc.desc   Closure handling collections - intersection calculation (state maintenance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const intersectionChecker: (newSet: Set<number>) => Set<number> = (() => {
          let mainSet: Set<number> = new Set([1, 2, 3, 4]);
          return (newSet: Set<number>): Set<number> => {
            const intersection = new Set<number>();
            newSet.forEach(val => {
              if (mainSet.has(val)) {
                intersection.add(val);
              }
            });
            return intersection;
          };
        })();
        const result: Set<number> = intersectionChecker(new Set([3, 4, 5, 6]));
        expect(result instanceof Set).assertTrue();
        expect(result.has(3) && result.has(4)).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0234
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0234
     * @tc.desc   arguments object - product of parameters at odd indices (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const args: number[] = [2, 3, 4, 5];
        const result: number = getArgByIndexOdd(...args); // Indices 1, 3: 3*5=15
        expect(Array.isArray(args)).assertTrue();
        expect(result).assertEqual(15);
      });

    /**
     * @tc.name   FunctionTest0235
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0235
     * @tc.desc   arguments object - average number of parameters (statistical calculation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const lengths: number[] = [getArgLengthAverage(1), getArgLengthAverage(1, 2), getArgLengthAverage(1, 2, 3)];
        const average: number = lengths.reduce((a, b) => a + b, 0) / lengths.length;
        expect(Array.isArray(lengths)).assertTrue();
        expect(average).assertEqual(2); // (1+2+3)/3
      });

    /**
     * @tc.name   FunctionTest0236
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0236
     * @tc.desc   arguments object - convert to Set (remove duplicates)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const args: number[] = [1, 2, 2, 3, 3, 3];
        const result: Set<number> = convertArgsToSet(...args);
        expect(result instanceof Set).assertTrue();
        expect(result.size).assertEqual(3); // {1,2,3}
      });

    /**
     * @tc.name   FunctionTest0237
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0237
     * @tc.desc   arguments object - product of all parameters (dynamic quantity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const args: number[] = [2, 3, 4];
        const result: number = productAllArgs(...args);
        expect(Array.isArray(args)).assertTrue();
        expect(result).assertEqual(24); // 2*3*4
      });

    /**
     * @tc.name   FunctionTest0238
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0238
     * @tc.desc   arguments object - non-array characteristics (no reduce method)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isReduceFailed: boolean = checkArgsNoReduce(1, 2, 3);
        expect(isReduceFailed).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0239
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0239
     * @tc.desc   Default parameters - basic product characteristics (default value usage)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const a: number = 4;
        const result: number = productWithDefault(a); // Default b=5
        expect(typeof a === 'number').assertTrue();
        expect(result).assertEqual(20); // 4*5
      });

    /**
     * @tc.name   FunctionTest0240
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0240
     * @tc.desc   Default parameters - pass undefined to trigger default for product (value verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = productWithUndefinedDefault(undefined, 6); // Default a=3
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(18); // 3*6
      });

    /**
     * @tc.name   FunctionTest0241
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0241
     * @tc.desc   Rest parameters - collect complex type parameters (array characteristics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const restArr: (number | GeneratedTypeLiteralInterface_11 | boolean[])[] = collectRestArgsComplex(
          1, { id: 2 }, [true, false]
        );
        expect(Array.isArray(restArr)).assertTrue();
        expect((restArr[1] as GeneratedTypeLiteralInterface_1).id).assertEqual(2);
      });

    /**
     * @tc.name   FunctionTest0242
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0242
     * @tc.desc   Default + rest parameters - mixed product (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = productDefaultAndRest(2, 3, 4); // Default a=1, rest=[3,4] → 2*3*4=24
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(24);
      });


    /**
     * @tc.name   FunctionTest0244
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0244
     * @tc.desc   Parameter destructuring - complex array element extraction (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const inputArr: (number | string)[][][] = [
          [['a', 1], ['b', 2]],
          [['c', 3], ['d', 4]]
        ];
        const result: number = getArrComplexElemByDestruct(inputArr); // Extract [1][0][1] = 3
        expect(Array.isArray(inputArr)).assertTrue();
        expect(result).assertEqual(3);
      });

    /**
     * @tc.name   FunctionTest0245
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0245
     * @tc.desc   Arrow function - single-parameter cube calculation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const input: number = 4;
        const result: number = cubeWithArrow(input); // x => x**3
        expect(typeof input === 'number').assertTrue();
        expect(result).assertEqual(64); // 4^3
      });


    /**
     * @tc.name   FunctionTest0247
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0247
     * @tc.desc   Arrow function - product with rest parameters (dynamic parameters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const result: number = productWithArrowRest(2, 3, 5); // Product of ...rest
        expect(typeof result === 'number').assertTrue();
        expect(result).assertEqual(30); // 2*3*5
      });

    /**
     * @tc.name   FunctionTest0248
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0248
     * @tc.desc   Arrow function - no prototype property (characteristic verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const hasNoPrototype: boolean = checkArrowNoPrototype();
        expect(hasNoPrototype).assertTrue();
      });

    /**
     * @tc.name   FunctionTest0249
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0249
     * @tc.desc   Predefined function - JSON.parse with reviver (advanced parsing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const jsonStr: string = '{"name":"Product","price":"99.99"}';
        const result: TestPriceJson = parseJsonWithReviver(jsonStr);
        expect(typeof result === 'object' && result !== null).assertTrue();
        expect(result.price).assertEqual(99.99); // reviver converts string to number
      });

    /**
     * @tc.name   FunctionTest0250
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0250
     * @tc.desc   Predefined function - Number.isSafeInteger verifies safe integers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
        const isSafe1: boolean = checkSafeIntegerValue(Number.MAX_SAFE_INTEGER); // Safe integer
        const isSafe2: boolean = checkSafeIntegerValue(Number.MAX_SAFE_INTEGER + 1); // Unsafe
        expect(isSafe1).assertTrue();
        expect(isSafe2).assertFalse();
      });
  })
}