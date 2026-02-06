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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsMultilineStringLiteralTest() {
  describe('BuiltinsMultilineStringLiteralTest', () => {
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
     * @tc.name   BuiltinsMultilineStringLiteralTest0100
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0100';
      console.log(`${caseName} test start`);
      const simpleMultiline1 = `This is the first line
        This is the second line
        This is the third line`;
      console.log(simpleMultiline1);
      expect(simpleMultiline1).assertEqual(`This is the first line
        This is the second line
        This is the third line`);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0200
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0200';
      console.log(`${caseName} test start`);
      const str1 = `Hello`;
      const str2 = ` World`;
      const combinedStr = `${str1}${str2}`;
      console.log(combinedStr);
      expect(combinedStr).assertEqual(`Hello World`);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0300
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0300';
      console.log(`${caseName} test start`);
      const repeatStr = `La`;
      const repeated = `${repeatStr.repeat(3)}`;
      expect(repeated).assertEqual(`LaLaLa`);
      console.log(repeated);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0400
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0400';
      console.log(`${caseName} test start`);
      const longStr = `This is a long string`;
      const subStr = longStr.slice(0, 4);
      expect(subStr).assertEqual(`This`);
      console.log(subStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0500
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0500';
      console.log(`${caseName} test start`);
      const original = `Old text`;
      const replaced = original.replace('Old', 'New');
      expect(replaced).assertEqual(`New text`);
      console.log(replaced);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0600
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0600';
      console.log(`${caseName} test start`);
      const multi1 = `Line 1
      Line 2`;
      const multi2 = `Line 3
      Line 4`;
      const multiCombined = `${multi1}
      ${multi2}`;
      expect(multiCombined).assertEqual(`Line 1
      Line 2
      Line 3
      Line 4`);
      console.log(multiCombined);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0700
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0700';
      console.log(`${caseName} test start`);
      const num1 = 5;
      const num2 = 3;
      const resultStr = `The sum of ${num1} and ${num2} is ${num1 + num2}`;
      expect(resultStr).assertEqual(`The sum of 5 and 3 is 8`);
      console.log(resultStr);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0800
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0800';
      console.log(`${caseName} test start`);
      const factor1 = 4;
      const factor2 = 6;
      const productStr = `The product of ${factor1} and ${factor2} is ${factor1 * factor2}`;
      expect(productStr).assertEqual(`The product of 4 and 6 is 24`);
      console.log(productStr);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest0900
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest0900';
      console.log(`${caseName} test start`);
      const minuend = 10;
      const subtrahend = 4;
      const differenceStr = `The difference between ${minuend} and ${subtrahend} is ${minuend - subtrahend}`;
      expect(differenceStr).assertEqual(`The difference between 10 and 4 is 6`);
      console.log(differenceStr);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1000
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1000';
      console.log(`${caseName} test start`);
      const dividend = 15;
      const divisor = 3;
      const quotientStr = `The quotient of ${dividend} divided by ${divisor} is ${dividend / divisor}`;
      expect(quotientStr).assertEqual(`The quotient of 15 divided by 3 is 5`);
      console.log(quotientStr);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1100
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1100';
      console.log(`${caseName} test start`);
      const name = 'John';
      const age = 25;
      const info = `Name: ${name}
      Age: ${age}`;
      expect(info).assertEqual(`Name: John
      Age: 25`);
      console.log(info);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1200
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1200';
      console.log(`${caseName} test start`);
      const greeting = `Hello`;
      const details = `
      Name: Jane
      Occupation: Engineer`;
      const fullGreeting = `${greeting}${details}`;
      expect(fullGreeting).assertEqual(`Hello
      Name: Jane
      Occupation: Engineer`);
      console.log(fullGreeting);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1300
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1300';
      console.log(`${caseName} test start`);
      const tempStr = `The value is {value}`;
      const value = 100;
      const filledStr = tempStr.replace('{value}', `${value}`);
      expect(filledStr).assertEqual(`The value is 100`);
      console.log(filledStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1400
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1400';
      console.log(`${caseName} test start`);
      const longMulti = `This is a long
      multiline string`;
      const startPart = longMulti.slice(0, 10);
      const endPart = longMulti.slice(-6);
      const newMulti = `${startPart}...${endPart}`;
      expect(newMulti).assertEqual(`This is a ...string`);
      console.log(newMulti);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1500
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1500';
      console.log(`${caseName} test start`);
      const unit = `Step `;
      const steps = 3;
      const stepsStr = `${unit.repeat(steps)}`;
      expect(stepsStr).assertEqual(`Step Step Step `);
      console.log(stepsStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1600
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1600';
      console.log(`${caseName} test start`);
      const isMember = true;
      const accessMsg = `You ${isMember? 'have' : 'do not have'} access.
      Please check your membership.`;
      expect(accessMsg).assertEqual(`You have access.
      Please check your membership.`);
      console.log(accessMsg);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1700
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1700';
      console.log(`${caseName} test start`);
      const multiLineStr = `Line 1
      Line 2
      Line 3`;
      const charCount = multiLineStr.length;
      const resultMsg = `The multi - line string has ${charCount} characters.`;
      expect(resultMsg).assertEqual(`The multi - line string has 32 characters.`);
      console.log(resultMsg);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1800
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1800';
      console.log(`${caseName} test start`);
      interface Person{
        name:string,
        city:string
      }
      const person:Person = {
        name: 'Mike',
        city: 'Chicago'
      };
      const personInfo = `Person Details:
      Name: ${person.name}
      City: ${person.city}`;
      expect(personInfo).assertEqual(`Person Details:
      Name: Mike
      City: Chicago`);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest1900
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest1900';
      console.log(`${caseName} test start`);
      const upperStr = `HELLO`;
      const lowerStr = `world`;
      const caseCombined = `${upperStr.toLowerCase()} ${lowerStr.toUpperCase()}`;
      expect(caseCombined).assertEqual(`hello WORLD`);
      console.log(caseCombined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2000
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2000';
      console.log(`${caseName} test start`);
      const spaceStr = `   Trim me   `;
      const trimmed = `${spaceStr.trim()}`;
      expect(trimmed).assertEqual(`Trim me`);
      console.log(trimmed);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2100
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2100';
      console.log(`${caseName} test start`);
      const base = 2;
      const exponent = 3;
      const powerStr = `${base} to the power of ${exponent} is ${Math.pow(base, exponent)}`;
      expect(powerStr).assertEqual(`2 to the power of 3 is 8`);
      console.log(powerStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2200
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2200';
      console.log(`${caseName} test start`);
      const csvLine = `apple,banana,cherry`;
      const parts = csvLine.split(',');
      const splitStr = `Fruits:
      ${parts.join('\n      ')}`;
      expect(splitStr).assertEqual(`Fruits:
      apple
      banana
      cherry`);
      console.log(splitStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2300
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2300';
      console.log(`${caseName} test start`);
      const numerator = 17;
      const denominator = 5;
      const modStr = `${numerator} modulo ${denominator} is ${numerator % denominator}`;
      expect(modStr).assertEqual(`17 modulo 5 is 2`);
      console.log(modStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2400
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2400';
      console.log(`${caseName} test start`);
      const searchStr = `This is a test string`;
      const found = searchStr.includes('test')? 'Found' : 'Not found';
      const searchResult = `Search for 'test': ${found}`;
      expect(searchResult).assertEqual(`Search for 'test': Found`);
      console.log(searchResult);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2500
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2500';
      console.log(`${caseName} test start`);
      let counter = 5;
      const incrementStr = `Counter value: ${counter++}`;
      expect(incrementStr).assertEqual(`Counter value: 5`);
      console.log(incrementStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2600
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2600';
      console.log(`${caseName} test start`);
      const charStr = `abcabc`;
      const replacedChar = charStr.replace(/a/g, 'x');
      const charResult = `Replaced string: ${replacedChar}`;
      expect(charResult).assertEqual(`Replaced string: xbcxbc`);
      console.log(charResult);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2700
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2700';
      console.log(`${caseName} test start`);
      const numA = 10;
      const numB = 15;
      const compareStr = `${numA} is ${numA < numB? 'less than' : 'greater than or equal to'} ${numB}`;
      expect(compareStr).assertEqual(`10 is less than 15`);
      console.log(compareStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2800
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2800';
      console.log(`${caseName} test start`);
      const forwardStr = `hello`;
      const reversed = forwardStr.split('').reverse().join('');
      const reverseStr = `Reversed: ${reversed}`;
      expect(reverseStr).assertEqual(`Reversed: olleh`);
      console.log(reverseStr);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest2900
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_2900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest2900';
      console.log(`${caseName} test start`);
      const bitA = 5;
      const bitB = 3;
      const bitResult = `Bitwise AND of ${bitA} and ${bitB} is ${bitA & bitB}`;
      expect(bitResult).assertEqual(`Bitwise AND of 5 and 3 is 1`);
      console.log(bitResult);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsMultilineStringLiteralTest3000
     * @tc.number SUB_MULTILINE_STRING_LITERAL_TEST_3000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsMultilineStringLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsMultilineStringLiteralTest3000';
      console.log(`${caseName} test start`);
      const checkStr = `Some text`;
      const lengthStr = `Length of "${checkStr}" is ${checkStr.length}`;
      expect(lengthStr).assertEqual(`Length of "Some text" is 9`);
      console.log(lengthStr);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}