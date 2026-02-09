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

export default function BuiltinsStringLiteralTest() {
  describe('BuiltinsStringLiteralTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   BuiltinsStringLiteralTest0100
     * @tc.number SUB_STRING_LITERAL_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0100';
      console.log(`${caseName} test start`);
      type Color = 'red' | 'green' | 'blue';
      let favoriteColor: Color = 'blue';
      console.log(favoriteColor);
      expect("blue").assertEqual(favoriteColor);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest0200
     * @tc.number SUB_STRING_LITERAL_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0200';
      console.log(`${caseName} test start`);
      const singleQuoteEscape: string = 'He said, \'Hello!\'';
      console.log(singleQuoteEscape);
      expect('He said, \'Hello!\'').assertEqual(singleQuoteEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest0300
     * @tc.number SUB_STRING_LITERAL_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0300';
      console.log(`${caseName} test start`);
      const doubleQuoteEscape: string = "She replied, \"Hi!\"";
      console.log(doubleQuoteEscape);
      expect("She replied, \"Hi!\"").assertEqual(doubleQuoteEscape);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsStringLiteralTest0400
     * @tc.number SUB_STRING_LITERAL_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0400';
      console.log(`${caseName} test start`);
      const backslashEscape: string = "The path is C:\\Users\\Documents";
      console.log(backslashEscape);
      expect("The path is C:\\Users\\Documents").assertEqual(backslashEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest0500
     * @tc.number SUB_STRING_LITERAL_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0500';
      console.log(`${caseName} test start`);
      const backspaceEscape: string = "This is a\b test";
      console.log(backspaceEscape);
      expect("This is a\b test").assertEqual(backspaceEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest0600
     * @tc.number SUB_STRING_LITERAL_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0600';
      console.log(`${caseName} test start`);
      const formFeedEscape: string = "Page 1\fPage 2";
      console.log(formFeedEscape);
      expect("Page 1\fPage 2").assertEqual(formFeedEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest0700
     * @tc.number SUB_STRING_LITERAL_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0700';
      console.log(`${caseName} test start`);
      const newlineEscape: string = "Line 1\nLine 2";
      console.log(newlineEscape);
      expect("Line 1\nLine 2").assertEqual(newlineEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest0800
     * @tc.number SUB_STRING_LITERAL_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0800';
      console.log(`${caseName} test start`);
      const carriageReturnEscape: string = "Line 1\rLine 2";
      console.log(carriageReturnEscape);
      expect("Line 1\rLine 2").assertEqual(carriageReturnEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest0900
     * @tc.number SUB_STRING_LITERAL_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest0900';
      console.log(`${caseName} test start`);
      const tabEscape: string = "Column 1\tColumn 2";
      console.log(tabEscape);
      expect("Column 1\tColumn 2").assertEqual(tabEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1000
     * @tc.number SUB_STRING_LITERAL_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1000';
      console.log(`${caseName} test start`);
      const verticalTabEscape: string = "Top\vBottom";
      console.log(verticalTabEscape);
      expect("Top\vBottom").assertEqual(verticalTabEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1100
     * @tc.number SUB_STRING_LITERAL_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1100';
      console.log(`${caseName} test start`);
      const hexEscape: string = "The symbol is \x40";
      console.log(hexEscape);
      expect("The symbol is \x40").assertEqual(hexEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1200
     * @tc.number SUB_STRING_LITERAL_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1200';
      console.log(`${caseName} test start`);
      const unicodeEscape: string = "The euro sign is \u20AC";
      console.log(unicodeEscape);
      expect("The euro sign is \u20AC").assertEqual(unicodeEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1300
     * @tc.number SUB_STRING_LITERAL_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1300';
      console.log(`${caseName} test start`);
      const unicodeCodepointEscape: string = "The snowman is \u{2603}";
      console.log(unicodeCodepointEscape);
      expect("The snowman is \u{2603}").assertEqual(unicodeCodepointEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1400
     * @tc.number SUB_STRING_LITERAL_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1400';
      console.log(`${caseName} test start`);
      const normalString: string = "This is a regular string.";
      console.log(normalString);
      expect("This is a regular string.").assertEqual(normalString);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest1500
     * @tc.number SUB_STRING_LITERAL_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1500';
      console.log(`${caseName} test start`);
      const hexSpaceEscape: string = "Space: \x20";
      console.log(hexSpaceEscape);
      expect("Space: \x20").assertEqual(hexSpaceEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1600
     * @tc.number SUB_STRING_LITERAL_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1600';
      console.log(`${caseName} test start`);
      const unicodeCopyrightEscape: string = "Copyright: \u00A9";
      console.log(unicodeCopyrightEscape);
      expect("Copyright: \u00A9").assertEqual(unicodeCopyrightEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest1700
     * @tc.number SUB_STRING_LITERAL_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1700';
      console.log(`${caseName} test start`);
      const singleQuoteHexEscape: string = 'Hex char: \x61 (a)';
      console.log(singleQuoteHexEscape);
      expect('Hex char: \x61 (a)').assertEqual(singleQuoteHexEscape);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsStringLiteralTest1800
     * @tc.number SUB_STRING_LITERAL_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1800';
      console.log(`${caseName} test start`);
      const doubleQuoteUnicodeEscape: string = "Unicode char: \u2192 (→)";
      console.log(doubleQuoteUnicodeEscape);
      expect("Unicode char: \u2192 (→)").assertEqual(doubleQuoteUnicodeEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest1900
     * @tc.number SUB_STRING_LITERAL_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest1900';
      console.log(`${caseName} test start`);
      const newlineTabEscape: string = "First line\n\tSecond indented line";
      console.log(newlineTabEscape);
      expect("First line\n\tSecond indented line").assertEqual(newlineTabEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest2000
     * @tc.number SUB_STRING_LITERAL_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2000';
      console.log(`${caseName} test start`);
      const carriageReturnFormFeedEscape: string = "Page 1\r\fPage 2";
      console.log(carriageReturnFormFeedEscape);
      expect("Page 1\r\fPage 2").assertEqual(carriageReturnFormFeedEscape);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsStringLiteralTest2100
     * @tc.number SUB_STRING_LITERAL_TEST_2100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2100';
      console.log(`${caseName} test start`);
      const backspaceVerticalTabEscape: string = "Text\b\vNew text";
      console.log(backspaceVerticalTabEscape);
      expect("Text\b\vNew text").assertEqual(backspaceVerticalTabEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    
    /**
     * @tc.name   BuiltinsStringLiteralTest2200
     * @tc.number SUB_STRING_LITERAL_TEST_2200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2200';
      console.log(`${caseName} test start`);
      const hexExclamationEscape: string = "Exclamation: \x21";
      console.log(hexExclamationEscape);
      expect("Exclamation: \x21").assertEqual(hexExclamationEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest2300
     * @tc.number SUB_STRING_LITERAL_TEST_2300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2300';
      console.log(`${caseName} test start`);
      const unicodeHeartEscape: string = "Love: \u2665";
      console.log(unicodeHeartEscape);
      expect("Love: \u2665").assertEqual(unicodeHeartEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest2400
     * @tc.number SUB_STRING_LITERAL_TEST_2400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2400';
      console.log(`${caseName} test start`);
      const singleQuoteUnicodeCodepointEscape: string = 'Smiley: \u{1F600}';
      console.log(singleQuoteUnicodeCodepointEscape);
      expect('Smiley: \u{1F600}').assertEqual(singleQuoteUnicodeCodepointEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest2500
     * @tc.number SUB_STRING_LITERAL_TEST_2500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2500';
      console.log(`${caseName} test start`);
      const doubleQuoteHexDollarEscape: string = "Dollar: \x24";
      console.log(doubleQuoteHexDollarEscape);
      expect("Dollar: \x24").assertEqual(doubleQuoteHexDollarEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest2600
     * @tc.number SUB_STRING_LITERAL_TEST_2600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2600';
      console.log(`${caseName} test start`);
      const multipleNewlineCarriageReturnEscape: string = "Line 1\n\rLine 2\n\rLine 3";
      console.log(multipleNewlineCarriageReturnEscape);
      expect("Line 1\n\rLine 2\n\rLine 3").assertEqual(multipleNewlineCarriageReturnEscape);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsStringLiteralTest2700
     * @tc.number SUB_STRING_LITERAL_TEST_2700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2700';
      console.log(`${caseName} test start`);
      const multipleTabVerticalTabEscape: string = "Column 1\t\vColumn 2";
      console.log(multipleTabVerticalTabEscape);
      expect("Column 1\t\vColumn 2").assertEqual(multipleTabVerticalTabEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest2800
     * @tc.number SUB_STRING_LITERAL_TEST_2800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2800';
      console.log(`${caseName} test start`);
      const hexQuestionEscape: string = "Question: \x3F";
      console.log(hexQuestionEscape);
      expect("Question: \x3F").assertEqual(hexQuestionEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest2900
     * @tc.number SUB_STRING_LITERAL_TEST_2900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest2900';
      console.log(`${caseName} test start`);
      const unicodeStarEscape: string = "Star: \u2605";
      console.log(unicodeStarEscape);
      expect("Star: \u2605").assertEqual(unicodeStarEscape);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsStringLiteralTest3000
     * @tc.number SUB_STRING_LITERAL_TEST_3000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsStringLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsStringLiteralTest3000';
      console.log(`${caseName} test start`);
      const mixedEscape: string = "Text with \x23 (hash) and \u2191 (↑)";
      console.log(mixedEscape);
      expect("Text with \x23 (hash) and \u2191 (↑)").assertEqual(mixedEscape);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}