/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

let dateRegex = /^(0?[1-9]|1[0-2])\/(0?[1-9]|[12][0-9]|3[01])\/\d{4}$/;

let months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

interface DateTimeFormatOptions {
  type?: 'cardinal' | 'ordinal' | undefined;
  localeMatcher?: 'best fit' | 'lookup' | undefined;
}

interface ExtendedDateTimeFormatOptions extends DateTimeFormatOptions {
  minimumFractionDigits?: number;
  minimumIntegerDigits?: number;
}

export default function IntlTest() {
  describe('IntlTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0100
     * @tc.name       : testIntlConstructorNoNew0001
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0001';
      try {
        let intl = Intl.Collator();
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0200
     * @tc.name       : testIntlConstructorNoNew0002
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0002';
      try {
        let locales = "de";
        let intl = Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0300
     * @tc.name       : testIntlConstructorNoNew0003
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0003';
      try {
        let locales = [];
        let intl = Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0400
     * @tc.name       : testIntlConstructorNoNew0004
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0004';
      try {
        let locales = ["de", "en-US"];
        let intl = Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0500
     * @tc.name       : testIntlConstructorNoNew0005
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0005';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: 'sort'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0600
     * @tc.name       : testIntlConstructorNoNew0006
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0006';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: 'search'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0700
     * @tc.name       : testIntlConstructorNoNew0007
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0007';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          localeMatcher: "lookup"
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0800
     * @tc.name       : testIntlConstructorNoNew0008
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0008';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          localeMatcher: "best fit"
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_0900
     * @tc.name       : testIntlConstructorNoNew0009
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0009';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          numeric: false
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1000
     * @tc.name       : testIntlConstructorNoNew0010
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0010';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          caseFirst: "upper"
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1100
     * @tc.name       : testIntlConstructorNoNew0011
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0011';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          caseFirst: "lower"
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1200
     * @tc.name       : testIntlConstructorNoNew0012
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0012';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          caseFirst: "false"
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1300
     * @tc.name       : testIntlConstructorNoNew0013
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0013';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: 'base'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1400
     * @tc.name       : testIntlConstructorNoNew0014
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0014';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: 'accent'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1500
     * @tc.name       : testIntlConstructorNoNew0015
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0015';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: 'case'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1600
     * @tc.name       : testIntlConstructorNoNew0016
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0016';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: 'variant'
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1700
     * @tc.name       : testIntlConstructorNoNew0017
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0017';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          ignorePunctuation: true
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1800
     * @tc.name       : testIntlConstructorNoNew0018
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0018';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {};
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_1900
     * @tc.name       : testIntlConstructorNoNew0019
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0019';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: "sort",
          localeMatcher: "lookup",
          numeric: false,
          caseFirst: "lower",
          sensitivity: "case",
          ignorePunctuation: true
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2000
     * @tc.name       : testIntlConstructorNoNew0020
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0019';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: undefined
        }
        let intl = Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2100
     * @tc.name       : testIntlConstructorNoNew0021
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0021';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          localeMatcher: undefined
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2200
     * @tc.name       : testIntlConstructorNoNew0022
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0022';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          numeric: undefined
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2300
     * @tc.name       : testIntlConstructorNoNew0023
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0023';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          caseFirst: undefined
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2400
     * @tc.name       : testIntlConstructorNoNew0024
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0024';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: undefined
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2500
     * @tc.name       : testIntlConstructorNoNew0025
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0025';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          ignorePunctuation: undefined
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2600
     * @tc.name       : testIntlConstructorNoNew0026
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0026';
      try {
        let locales: string | undefined = undefined;
        let intl = new Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2700
     * @tc.name       : testIntlConstructorNoNew0027
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIntlConstructorNoNew0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let TAG = 'testIntlConstructorNoNew0027';
      try {
        let locales: string | undefined = undefined;
        let intl = Intl.Collator(locales, undefined);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2800
     * @tc.name       : testIntlConstructorNoNew0028
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNoNew0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNoNew0028';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: 'test'
        }
        let intl = Intl.Collator(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getStringOption failed');
      }

    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2900
     * @tc.name       : testIntlConstructorNoNew0029
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNoNew0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNoNew0029';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          localeMatcher: "test"
        }
        let intl = Intl.Collator(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getStringOption failed');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3000
     * @tc.name       : testIntlConstructorNoNew0030
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNoNew0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNoNew0030';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          caseFirst: "test"
        }
        let intl = Intl.Collator(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getStringOption failed');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3100
     * @tc.name       : testIntlConstructorNoNew0031
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNoNew0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNoNew0031';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          sensitivity: 'test'
        }
        let intl = Intl.Collator(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getStringOption failed');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3200
     * @tc.name       : testIntlConstructorNew0001
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNew0001';
      try {
        let intl: Intl.Collator = new Intl.Collator();
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3300
     * @tc.name       : testIntlConstructorNew0002
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNew0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNew0002';
      try {
        let locales = "de";
        let intl = new Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3400
     * @tc.name       : testIntlConstructorNew0003
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNew0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNew0003';
      try {
        let locales = [];
        let intl = new Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3500
     * @tc.name       : testIntlConstructorNew0004
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNew0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNew0004';
      try {
        let locales = ["de", "en-US"];
        let intl = new Intl.Collator(locales);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3600
     * @tc.name       : testIntlConstructorNew0005
     * @tc.desc       : Test the function of the Interface Intl_new().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlConstructorNew0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlConstructorNew0005';
      try {
        let locales = "de";
        let options: Intl.CollatorOptions = {
          usage: "sort"
        }
        let intl = new Intl.Collator(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3700
     * @tc.name       : testIntlConstructorNew0006
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0006";
      try {
        let intl = Intl.Collator("de", {
          usage: "search"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3800
     * @tc.name       : testIntlConstructorNew0007
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0007";
      try {
        let intl = Intl.Collator("de", {
          localeMatcher: "lookup"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3900
     * @tc.name       : testIntlConstructorNew0008
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0008";
      try {
        let intl = Intl.Collator("de", {
          localeMatcher: "best fit"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4000
     * @tc.name       : testIntlConstructorNew0009
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0009";
      try {
        let intl = Intl.Collator("de", {
          numeric: false
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4100
     * @tc.name       : testIntlConstructorNew0010
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0010";
      try {
        let intl = Intl.Collator("de", {
          caseFirst: "upper"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4200
     * @tc.name       : testIntlConstructorNew0011
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0011";
      try {
        let intl = Intl.Collator("de", {
          caseFirst: "lower"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4300
     * @tc.name       : testIntlConstructorNew0012
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0012";
      try {
        let intl = Intl.Collator("de", {
          caseFirst: "false"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4400
     * @tc.name       : testIntlConstructorNew0013
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0013";
      try {
        let intl = Intl.Collator("de", {
          sensitivity: "base"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4500
     * @tc.name       : testIntlConstructorNew0014
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0014";
      try {
        let intl = Intl.Collator("de", {
          sensitivity: "accent"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4600
     * @tc.name       : testIntlConstructorNew0015
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0015";
      try {
        let intl = Intl.Collator("de", {
          sensitivity: "case"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4700
     * @tc.name       : testIntlConstructorNew0016
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0016";
      try {
        let intl = Intl.Collator("de", {
          sensitivity: "variant"
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4800
     * @tc.name       : testIntlConstructorNew0017
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0017";
      try {
        let intl = Intl.Collator("de", {
          ignorePunctuation: true
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_4900
     * @tc.name       : testIntlConstructorNew0018
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0018";
      try {
        let intl = Intl.Collator("de", {});
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5000
     * @tc.name       : testIntlConstructorNew0019
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0019";
      try {
        let intl = Intl.Collator("de", {
          usage: "sort",
          localeMatcher: "lookup",
          numeric: false,
          caseFirst: "lower",
          sensitivity: "case",
          ignorePunctuation: true
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5100
     * @tc.name       : testIntlConstructorNew0020
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0020";
      try {
        let intl = Intl.Collator("de", {
          usage: undefined
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5200
     * @tc.name       : testIntlConstructorNew0021
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0021";
      try {
        let intl = Intl.Collator("de", {
          localeMatcher: undefined
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5300
     * @tc.name       : testIntlConstructorNew0022
     * @tc.desc       : Test the function of the Interface Intl.Collator().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0022";
      try {
        let intl = Intl.Collator("de", {
          numeric: undefined
        });
        expect(intl != undefined && intl != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5400
     * @tc.name       : testIntlConstructorNew0023
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0023";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          caseFirst: undefined
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect(intl).not().assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5500
     * @tc.name       : testIntlConstructorNew0024
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0024";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          sensitivity: undefined
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect(intl).not().assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5600
     * @tc.name       : testIntlConstructorNew0025
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0025";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          ignorePunctuation: undefined
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect(intl).not().assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5700
     * @tc.name       : testIntlConstructorNew0026
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0026";
      try {
        const intl = new Intl.Collator(undefined, undefined);
        console.log(`${TAG} Collator object created:`, intl);
        expect(intl).not().assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5800
     * @tc.name       : testIntlConstructorNew0027
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0027";
      try {
        const intl = new Intl.Collator(undefined);
        console.log(`${TAG} Collator object created:`, intl);
        expect(intl).not().assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_5900
     * @tc.name       : testIntlConstructorNew0028
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0028";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          usage: 'test'
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('getStringOption failed');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6000
     * @tc.name       : testIntlConstructorNew0029
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0029";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          localeMatcher: "test"
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('getStringOption failed');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6100
     * @tc.name       : testIntlConstructorNew0030
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0030";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          caseFirst: "test"
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('getStringOption failed');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6200
     * @tc.name       : testIntlConstructorNew0031
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlConstructorNew0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlConstructorNew0031";
      try {
        const locales = "de";
        const options: Intl.CollatorOptions = {
          sensitivity: 'test'
        }

        const intl = new Intl.Collator(locales, options);
        console.log(`${TAG} Collator object created:`, intl);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('getStringOption failed');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6300
     * @tc.name       : testIntlCompare0001
     * @tc.desc       : Test the function of the Interface IntlConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0001";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('z', 'a');
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6400
     * @tc.name       : testIntlCompare0002
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0002";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('a', 'c');
        expect(ret).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6500
     * @tc.name       : testIntlCompare0003
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0003";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('a', 'a');
        expect(ret).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6600
     * @tc.name       : testIntlCompare0004
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0004";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('test', 'base');
        expect(ret).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6700
     * @tc.name       : testIntlCompare0005
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0005";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('abandon', 'ability');
        expect(ret).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6800
     * @tc.name       : testIntlCompare0006
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0006";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('abandon', 'abandon');
        expect(ret).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_6900
     * @tc.name       : testIntlCompare0007
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0007";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('a', '');
        expect(ret).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7000
     * @tc.name       : testIntlCompare0008
     * @tc.desc       : Test the function of the Interface compare()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlCompare0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0008";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('', 'a');
        expect(ret).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7100
     * @tc.name       : testIntlCompare0009
     * @tc.desc       : Test the function of the interface compare().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlCompare0009";
      try {
        const enCollator = new Intl.Collator('en');
        let ret = enCollator.compare('', '');
        expect(ret).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7200
     * @tc.name       : testIntlResolvedOptions0001
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0001";
      try {
        const collator = new Intl.Collator();
        let options = collator.resolvedOptions();
        expect(options.locale).assertEqual("en-US");
        expect(options.numeric).assertEqual(false);
        expect(options.sensitivity).assertEqual("variant");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7300
     * @tc.name       : testIntlResolvedOptions0002
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0002";
      try {
        const collator = new Intl.Collator("de");
        let options = collator.resolvedOptions();
        expect(options.locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7400
     * @tc.name       : testIntlResolvedOptions0003
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0003";
      try {
        const collator = new Intl.Collator("de", {
          sensitivity: "base"
        });
        let options = collator.resolvedOptions();
        expect(options.sensitivity).assertEqual("base");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7500
     * @tc.name       : testIntlResolvedOptions0004
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0004";
      try {
        const collator = new Intl.Collator("de", {
          ignorePunctuation: true
        });
        let options = collator.resolvedOptions();
        expect(options.ignorePunctuation).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7600
     * @tc.name       : testIntlResolvedOptions0005
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0005";
      try {
        const collator = new Intl.Collator("de", {
          numeric: true
        });
        let options = collator.resolvedOptions();
        expect(options.numeric).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7700
     * @tc.name       : testIntlResolvedOptions0006
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0006";
      try {
        const collator = new Intl.Collator("de", {
          caseFirst: "lower"
        });
        let options = collator.resolvedOptions();
        expect(options.caseFirst).assertEqual("lower");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7800
     * @tc.name       : testIntlResolvedOptions0007
     * @tc.desc       : Test the function of the interface resolvedOptions().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0007";
      try {
        const collator = new Intl.Collator("de", {
          usage: "search"
        });
        let options = collator.resolvedOptions();
        expect(options.usage).assertEqual("search");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_7900
     * @tc.name       : test testIntlResolvedOptions0008
     * @tc.desc       : Test the function of the interface resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0008";
      try {
        let options = Intl.DateTimeFormat().resolvedOptions();
        expect(options.locale).assertEqual("en-US");
        expect(options.calendar).assertEqual("gregory");
        expect(options.numberingSystem).assertEqual("latn");
        expect(options.timeZone).assertEqual("America/Chicago");
        expect(options.hour12).assertUndefined();
        expect(options.weekday).assertUndefined();
        expect(options.era).assertUndefined();
        expect(options.year).assertEqual("numeric");
        expect(options.month).assertEqual("numeric");
        expect(options.day).assertEqual("numeric");
        expect(options.hour).assertUndefined();
        expect(options.minute).assertUndefined();
        expect(options.second).assertUndefined();
        expect(options.timeZoneName).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8000
     * @tc.name       : test testIntlResolvedOptions0009
     * @tc.desc       : Test the function of the interface resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0009";
      try {
        let options = Intl.DateTimeFormat("zh").resolvedOptions();
        expect(options.locale).assertEqual("zh");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8100
     * @tc.name       : testIntlResolvedOptions0010
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0010";
      try {
        const options = Intl.DateTimeFormat("en-US", {
          weekday: "long"
        }).resolvedOptions();
        const x = options.weekday;
        expect(x).assertEqual('long');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8200
     * @tc.name       : test testIntlResolvedOptions0011
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0011";
      try {
        const options = Intl.DateTimeFormat("en-US", {
          era: "narrow"
        }).resolvedOptions();
        const x = options.era;
        expect(x).assertEqual('narrow');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8300
     * @tc.name       : test testIntlResolvedOptions0012
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0012";
      try {
        let options = Intl.DateTimeFormat("en-US", {
          year: "2-digit"
        }).resolvedOptions();
        const x = options.year;
        expect(x).assertEqual('2-digit');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8400
     * @tc.name       : test testIntlResolvedOptions0013
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0013";
      try {
        const options = Intl.DateTimeFormat("en-US", {
          month: "short"
        }).resolvedOptions();
        const x = options.month;
        expect(x).assertEqual('short');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8500
     * @tc.name       : test testIntlResolvedOptions0014
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0014";
      try {
        let options = Intl.DateTimeFormat("en-US", {
          day: "numeric"
        }).resolvedOptions();
        const x = options.day;
        expect(x).assertEqual('numeric');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8600
     * @tc.name       : test testIntlResolvedOptions0015
     * @tc.desc       : Test the function of Intl resolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlResolvedOptions0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlResolvedOptions0015";
      try {
        let options = Intl.DateTimeFormat("en-US", {
          hour: "2-digit"
        }).resolvedOptions();
        const x = options.hour;
        expect(x).assertEqual('2-digit');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8700
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0001
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0001";
      try {
        let intl = new Intl.DateTimeFormat();
        console.log(`${TAG}: DateTimeFormat =`, intl);
        ;
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8800
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0002
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0002";
      try {
        let locales = "de";
        let intl = new Intl.DateTimeFormat(locales);
        expect(intl.resolvedOptions().locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_8900
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0003
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0003";
      try {
        let locales = [];
        let intl = new Intl.DateTimeFormat(locales);
        console.log(`${TAG}: DateTimeFormat =`, intl);
        expect(intl.resolvedOptions().locale).assertEqual("en-US");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9000
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0004
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0004";
      try {
        let locales = ["de", "en-US"];
        let intl = new Intl.DateTimeFormat(locales);
        expect(intl.resolvedOptions().locale).assertEqual("de");


      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9100
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0005
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0005";
      try {
        let intl = new Intl.DateTimeFormat(undefined);
        expect(intl.resolvedOptions().locale).assertEqual("en-US");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9200
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0006
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0006";
      try {
        let intl = new Intl.DateTimeFormat(undefined, undefined);
        expect(intl.resolvedOptions().locale).assertEqual("en-US");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9300
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0007
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0007";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "long"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl.resolvedOptions().locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9400
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0008
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0008";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "short"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl.resolvedOptions().locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9500
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0009
     * @tc.desc       : Test the function of the interface DateTimeFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatConstructorNoNew0009";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "narrow"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl.resolvedOptions().locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9600
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0010
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0010';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9700
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0011
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0011';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "long"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9800
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0012
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0012';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "short"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_9900
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0013
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0013';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "narrow"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10000
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0014
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0014';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10100
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0015
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0015';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10200
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0016
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0016';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10300
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0017
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0017';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10400
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0018
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0018';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10500
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0019
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0019';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10600
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0020
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0020';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "long"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10700
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0021
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0021';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "short"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10800
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0022
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0022';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "narrow"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_10900
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0023
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0023';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11000
     * @tc.name       : test testIntlDateTimeFormatConstructorNoNew0024
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0024';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11100
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0025
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0025';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11200
     * @tc.name       : testIntlDateTimeFormatConstructorNoNew0026
     * @tc.desc       : The constructor for an object that enables language-sensitive date and time formatting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorNoNew0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlDateTimeFormatConstructorNoNew0026';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl !== undefined && intl !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11300
     * @tc.name       : testIntlWithoutNewNumeric0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using new keyword.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewNumeric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewNumeric0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11400
     * @tc.name       : testIntlWithoutNewNumeric0002
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewNumeric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewNumeric0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11500
     * @tc.name       : testIntlWithoutNewNumeric0003
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewNumeric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewNumeric0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: "numeric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11600
     * @tc.name       : testIntlWithoutNewDigit0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using new keyword.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewDigit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewDigit0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11700
     * @tc.name       : testIntlWithoutNewDigit0002
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewDigit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewDigit0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11800
     * @tc.name       : testIntlWithoutNewDigit0003
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewDigit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewDigit0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: "2-digit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_11900
     * @tc.name       : testIntlWithoutNewUndefined0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewUndefined0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12000
     * @tc.name       : test testIntlWithoutNewUndefined0002
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewUndefined0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12100
     * @tc.name       : testIntlWithoutNewUndefined0003
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewUndefined0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewUndefined0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12200
     * @tc.name       : testIntlWithoutNewUndefined0004
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewUndefined0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewUndefined0004";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: undefined
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12300
     * @tc.name       : testIntlWithoutNewShort0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewShort0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "short"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12400
     * @tc.name       : testIntlWithoutNewLong0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewLong0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "long"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12500
     * @tc.name       : testIntlWithoutNewShortOffset0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewShortOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewShortOffset0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "shortOffset"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12600
     * @tc.name       : testIntlWithoutNewLongOffset0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewLongOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewLongOffset0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "longOffset"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12700
     * @tc.name       : testIntlWithoutNewShortGeneric0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewShortGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewShortGeneric0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "shortGeneric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12800
     * @tc.name       : testIntlWithoutNewLongGeneric0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewLongGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewLongGeneric0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "longGeneric"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_12900
     * @tc.name       : testIntlWithoutNewBestFit0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewBestFit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewBestFit0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          formatMatcher: "best fit"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13000
     * @tc.name       : test testIntlWithoutNewBasic0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat with the given locales and options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlWithoutNewBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlWithoutNewBasic0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          formatMatcher: "basic"
        }
        let intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13100
     * @tc.name       : testIntlDateTimeFormatConstructorWithUndefinedFormatMatcher0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat with the given locales and options where formatMatcher is "undefined".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatConstructorWithUndefinedFormatMatcher0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = "testIntlDateTimeFormatConstructorWithUndefinedFormatMatcher0001";
        try {
          let locales = "de";
          let options: Intl.DateTimeFormatOptions = {
            formatMatcher: undefined
          }
          let intl = Intl.DateTimeFormat(locales, options);
          expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13200
     * @tc.name       : testIntlDateTimeFormatWithoutNew0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatWithoutNew0001";
      try {
        const locales = "de";
        const options: Intl.DateTimeFormatOptions = {
          hour12: true
        }
        const intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13300
     * @tc.name       : testIntlDateTimeFormatWithoutNewHour12False0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and options (hour12: false).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewHour12False0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatWithoutNewHour12False0001";
      try {
        const locales = "de";
        const options: Intl.DateTimeFormatOptions = {
          hour12: false
        }
        const intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13400
     * @tc.name       : testIntlDateTimeFormatWithoutNewHour12Undefined0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and options (hour12: undefined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewHour12Undefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testIntlDateTimeFormatWithoutNewHour12Undefined0001";
        try {
          const locales = "de";
          const options: Intl.DateTimeFormatOptions = {
            hour12: undefined
          }
          const intl = Intl.DateTimeFormat(locales, options);
          expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13500
     * @tc.name       : testIntlDateTimeFormatWithoutNewTimeZoneShanghai0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and options (timeZone: "Asia/Shanghai").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewTimeZoneShanghai0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testIntlDateTimeFormatWithoutNewTimeZoneShanghai0001";
        try {
          const locales = "de";
          const options: Intl.DateTimeFormatOptions = {
            timeZone: "Asia/Shanghai"
          }
          const intl = Intl.DateTimeFormat(locales, options);
          expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13600
     * @tc.name       : testIntlDateTimeFormatWithoutNewTimeZoneUndefined0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and options (timeZone: undefined).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewTimeZoneUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testIntlDateTimeFormatWithoutNewTimeZoneUndefined0001";
        try {
          const locales = "de";
          const options: Intl.DateTimeFormatOptions = {
            timeZone: undefined
          }
          const intl = Intl.DateTimeFormat(locales, options);
          expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13700
     * @tc.name       : testIntlDateTimeFormatWithoutNewEmptyOptions0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and empty options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewEmptyOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlDateTimeFormatWithoutNewEmptyOptions0001";
      try {
        const locales = "de";
        const options: Intl.DateTimeFormatOptions = {};
        const intl = Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13800
     * @tc.name       : testIntlDateTimeFormatWithoutNewDetailedOptions0001
     * @tc.desc       : Test the function of the interface Intl.DateTimeFormat without using the 'new' keyword with the given locales and detailed options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlDateTimeFormatWithoutNewDetailedOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testIntlDateTimeFormatWithoutNewDetailedOptions0001";
        try {
          const locales = "de";
          const options: Intl.DateTimeFormatOptions = {
            localeMatcher: "best fit",
            weekday: "long",
            era: "long",
            year: "numeric",
            month: "numeric",
            day: "numeric",
            hour: "numeric",
            minute: "2-digit",
            second: "numeric",
            timeZoneName: "short",
            formatMatcher: "best fit",
            hour12: false,
            timeZone: "UTC"
          }
          const intl = Intl.DateTimeFormat(locales, options);
          expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_13900
     * @tc.name       : test textIntlWithoutNew0001
     * @tc.desc       : Test the function of the interface WithoutNew.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlWithoutNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlWithoutNew0001';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZone: "test"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid timeZone');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14000
     * @tc.name       : test textIntlNew0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0001';
      try {
        let intl = new Intl.DateTimeFormat();
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14100
     * @tc.name       : test textIntlNew0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0002';
      try {
        let locales = "de";
        let intl = new Intl.DateTimeFormat(locales);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14200
     * @tc.name       : test textIntlNew0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0003';
      try {
        let locales = [];
        let intl = new Intl.DateTimeFormat(locales);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14300
     * @tc.name       : test textIntlNew0004
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0004';
      try {
        let locales = ["de", "en-US"];
        let intl = new Intl.DateTimeFormat(locales);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14400
     * @tc.name       : test textIntlNew0005
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0005';
      try {
        let intl = new Intl.DateTimeFormat(undefined);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14500
     * @tc.name       : test textIntlNew0006
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0006';
      try {
        let intl = new Intl.DateTimeFormat(undefined, undefined);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14600
     * @tc.name       : test textIntlNew0007
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0007';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14700
     * @tc.name       : test textIntlNew0008
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0008';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "lookup"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14800
     * @tc.name       : test textIntlNew0010
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0009';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_14900
     * @tc.name       : test textIntlNew0007
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0010';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "long"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15000
     * @tc.name       : test textIntlNew0011
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0011';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "short"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15100
     * @tc.name       : test textIntlNew0012
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0012';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: "narrow"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15200
     * @tc.name       : test textIntlNew0013
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textIntlNew0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textIntlNew0013';
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          weekday: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect(intl instanceof Intl.DateTimeFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15300
     * @tc.name       : testIntlNewLong0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewLong0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "long"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^n\. Chr\. \d{4}-\d{2}-\d{2}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15400
     * @tc.name       : testIntlNewLong0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewLong0002";
      try {
        let locales = "en";
        let options: Intl.DateTimeFormatOptions = {
          month: "long"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(months).assertContain(dateTimeFormat);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15500
     * @tc.name       : testIntlNewLong0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewLong0003";
      try {

        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          formatMatcher: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15600
     * @tc.name       : testIntlNewShort0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewShort0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "short"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^n\. Chr\. \d{4}-\d{2}-\d{2}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15700
     * @tc.name       : testIntlNewShort0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewShort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewShort0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "short"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15800
     * @tc.name       : testIntlNewShort0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewShort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewShort0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour12: true
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_15900
     * @tc.name       : testIntlNewNarrow0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNarrow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNarrow0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: "narrow"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^n\. Chr\. \d{4}-\d{2}-\d{2}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16000
     * @tc.name       : test testIntlNewNarrow0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNarrow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNarrow0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "narrow"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16100
     * @tc.name       : testIntlNewNarrow0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNarrow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNarrow0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour12: false
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16200
     * @tc.name       : testIntlNewUndefined0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          era: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^\d{1,2}\.\d{1,2}\.\d{4}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16300
     * @tc.name       : testIntlNewUndefined0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^\d{1,2}\.\d{1,2}\.\d{4}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16400
     * @tc.name       : testIntlNewUndefined0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^\d{1,2}\.\d{1,2}\.\d{4}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16500
     * @tc.name       : testIntlNewUndefined0004
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0004";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        const regex = /^\d{1,2}\.\d{1,2}\.\d{4}$/;
        expect(regex.test(dateTimeFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16600
     * @tc.name       : testIntlNewUndefined0005
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0005";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour12: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16700
     * @tc.name       : testIntlNewUndefined0006
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewUndefined0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewUndefined0006";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {};
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16800
     * @tc.name       : testIntlNewDigit0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewDigit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewDigit0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: "2-digit"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_16900
     * @tc.name       : testIntlNewDigit0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewDigit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewDigit0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "2-digit"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17000
     * @tc.name       : test testIntlNewDigit0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewDigit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewDigit0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: "2-digit"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17100
     * @tc.name       : testIntlNewDigit0004
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewDigit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewDigit0004";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZone: undefined
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17200
     * @tc.name       : testIntlNewNumeric0001
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0001";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          year: "numeric"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17300
     * @tc.name       : testIntlNewNumeric0002
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0002";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          month: "numeric"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date = new Date();
        let dateTimeFormat = intl.format(date);
        expect(dateTimeFormat.length <= 2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17400
     * @tc.name       : testIntlNewNumeric0003
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0003";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          day: "numeric"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17500
     * @tc.name       : testIntlNewNumeric0004
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0004";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: "numeric"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17600
     * @tc.name       : testIntlNewNumeric0005
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0005";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: "2-digit"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17700
     * @tc.name       : testIntlNewNumeric0006
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0006";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          hour: undefined
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17800
     * @tc.name       : testIntlNewNumeric0007
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0007";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: "numeric"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_17900
     * @tc.name       : testIntlNewNumeric0008
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0008";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: "2-digit"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18000
     * @tc.name       : test testIntlNewNumeric0009
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0009";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          minute: undefined
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18100
     * @tc.name       : testIntlNewNumeric0010
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0010";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: "numeric"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18200
     * @tc.name       : testIntlNewNumeric0011
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0011";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: "2-digit"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18300
     * @tc.name       : testIntlNewNumeric0012
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0012";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          second: undefined
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18400
     * @tc.name       : testIntlNewNumeric0013
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0013";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "short"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18500
     * @tc.name       : testIntlNewNumeric0014
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0014";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "long"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18600
     * @tc.name       : testIntlNewNumeric0015
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0015";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "shortOffset"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18700
     * @tc.name       : testIntlNewNumeric0016
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0016";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "longOffset"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18800
     * @tc.name       : testIntlNewNumeric0017
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0017";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "shortGeneric"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_18900
     * @tc.name       : testIntlNewNumeric0018
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0018";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: "longGeneric"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19000
     * @tc.name       : test testIntlNewNumeric0019
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0019";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZoneName: undefined
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19100
     * @tc.name       : testIntlNewNumeric0020
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0020";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          formatMatcher: "best fit"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19200
     * @tc.name       : testIntlNewNumeric0021
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0021";
      try {
        let locales: string = "de";
        let options: Intl.DateTimeFormatOptions = {
          formatMatcher: "basic"
        }
        let intl: Intl.DateTimeFormat = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19300
     * @tc.name       : testIntlNewNumeric0022
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlNewNumeric0022";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZone: "Asia/Shanghai"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1).assertEqual(dateTimeFormat2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19400
     * @tc.name       : testIntlNewNumeric0023
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testIntlNewNumeric0023";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit",
          weekday: "long",
          era: "long",
          year: "numeric",
          month: "numeric",
          day: "numeric",
          hour: "numeric",
          minute: "2-digit",
          second: "numeric",
          timeZoneName: "short",
          formatMatcher: "best fit",
          hour12: false,
          timeZone: "UTC"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        let date1 = new Date();
        await sleep(1000);
        let date2 = new Date();
        let dateTimeFormat1 = intl.format(date1);
        let dateTimeFormat2 = intl.format(date2);
        expect(dateTimeFormat1 != dateTimeFormat2).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19500
     * @tc.name       : testIntlNewNumeric0024
     * @tc.desc       : Test the function of the interface New.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlNewNumeric0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testIntlNewNumeric0024";
      try {
        let locales = "de";
        let options: Intl.DateTimeFormatOptions = {
          timeZone: "test"
        }
        let intl = new Intl.DateTimeFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid timeZone");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19600
     * @tc.name       : test testFormat0001
     * @tc.desc       : Test the function of the Interface IntlFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testFormat0001';
      try {
        let now = new Date(2021, 0, 2);
        let options: Intl.DateTimeFormatOptions = {
          year: 'numeric', month: '2-digit', day: '2-digit'
        }
        let formatter = new Intl.DateTimeFormat('en-US', options);
        let formattedDate = formatter.format(now);
        expect(dateRegex.test(formattedDate)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19700
     * @tc.name       : testFormat0003
     * @tc.desc       : Test the function of the Interface IntlFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testFormat0003';
      try {
        let timeStamp = 2;
        let dateFormat = Intl.DateTimeFormat().format(timeStamp);
        expect(dateRegex.test(dateFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19800
     * @tc.name       : test testFormat0004
     * @tc.desc       : Test the function of the Interface IntlFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testFormat0004';
      try {
        let timeStamp = -1;
        let dateFormat = Intl.DateTimeFormat().format(timeStamp);
        expect(dateRegex.test(dateFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_19900
     * @tc.name       : test testFormat0005
     * @tc.desc       : Test the function of the Interface IntlFormat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testFormat0005';
      try {
        let date: Date = new Date("2022-01-22 02:30:30");
        let timeStamp: number = date.getTime();
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit",
          weekday: "narrow",
          era: "narrow",
          year: "numeric",
          month: "long",
          day: "numeric",
          hour: "numeric",
          minute: "2-digit",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "basic",
          hour12: false,
          timeZone: "Asia/Shanghai"
        }
        let formatter = new Intl.DateTimeFormat("zh", options);
        let dateFormat: string = formatter.format(date);
        console.log(`Formatted date: ${dateFormat}`);
        expect(dateFormat).assertEqual('公元2022年1月22日六 中国标准时间 02:30:30');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20000
     * @tc.name       : test testFormat0006
     * @tc.desc       : Test the function of the Interface Format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testFormat0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFormat0006";
      try {
        let date = new Date(2022 - 1 - 22);
        let dateFormat = Intl.DateTimeFormat().format(date);
        expect(dateRegex.test(dateFormat)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20100
     * @tc.name       : test testFormat0007
     * @tc.desc       : Test the function of the Interface Format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testFormat0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFormat0007";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit",
          weekday: "long",
          era: "long",
          year: "numeric",
          month: "numeric",
          day: "numeric",
          hour: "numeric",
          minute: "numeric",
          second: "numeric",
          timeZoneName: "short",
          formatMatcher: "best fit",
          hour12: true,
          timeZone: "Asia/Shanghai"
        }
        let formatter = new Intl.DateTimeFormat("en-US", options);
        let dateFormat = formatter.format(date);
        expect(dateFormat).assertEqual("Saturday, 1 22, 2022 Anno Domini, 2:30:30 AM GMT+8");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20200
     * @tc.name       : test testFormat0008
     * @tc.desc       : Test the function of the Interface Format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testFormat0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFormat0008";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "lookup",
          weekday: "short",
          era: "short",
          year: "2-digit",
          month: "2-digit",
          day: "2-digit",
          hour: "2-digit",
          minute: "2-digit",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "basic",
          hour12: false,
          timeZone: "Asia/Shanghai"
        }
        let formatter = new Intl.DateTimeFormat("en-US", options);
        let dateFormat = formatter.format(date);
        expect(dateFormat).assertEqual("Sat, 01 22, 22 AD, 02:30:30 China Standard Time");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20300
     * @tc.name       : test testFormat0009
     * @tc.desc       : Test the function of the Interface Format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testFormat0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFormat0009";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "lookup",
          weekday: "short",
          era: "short",
          year: "2-digit",
          month: "short",
          day: "2-digit",
          hour: "2-digit",
          minute: "numeric",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "best fit",
          hour12: true,
          timeZone: "Asia/Shanghai"
        }
        let formatter = new Intl.DateTimeFormat("en-US", options);
        let dateFormat = formatter.format(date);
        expect(dateFormat).assertEqual("Sat, Jan 22, 22 AD, 02:30:30 AM China Standard Time");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20400
     * @tc.name       : test testFormat0010
     * @tc.desc       : Test the function of the Interface Format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testFormat0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFormat0010";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: undefined,
          weekday: undefined,
          era: undefined,
          year: "2-digit",
          month: "narrow",
          day: "2-digit",
          hour: "2-digit",
          minute: "numeric",
          second: "2-digit",
          timeZoneName: undefined,
          formatMatcher: undefined,
          hour12: undefined,
          timeZone: undefined
        }
        let formatter = new Intl.DateTimeFormat("en-US", options);
        let dateFormat = formatter.format(date);
        expect(dateFormat).assertEqual("J 22, 22, 02:30:30 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20500
     * @tc.name       : test testIntlFormatToParts0001
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0001";
      try {
        let date = new Date();
        let parts = new Intl.DateTimeFormat('en-US').formatToParts(date);
        let partsValue = parts.map(p => p.value);
        let partsValueToString = partsValue.join("");
        const dateRegex = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
        expect(dateRegex.test(partsValueToString)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20600
     * @tc.name       : test testIntlFormatToParts0002
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0002";
      try {
        let date = new Date(2022, 0, 22);
        let timeStamp = date.getTime();
        let parts = Intl.DateTimeFormat('en-GB').formatToParts(timeStamp);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("22/01/2022");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20700
     * @tc.name       : testIntlFormatToParts0003
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0003";
      try {
        let timeStamp = 2;
        let parts = Intl.DateTimeFormat().formatToParts(timeStamp);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(dateRegex.test(partsValueToString)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20800
     * @tc.name       : test testIntlFormatToParts0004
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0004";
      try {
        let timeStamp = -1;
        let parts = Intl.DateTimeFormat().formatToParts(timeStamp);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(dateRegex.test(partsValueToString)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_20900
     * @tc.name       : test testIntlFormatToParts0005
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0005";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let timeStamp = date.getTime();
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit",
          weekday: "narrow",
          era: "narrow",
          year: "numeric",
          month: "long",
          day: "numeric",
          hour: "numeric",
          minute: "2-digit",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "basic",
          hour12: false,
          timeZone: "Asia/Shanghai"
        }
        let parts = new Intl.DateTimeFormat("zh", options).formatToParts(timeStamp);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("公元2022年1月22日六 中国标准时间 02:30:30");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21000
     * @tc.name       : test testIntlFormatToParts0006
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0006";
      try {
        let date = new Date(2022, 0, 22);
        let parts = new Intl.DateTimeFormat('en-GB').formatToParts(date);
        let partsValue = parts.map(p => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("22/01/2022");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21100
     * @tc.name       : test testIntlFormatToParts0007
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0007";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "best fit",
          weekday: "long",
          era: "long",
          year: "numeric",
          month: "numeric",
          day: "numeric",
          hour: "numeric",
          minute: "numeric",
          second: "numeric",
          timeZoneName: "short",
          formatMatcher: "best fit",
          hour12: true,
          timeZone: "Asia/Shanghai"
        }
        let parts = new Intl.DateTimeFormat("en-US", options).formatToParts(date);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("Saturday, 1 22, 2022 Anno Domini, 2:30:30 AM GMT+8");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21200
     * @tc.name       : test testIntlFormatToParts0008
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0008";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "lookup",
          weekday: "short",
          era: "short",
          year: "2-digit",
          month: "2-digit",
          day: "2-digit",
          hour: "2-digit",
          minute: "2-digit",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "basic",
          hour12: false,
          timeZone: "Asia/Shanghai"
        }
        let parts = new Intl.DateTimeFormat("en-US", options).formatToParts(date);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        console.log(partsValueToString);
        expect(partsValueToString).assertEqual("Sat, 01 22, 22 AD, 02:30:30 China Standard Time");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21300
     * @tc.name       : test testIntlFormatToParts0009
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0009";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: "lookup",
          weekday: "short",
          era: "short",
          year: "2-digit",
          month: "short",
          day: "2-digit",
          hour: "2-digit",
          minute: "numeric",
          second: "2-digit",
          timeZoneName: "long",
          formatMatcher: "best fit",
          hour12: true,
          timeZone: "Asia/Shanghai"
        }
        let parts = new Intl.DateTimeFormat("en-US", options).formatToParts(date);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("Sat, Jan 22, 22 AD, 02:30:30 AM China Standard Time");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21400
     * @tc.name       : test testIntlFormatToParts0010
     * @tc.desc       : Test the function of the interface formatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlFormatToParts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlFormatToParts0010";
      try {
        let date = new Date("2022-01-22 02:30:30");
        let options: Intl.DateTimeFormatOptions = {
          localeMatcher: undefined,
          weekday: undefined,
          era: undefined,
          year: "2-digit",
          month: "narrow",
          day: "2-digit",
          hour: "2-digit",
          minute: "numeric",
          second: "2-digit",
          timeZoneName: undefined,
          formatMatcher: undefined,
          hour12: undefined,
          timeZone: undefined
        }
        let parts = new Intl.DateTimeFormat("en-US", options).formatToParts(date);
        let partsValue = parts.map((p) => p.value);
        let partsValueToString = partsValue.join("");
        expect(partsValueToString).assertEqual("J 22, 22, 02:30:30 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0100
     * @tc.name       : testNumberFormatConstructorNew0001
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0001";
      try {
        let numberFormat = new Intl.NumberFormat();
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0200
     * @tc.name       : testNumberFormatConstructorNew0002
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0002";
      try {
        let locales = "zh";
        let numberFormat = new Intl.NumberFormat(locales);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0300
     * @tc.name       : testNumberFormatConstructorNew0003
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0003";
      try {
        let locales = "";
        let numberFormat = new Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('invalid locale');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0400
     * @tc.name       : testNumberFormatConstructorNew0004
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0004";
      try {
        let locales = "test";
        let numberFormat = new Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('invalid locale');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0500
     * @tc.name       : testNumberFormatConstructorNew0005
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0005";
      try {
        let locales = [];
        let numberFormat = new Intl.NumberFormat(locales);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0600
     * @tc.name       : testNumberFormatConstructorNew0006
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0006";
      try {
        let locales = ["zh"];
        let numberFormat = new Intl.NumberFormat(locales);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0700
     * @tc.name       : testNumberFormatConstructorNew0007
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0007";
      try {
        let locales = ["zh", "en-US", "de"];
        let numberFormat = new Intl.NumberFormat(locales);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0800
     * @tc.name       : testNumberFormatConstructorNew0008
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0008";
      try {
        let locales = ["zh", "en-US", "de", "test"];
        let numberFormat = new Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('invalid locale');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_0900
     * @tc.name       : testNumberFormatConstructorNew0009
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0009";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "lookup"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1000
     * @tc.name       : testNumberFormatConstructorNew0010
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0010";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "best fit"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1100
     * @tc.name       : testNumberFormatConstructorNew0011
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0011";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1200
     * @tc.name       : testNumberFormatConstructorNew0012
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0012";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "test"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(error.message).assertEqual('getStringOption failed');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1300
     * @tc.name       : testNumberFormatConstructorNew0013
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0013";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "decimal"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1400
     * @tc.name       : testNumberFormatConstructorNew0014
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0014";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "currency"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect(`${error.message}`).assertEqual("style is currency but currency is undefined");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1500
     * @tc.name       : testNumberFormatConstructorNew0015
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0015";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "currency",
          currency: "USD"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1600
     * @tc.name       : testNumberFormatConstructorNew0016
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0016";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "percent"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1700
     * @tc.name       : testNumberFormatConstructorNew0017
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0017";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "unit",
          unit: "kilometer"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (error) {
        console.error(`${TAG} failed, error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1800
     * @tc.name       : testNumberFormatConstructorNew0018
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0018";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_1900
     * @tc.name       : testNumberFormatConstructorNew0019
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0019";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currency: "EUR"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2000
     * @tc.name       : testNumberFormatConstructorNew0020
     * @tc.desc       : Test the function of the Interface NumberFormatConstructorNew
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNumberFormatConstructorNew0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0020";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currency: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2100
     * @tc.name       : testNumberFormatConstructorNew0021
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0021";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currency: "test"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("not a wellformed code");
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2200
     * @tc.name       : testNumberFormatConstructorNew0022
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0022";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: "standard"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2300
     * @tc.name       : testNumberFormatConstructorNew0023
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0023";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "currency",
          currency: "CNY",
          currencySign: "accounting"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(-1234567.89);
        expect(formattedNumber).assertEqual("(¥1,234,567.89)");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2400
     * @tc.name       : testNumberFormatConstructorNew0024
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0024";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2500
     * @tc.name       : testNumberFormatConstructorNew0025
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0025";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: "test"
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getStringOption failed");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2600
     * @tc.name       : testNumberFormatConstructorNew0026
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0026";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: true
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2700
     * @tc.name       : testNumberFormatConstructorNew0027
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0027";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: false
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1234567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2800
     * @tc.name       : testNumberFormatConstructorNew0028
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0028";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_2900
     * @tc.name       : testNumberFormatConstructorNew0029
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0029";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 1
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3000
     * @tc.name       : testNumberFormatConstructorNew0030
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0030";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 10
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("0,001,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3100
     * @tc.name       : testNumberFormatConstructorNew0031
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0031";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 21
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("000,000,000,000,001,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3200
     * @tc.name       : testNumberFormatConstructorNew0032
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0032";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3300
     * @tc.name       : testNumberFormatConstructorNew0033
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0033";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 0
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3400
     * @tc.name       : testNumberFormatConstructorNew0034
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0034";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 22
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3500
     * @tc.name       : testNumberFormatConstructorNew0035
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0035";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 0
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3600
     * @tc.name       : testNumberFormatConstructorNew0036
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0036";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 50
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3700
     * @tc.name       : testNumberFormatConstructorNew0037
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0037";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 100
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3800
     * @tc.name       : testNumberFormatConstructorNew0038
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0038";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_3900
     * @tc.name       : testNumberFormatConstructorNew0039
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0039";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: -1
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4000
     * @tc.name       : testNumberFormatConstructorNew0040
     * @tc.desc       : Test the function of the interface NumberFormatConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorNew0040";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 101
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4100
     * @tc.name       : testNumberFormatConstructorNew0041
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0041';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: 0
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4200
     * @tc.name       : testNumberFormatConstructorNew0042
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0042';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: 50
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4300
     * @tc.name       : testNumberFormatConstructorNew0043
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0043';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: 100
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4400
     * @tc.name       : testNumberFormatConstructorNew0044
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0044';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4500
     * @tc.name       : testNumberFormatConstructorNew0045
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0045';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: -1
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4600
     * @tc.name       : testNumberFormatConstructorNew0046
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0046';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: 101
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4700
     * @tc.name       : testNumberFormatConstructorNew0047
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0047';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 1
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4800
     * @tc.name       : testNumberFormatConstructorNew0048
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0048';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 10
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_4900
     * @tc.name       : testNumberFormatConstructorNew0049
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0049';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 21
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5000
     * @tc.name       : testNumberFormatConstructorNew0050
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0050';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5100
     * @tc.name       : testNumberFormatConstructorNew0051
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0051';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 0
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5200
     * @tc.name       : testNumberFormatConstructorNew0052
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0052';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 22
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5300
     * @tc.name       : testNumberFormatConstructorNew0053
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0053';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 1
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5400
     * @tc.name       : testNumberFormatConstructorNew004
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0054';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 10
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5500
     * @tc.name       : testNumberFormatConstructorNew0055
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0055';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 21
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5600
     * @tc.name       : testNumberFormatConstructorNew0056
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0056';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: undefined
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        let formattedNumber = numberFormat.format(1234567.89);
        expect(formattedNumber).assertEqual("1,234,567.89");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5700
     * @tc.name       : testNumberFormatConstructorNew0057
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0057';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 0
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5800
     * @tc.name       : testNumberFormatConstructorNew0058
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0058';
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 22
        }
        let numberFormat = new Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_5900
     * @tc.name       : testNumberFormatConstructorNew0059
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0059';
      try {
        let numberFormat = new Intl.NumberFormat(undefined);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6000
     * @tc.name       : testNumberFormatConstructorNew0060
     * @tc.desc       :The main purpose is to format numbers into strings that conform to the specific linguistic environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorNew0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testNumberFormatConstructorNew0060';
      try {
        let numberFormat = new Intl.NumberFormat(undefined, undefined);
        expect(numberFormat !== undefined && numberFormat !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6100
     * @tc.name       : testNumberFormatConstructorWithoutNew0001
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0001";
      try {
        let numberFormat = Intl.NumberFormat();
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6200
     * @tc.name       : testNumberFormatConstructorWithoutNew0002
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0002";
      try {
        let locales = "zh";
        let numberFormat = Intl.NumberFormat(locales);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6300
     * @tc.name       : testNumberFormatConstructorWithoutNew0003
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0003";
      try {
        let locales = "";
        let numberFormat = Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6400
     * @tc.name       : testNumberFormatConstructorWithoutNew0004
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0004";
      try {
        let locales = "test";
        let numberFormat = Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6500
     * @tc.name       : testNumberFormatConstructorWithoutNew0005
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0005";
      try {
        let locales = [];
        let numberFormat = Intl.NumberFormat(locales);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6600
     * @tc.name       : testNumberFormatConstructorWithoutNew0006
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0006";
      try {
        let locales = ["zh"];
        let numberFormat = Intl.NumberFormat(locales);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6700
     * @tc.name       : testNumberFormatConstructorWithoutNew0007
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0007";
      try {
        let locales = ["zh", "en-US", "de"];
        let numberFormat = Intl.NumberFormat(locales);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6800
     * @tc.name       : testNumberFormatConstructorWithoutNew0008
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0008";
      try {
        let locales = ["zh", "en-US", "de", "test"];
        let numberFormat = Intl.NumberFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_6900
     * @tc.name       : testNumberFormatConstructorWithoutNew0009
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0009";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "lookup"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7000
     * @tc.name       : testNumberFormatConstructorWithoutNew0010
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0010";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "best fit"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7100
     * @tc.name       : testNumberFormatConstructorWithoutNew0011
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0011";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7200
     * @tc.name       : testNumberFormatConstructorWithoutNew0012
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0012";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          localeMatcher: "test"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getStringOption failed");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7300
     * @tc.name       : testNumberFormatConstructorWithoutNew0013
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0013";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "decimal"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7400
     * @tc.name       : testNumberFormatConstructorWithoutNew0014
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0014";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "currency"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("style is currency but currency is undefined");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7500
     * @tc.name       : testNumberFormatConstructorWithoutNew0015
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0015";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "USD"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7600
     * @tc.name       : testNumberFormatConstructorWithoutNew0016
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0016";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: "percent"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7700
     * @tc.name       : testNumberFormatConstructorWithoutNew0018
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0018";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          style: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7800
     * @tc.name       : testNumberFormatConstructorWithoutNew0019
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0019";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currency: "EUR"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_7900
     * @tc.name       : testNumberFormatConstructorWithoutNew0020
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0020";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currency: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8000
     * @tc.name       : testNumberFormatConstructorWithoutNew0022
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0022";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: "standard"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8100
     * @tc.name       : testNumberFormatConstructorWithoutNew0023
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0023";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: "accounting"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8200
     * @tc.name       : testNumberFormatConstructorWithoutNew0024
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0024";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8300
     * @tc.name       : testNumberFormatConstructorWithoutNew0025
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0025";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          currencySign: "test"
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getStringOption failed");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8400
     * @tc.name       : testNumberFormatConstructorWithoutNew0026
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0026";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: true
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8500
     * @tc.name       : testNumberFormatConstructorWithoutNew0027
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0027";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: false
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8600
     * @tc.name       : testNumberFormatConstructorWithoutNew0028
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0028";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          useGrouping: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8700
     * @tc.name       : testNumberFormatConstructorWithoutNew0029
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0029";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 1
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8800
     * @tc.name       : testNumberFormatConstructorWithoutNew0030
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0030";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 10
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_8900
     * @tc.name       : testNumberFormatConstructorWithoutNew0031
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0031";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 21
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9000
     * @tc.name       : testNumberFormatConstructorWithoutNew0032
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0032";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9100
     * @tc.name       : testNumberFormatConstructorWithoutNew0033
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0033";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 0
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9200
     * @tc.name       : testNumberFormatConstructorWithoutNew0034
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0034";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 22
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9300
     * @tc.name       : testNumberFormatConstructorWithoutNew0035
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0035";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 0
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat instanceof Intl.NumberFormat).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9400
     * @tc.name       : testNumberFormatConstructorWithoutNew0036
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0036";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: 50
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9500
     * @tc.name       : testNumberFormatConstructorWithoutNew0038
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0038";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumFractionDigits: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9600
     * @tc.name       : testNumberFormatConstructorWithoutNew0041
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0041";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: 0
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9700
     * @tc.name       : testNumberFormatConstructorWithoutNew0044
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0044";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumFractionDigits: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9800
     * @tc.name       : testNumberFormatConstructorWithoutNew0047
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0047";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 1
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_9900
     * @tc.name       : testNumberFormatConstructorWithoutNew0048
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0048";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 10
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_100
     * @tc.name       : testNumberFormatConstructorWithoutNew0049
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0049";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 21
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10100
     * @tc.name       : testNumberFormatConstructorWithoutNew0050
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0050";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10200
     * @tc.name       : testNumberFormatConstructorWithoutNew0051
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0051";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 0
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10300
     * @tc.name       : testNumberFormatConstructorWithoutNew0052
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0052";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          minimumSignificantDigits: 22
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10400
     * @tc.name       : testNumberFormatConstructorWithoutNew0053
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0053";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 1
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10500
     * @tc.name       : testNumberFormatConstructorWithoutNew0054
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0054";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 10
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10600
     * @tc.name       : testNumberFormatConstructorWithoutNew0055
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0055";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 21
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10700
     * @tc.name       : testNumberFormatConstructorWithoutNew0056
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0056";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: undefined
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10800
     * @tc.name       : testNumberFormatConstructorWithoutNew0057
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0057";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 0
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_10900
     * @tc.name       : testNumberFormatConstructorWithoutNew0058
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0058";
      try {
        let locales = "zh";
        let options: Intl.NumberFormatOptions = {
          maximumSignificantDigits: 22
        }
        let numberFormat = Intl.NumberFormat(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11000
     * @tc.name       : testNumberFormatConstructorWithoutNew0059
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0059";
      try {
        let numberFormat = Intl.NumberFormat(undefined);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11100
     * @tc.name       : testNumberFormatConstructorWithoutNew0060
     * @tc.desc       : Test the function of the constructor without new.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatConstructorWithoutNew0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatConstructorWithoutNew0060";
      try {
        let numberFormat = Intl.NumberFormat(undefined, undefined);
        expect(numberFormat.constructor.name).assertEqual('NumberFormat');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11200
     * @tc.name       : testSupportedLocalesOf0001
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0001';
      try {
        let locales = 'de-ID';
        let result = Intl.NumberFormat.supportedLocalesOf(locales);
        expect(result.toString()).assertEqual(["de-ID"].toString());
        expect(Array.isArray(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11300
     * @tc.name       : testSupportedLocalesOf0002
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0002';
      try {
        let locales = ''
        ;
        Intl.NumberFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11400
     * @tc.name       : testSupportedLocalesOf0003
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0003';
      try {
        let locales = 'test';
        Intl.NumberFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11500
     * @tc.name       : testSupportedLocalesOf0004
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0004';
      try {
        let locales = [];
        let result = Intl.NumberFormat.supportedLocalesOf(locales);
        expect(result.toString()).assertEqual([''].toString());
        expect(Array.isArray(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11600
     * @tc.name       : testSupportedLocalesOf0005
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0005';
      try {
        let locales = ['id-u-co-pinyin'];
        let result = Intl.NumberFormat.supportedLocalesOf(locales);
        expect(result.toString()).assertEqual('id-u-co-pinyin');
        expect(Array.isArray(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11700
     * @tc.name       : testSupportedLocalesOf0006
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0006';
      try {
        let locales = ['id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.NumberFormat.supportedLocalesOf(locales);
        expect(result.join(',')).assertEqual(['id-u-co-pinyin', 'de-ID', 'en-US'].toString());
        expect(Array.isArray(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11800
     * @tc.name       : testSupportedLocalesOf0007
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0007';
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        Intl.NumberFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_11900
     * @tc.name       : testSupportedLocalesOf0008
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0008';
      try {
        let locales = ['ban', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.NumberFormat.supportedLocalesOf(locales);
        expect(result.join(',')).assertEqual(['id-u-co-pinyin', 'de-ID', 'en-US'].toString());
        expect(Array.isArray(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12000
     * @tc.name       : testSupportedLocalesOf0010
     * @tc.desc       : Test the function of the Interface supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSupportedLocalesOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testSupportedLocalesOf0010';
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US']
        ;
        let options: Intl.NumberFormatOptions = {
          localeMatcher: 'best fit'
        }
        Intl.NumberFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12100
     * @tc.name       : testResolvedOptions0001
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0001';
      try {
        let options = Intl.NumberFormat().resolvedOptions();
        expect(options.locale).assertEqual('en-US');
        expect(options.numberingSystem).assertEqual('latn');
        expect(options.style).assertEqual('decimal');
        expect(options.minimumIntegerDigits).assertEqual(1);
        expect(options.minimumFractionDigits).assertEqual(0);
        expect(options.maximumFractionDigits).assertEqual(3);
        expect(options.useGrouping).assertTrue();
        expect(options.notation).assertEqual("standard");
        expect(options.signDisplay).assertEqual("auto");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12200
     * @tc.name       : testResolvedOptions0002
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0002';
      try {
        let options = Intl.NumberFormat("de").resolvedOptions();
        expect(options.locale).assertEqual("de");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12300
     * @tc.name       : testResolvedOptions0003
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0003';
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "EUR"
        }
        let getOptions = new Intl.NumberFormat("de", options).resolvedOptions();
        expect(getOptions.locale).assertEqual('de');
        expect(getOptions.numberingSystem).assertEqual('latn');
        expect(getOptions.style).assertEqual('currency');
        expect(getOptions.currency).assertEqual('EUR');
        expect(getOptions.currencyDisplay).assertEqual('symbol');
        expect(getOptions.currencySign).assertEqual('standard');
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(2);
        expect(getOptions.maximumFractionDigits).assertEqual(2);
        expect(getOptions.useGrouping).assertTrue();
        expect(getOptions.notation).assertEqual('standard');
        expect(getOptions.signDisplay).assertEqual('auto');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12400
     * @tc.name       : testResolvedOptions0004
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0004';
      try {
        let options: Intl.NumberFormatOptions = {
          style: "percent"
        }
        let getOptions = new Intl.NumberFormat("de", options).resolvedOptions();
        expect(getOptions.locale).assertEqual('de');
        expect(getOptions.numberingSystem).assertEqual('latn');
        expect(getOptions.style).assertEqual('percent');
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(0);
        expect(getOptions.useGrouping).assertTrue();
        expect(getOptions.notation).assertEqual('standard');
        expect(getOptions.signDisplay).assertEqual('auto');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12500
     * @tc.name       : testResolvedOptions0005
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0005';
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "EUR", currencySign: "accounting"
        }
        let getOptions = new Intl.NumberFormat("de", options).resolvedOptions();
        expect(getOptions.locale).assertEqual('de');
        expect(getOptions.numberingSystem).assertEqual('latn');
        expect(getOptions.style).assertEqual('currency');
        expect(getOptions.currency).assertEqual('EUR');
        expect(getOptions.currencyDisplay).assertEqual('symbol');
        expect(getOptions.currencySign).assertEqual('accounting');
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(2);
        expect(getOptions.maximumFractionDigits).assertEqual(2);
        expect(getOptions.useGrouping).assertTrue();
        expect(getOptions.notation).assertEqual('standard');
        expect(getOptions.signDisplay).assertEqual('auto');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12600
     * @tc.name       : testResolvedOptions0006
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0006';
      try {
        let options: Intl.NumberFormatOptions = {
          useGrouping: false
        }
        let getOptions = new Intl.NumberFormat("de", options).resolvedOptions();
        expect(getOptions.locale).assertEqual('de');
        expect(getOptions.numberingSystem).assertEqual('latn');
        expect(getOptions.style).assertEqual('decimal');
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.useGrouping).assertFalse();
        expect(getOptions.notation).assertEqual('standard');
        expect(getOptions.signDisplay).assertEqual('auto');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12700
     * @tc.name       : testResolvedOptions0007
     * @tc.desc       : Test the function of the Interface ResolvedOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResolvedOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testResolvedOptions0007';
      try {
        let options: Intl.NumberFormatOptions = {
          minimumIntegerDigits: 10
        }
        let getOptions = new Intl.NumberFormat("de", options).resolvedOptions();
        expect(getOptions.minimumIntegerDigits).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12800
     * @tc.name       : testNumberFormat0001
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0001";
      try {
        let format = Intl.NumberFormat().format(100);
        expect(format).assertEqual("100");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_12900
     * @tc.name       : testNumberFormat0002
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0002";
      try {
        let format = Intl.NumberFormat("de").format(100);
        expect(format).assertEqual("100");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13000
     * @tc.name       : testNumberFormat0003
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0003";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: 'RUB'
        }
        let format = Intl.NumberFormat('ru-RU', options).format(100);
        expect(format).assertEqual("100,00\xa0₽");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13100
     * @tc.name       : testNumberFormat0004
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0004";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "CNY"
        }
        let format = Intl.NumberFormat("zh", options).format(100);
        expect(format).assertEqual("¥100.00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13200
     * @tc.name       : testNumberFormat0005
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0005";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "CNY", minimumIntegerDigits: 4
        }
        let format = Intl.NumberFormat("zh", options).format(100);
        expect(format).assertEqual("¥0,100.00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13300
     * @tc.name       : testNumberFormat0006
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().format().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormat0006";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "percent"
        }
        let format = Intl.NumberFormat("de", options).format(100);
        expect(format).assertEqual("10.000\xa0%");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13400
     * @tc.name       : testNumberFormatFormatToParts0001
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatFormatToParts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatFormatToParts0001";
      try {
        let formatToParts = Intl.NumberFormat().formatToParts();
        expect(Array.isArray(formatToParts)).assertEqual(true);
        expect(JSON.stringify(formatToParts)).assertEqual(JSON.stringify([{
          "type": "nan", "value": "NaN"
        }]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13500
     * @tc.name       : testNumberFormatFormatToParts0002
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatFormatToParts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatFormatToParts0002";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: 'USD'
        }
        let formatToParts = Intl.NumberFormat("en-us", options).formatToParts();
        expect(Array.isArray(formatToParts)).assertEqual(true);
        expect(JSON.stringify(formatToParts)).assertEqual(JSON.stringify([{
          "type": "currency", "value": "$"
        }, {
          "type": "nan", "value": "NaN"
        }]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13600
     * @tc.name       : testNumberFormatFormatToParts0003
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatFormatToParts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatFormatToParts0003";
      try {
        let formatToParts = Intl.NumberFormat("de").formatToParts(100);
        expect(Array.isArray(formatToParts)).assertEqual(true);
        expect(JSON.stringify(formatToParts)).assertEqual(JSON.stringify([{
          "type": "integer", "value": "100"
        }]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13700
     * @tc.name       : testNumberFormatFormatToParts0004
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatFormatToParts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatFormatToParts0004";
      try {
        let options: Intl.NumberFormatOptions = {
          style: "currency", currency: "CNY"
        }
        let formatToParts = Intl.NumberFormat("zh", options).formatToParts(100.872);
        expect(Array.isArray(formatToParts)).assertEqual(true);
        expect(JSON.stringify(formatToParts)).assertEqual(JSON.stringify([{
          "type": "currency", "value": "¥"
        }, {
          "type": "integer", "value": "100"
        }, {
          "type": "decimal", "value": "."
        }, {
          "type": "fraction", "value": "87"
        }]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_FORMAT_13800
     * @tc.name       : testNumberFormatFormatToParts0005
     * @tc.desc       : Test the function of the interface Intl.NumberFormat().formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNumberFormatFormatToParts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNumberFormatFormatToParts0005";
      try {
        const options: Intl.NumberFormatOptions = {
          style: "percent"
        }
        const formatToPartsResult = new Intl.NumberFormat("de", options).formatToParts(100);
        formatToPartsResult.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(formatToPartsResult)}`)
          .assertEqual('[{"type":"integer","value":"10"},{"type":"group","value":"."},{"type":"integer","value":"000"},{"type":"literal","value":"\xa0"},{"type":"percentSign","value":"%"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21500
     * @tc.name       : testPluralRulesConstructor0001
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0001';
      try {
        let pluralRules = Intl.PluralRules();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('newTarget is undefined');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21600
     * @tc.name       : testPluralRulesConstructor0002
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0002';
      try {
        let pluralRules = new Intl.PluralRules();
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21700
     * @tc.name       : testPluralRulesConstructor0003
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0003';
      try {
        let locales = "en-US";
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21800
     * @tc.name       : testPluralRulesConstructor0004
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0004';
      try {
        let locales = "";
        let pluralRules = new Intl.PluralRules(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('invalid locale');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_21900
     * @tc.name       : testPluralRulesConstructor0005
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0005';
      try {
        let locales = "test";
        let pluralRules = new Intl.PluralRules(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('invalid locale');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2200
     * @tc.name       : testPluralRulesConstructor0006
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0006';
      try {
        let locales = [];
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22100
     * @tc.name       : testPluralRulesConstructor0007
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0007';
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22200
     * @tc.name       : testPluralRulesConstructor0008
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0008';
      try {
        let locales = ["zh", "de", "en-US"];
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22300
     * @tc.name       : testPluralRulesConstructor0009
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0009';
      try {
        let locales = ["test", "de", "en-US"];
        let pluralRules = new Intl.PluralRules(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('invalid locale');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22400
     * @tc.name       : testPluralRulesConstructor0010
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0010';
      try {
        let locales = ["zh"];
        let options: DateTimeFormatOptions = {
          localeMatcher: "lookup"
        };
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22500
     * @tc.name       : testPluralRulesConstructor0011
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0011';
      try {
        let locales = ["zh"];
        let options: DateTimeFormatOptions = {
          localeMatcher: "best fit"
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22600
     * @tc.name       : testPluralRulesConstructor0012
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0012';
      try {
        let locales = ["zh"]
        let options: DateTimeFormatOptions = {
          localeMatcher: undefined
        }
        let pluralRules = new Intl.PluralRules(locales)
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22700
     * @tc.name       : testPluralRulesConstructor0013
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0013';
      try {
        let locales = ["zh"];
        let options: DateTimeFormatOptions = {
          type: "cardinal"
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22800
     * @tc.name       : testPluralRulesConstructor0014
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0014';
      try {
        let locales = ["zh"];
        let options: DateTimeFormatOptions = {
          type: "ordinal"
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_22900
     * @tc.name       : testPluralRulesConstructor0015
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0015';
      try {
        let locales = ["zh"];
        let options: DateTimeFormatOptions = {
          type: undefined
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2300
     * @tc.name       : testPluralRulesConstructor0016
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0016';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: 1
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23100
     * @tc.name       : testPluralRulesConstructor0017
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0017';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: 10
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23200
     * @tc.name       : testPluralRulesConstructor0018
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0018';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: 21
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23300
     * @tc.name       : testPluralRulesConstructor0019
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0019';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: undefined
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23400
     * @tc.name       : testPluralRulesConstructor0020
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0020';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: 0
        };

        if (options.minimumIntegerDigits !== undefined &&
          (options.minimumIntegerDigits < 1 || options.minimumIntegerDigits > 21)) {
          throw new Error('minimumIntegerDigits must be between 1 and 21');
        }

        let pluralRules = new Intl.PluralRules(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('minimumIntegerDigits must be between 1 and 21');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23500
     * @tc.name       : testPluralRulesConstructor0021
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0021';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumIntegerDigits: 0
        };

        if (options.minimumIntegerDigits !== undefined &&
          (options.minimumIntegerDigits < 1 || options.minimumIntegerDigits > 21)) {
          throw new Error('minimumIntegerDigits must be between 1 and 21');
        }

        let pluralRules = new Intl.PluralRules(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('minimumIntegerDigits must be between 1 and 21');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23600
     * @tc.name       : testPluralRulesConstructor0022
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesConstructor0022';
      try {
        let locales = ["zh"];
        let options: ExtendedDateTimeFormatOptions = {
          minimumFractionDigits: 0
        }
        let pluralRules = new Intl.PluralRules(locales);
        expect(pluralRules.toString()).assertEqual('[object Intl.PluralRules]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23700
     * @tc.name       : testPluralRulesConstructor0023
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0023";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumFractionDigits: 10
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23800
     * @tc.name       : testPluralRulesConstructor0024
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0024";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumFractionDigits: 20
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_23900
     * @tc.name       : testPluralRulesConstructor0025
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0025";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumFractionDigits: undefined
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2400
     * @tc.name       : testPluralRulesConstructor0026
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0026";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumFractionDigits: -1
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }

    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24100
     * @tc.name       : testPluralRulesConstructor0027
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0027";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumFractionDigits: 21
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24200
     * @tc.name       : testPluralRulesConstructor0028
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0028";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: 0
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24300
     * @tc.name       : testPluralRulesConstructor0029
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0029";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: 10
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24400
     * @tc.name       : testPluralRulesConstructor0030
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0030";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: 20
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24500
     * @tc.name       : testPluralRulesConstructor0031
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0031";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: undefined
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24600
     * @tc.name       : testPluralRulesConstructor0032
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0032";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: -1
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24700
     * @tc.name       : testPluralRulesConstructor0033
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0033";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumFractionDigits: 21
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24800
     * @tc.name       : testPluralRulesConstructor0034
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0034";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: 1
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_24900
     * @tc.name       : testPluralRulesConstructor0035
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0035";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: 10
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2500
     * @tc.name       : testPluralRulesConstructor0036
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0036";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: 21
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25100
     * @tc.name       : testPluralRulesConstructor0037
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0037";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: undefined
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25200
     * @tc.name       : testPluralRulesConstructor0038
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0038";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: 0
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25300
     * @tc.name       : testPluralRulesConstructor0039
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0039";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          minimumSignificantDigits: 22
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25400
     * @tc.name       : testPluralRulesConstructor0040
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0040";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumSignificantDigits: 1
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25500
     * @tc.name       : testPluralRulesConstructor0041
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0041";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumSignificantDigits: 10
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25600
     * @tc.name       : testPluralRulesConstructor0042
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0042";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumSignificantDigits: 21
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25700
     * @tc.name       : testPluralRulesConstructor0043
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0043";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumSignificantDigits: undefined
        });
        expect(pluralRules instanceof Intl.PluralRules).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_25800
     * @tc.name       : testPluralRulesConstructor0044
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPluralRulesConstructor0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPluralRulesConstructor0044";
      try {
        let locales = ["zh"];
        let pluralRules = new Intl.PluralRules(locales, {
          maximumSignificantDigits: 22
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(`${err.name}`).assertEqual("RangeError");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_259000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0001
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRules-supportedLocalesOf0001";
      try {
        let locales = 'de-ID';
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["de-ID"]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2600
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0002
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0002";
      try {
        let locales = '';
        Intl.PluralRules.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_261000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0003
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0003";
      try {
        let locales = 'test';
        Intl.PluralRules.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_262000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0004
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0004";
      try {
        let locales = [];
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_263000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0005
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0005";
      try {
        let locales = ['id-u-co-pinyin'];
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(['id-u-co-pinyin']));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_264000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0006
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0006";
      try {
        let locales = ['id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(['id-u-co-pinyin', 'de-ID', 'en-US']));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_265000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0007
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0007";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        Intl.PluralRules.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_266000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0008
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0008";
      try {
        let locales = ['ban', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(['id-u-co-pinyin', 'de-ID', 'en-US']));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_267000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0009
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0009";
      try {
        let locales = 'de-ID';
        let options: Intl.PluralRulesOptions = {
          localeMatcher: 'lookup'
        };
        let result = Intl.PluralRules.supportedLocalesOf(locales, options);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["de-ID"]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_268000
     * @tc.name       : testIntlPluralRulesSupportedLocalesOf0010
     * @tc.desc       : Test the function of the interface Intl.PluralRules.supportedLocalesOf().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSupportedLocalesOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSupportedLocalesOf0010";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let options: Intl.PluralRulesOptions = {
          localeMatcher: 'best fit'
        };
        let result = Intl.PluralRules.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_269000
     * @tc.name       : testIntlPluralRulesSelect0001
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0001";
      try {
        const pr = new Intl.PluralRules("ar-EG");
        let res = pr.select(0);
        expect(res).assertEqual("zero");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2700
     * @tc.name       : testIntlPluralRulesSelect0002
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0002";
      try {
        const pr = new Intl.PluralRules("ar-EG");
        let res = pr.select(1);
        expect(res).assertEqual("one");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_271000
     * @tc.name       : testIntlPluralRulesSelect0003
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0003";
      try {
        const pr = new Intl.PluralRules("ar-EG");
        let res = pr.select(2);
        expect(res).assertEqual("two");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_272000
     * @tc.name       : testIntlPluralRulesSelect0004
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0004";
      try {
        const pr = new Intl.PluralRules("ar-EG");
        let res = pr.select(3);
        expect(res).assertEqual("few");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_273000
     * @tc.name       : testIntlPluralRulesSelect0005
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0005";
      try {
        const pr = new Intl.PluralRules("ar-EG");
        let res = pr.select(11);
        expect(res).assertEqual("many");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_274000
     * @tc.name       : testIntlPluralRulesSelect0006
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0006";
      try {
        const pr = new Intl.PluralRules("en");
        let res = pr.select(0);
        expect(res).assertEqual("other");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_275000
     * @tc.name       : testIntlPluralRulesSelect0007
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0007";
      try {
        let options: Intl.PluralRulesOptions = {
          type: "ordinal"
        };
        const pr = new Intl.PluralRules("ar-EG", options);
        let res = pr.select(0);
        expect(res).assertEqual("other");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_276000
     * @tc.name       : testIntlPluralRulesSelect0008
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0008";
      try {
        let options: Intl.PluralRulesOptions = {
          type: "cardinal"
        };
        const pr = new Intl.PluralRules("ar-EG", options);
        let res = pr.select(0);
        expect(res).assertEqual("zero");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_277000
     * @tc.name       : testIntlPluralRulesSelect0009
     * @tc.desc       : Test the function of the interface Intl.PluralRules.Select().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlPluralRulesSelect0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlPluralRulesSelect0009";
      try {
        let options: Intl.PluralRulesOptions = {
          type: "cardinal",
          minimumFractionDigits: 10
        };
        const pr = new Intl.PluralRules("ar-EG", options);
        let res = pr.select(0);
        expect(res).assertEqual("zero");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_27800
     * @tc.name       : testPluralRules-resolvedOptions_0001
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0001';
      try {
        let getOptions = new Intl.PluralRules().resolvedOptions();
        expect(getOptions.locale).assertEqual("en-US");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.pluralCategories.toString()).assertEqual(["one", "other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_27900
     * @tc.name       : testPluralRules-resolvedOptions_0002
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0002';
      try {
        let getOptions = new Intl.PluralRules("de").resolvedOptions();
        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.pluralCategories.toString()).assertEqual(["one", "other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28000
     * @tc.name       : testPluralRules-resolvedOptions_0003
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0003';
      try {
        let getOptions = new Intl.PluralRules("ar-EG").resolvedOptions();
        expect(getOptions.locale).assertEqual("ar");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.pluralCategories.toString()).assertEqual(["few", "many", "one", "two", "zero", "other"]
          .toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28100
     * @tc.name       : testPluralRules-resolvedOptions_0004
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0004';
      try {
        let options: Intl.PluralRulesOptions = {
          type: "ordinal"
        };
        let getOptions = new Intl.PluralRules("de", options).resolvedOptions();
        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("ordinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.pluralCategories.toString()).assertEqual(["other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28200
     * @tc.name       : testPluralRules-resolvedOptions_0005
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0005';
      try {
        let options: Intl.PluralRulesOptions = {
          maximumSignificantDigits: 21
        };
        let getOptions = new Intl.PluralRules("de", options).resolvedOptions();

        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(undefined);
        expect(getOptions.maximumFractionDigits).assertEqual(undefined);
        expect(getOptions.pluralCategories.toString()).assertEqual(["one", "other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28300
     * @tc.name       : testPluralRules-resolvedOptions_0006
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0006';
      try {
        let options: Intl.PluralRulesOptions = {
          minimumIntegerDigits: 10
        };
        let getOptions = new Intl.PluralRules("de", options).resolvedOptions();

        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(10);
        expect(getOptions.minimumFractionDigits).assertEqual(0);
        expect(getOptions.maximumFractionDigits).assertEqual(3);
        expect(getOptions.pluralCategories.toString()).assertEqual(["one", "other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28400
     * @tc.name       : testPluralRules-resolvedOptions_0007
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0007';
      try {
        let options: Intl.PluralRulesOptions = {
          minimumFractionDigits: 10
        };
        let getOptions = new Intl.PluralRules("de", options).resolvedOptions();

        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("cardinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(10);
        expect(getOptions.maximumFractionDigits).assertEqual(10);
        expect(getOptions.pluralCategories.toString()).assertEqual(["one", "other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28500
     * @tc.name       : testPluralRules-resolvedOptions_0008
     * @tc.desc       : Test the function of the Interface PluralRulesConstructor().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPluralRulesResolvedOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testPluralRulesResolvedOptions0008';
      try {

        let options: Intl.PluralRulesOptions = {
          type: "ordinal", minimumFractionDigits: 10
        };
        let getOptions = new Intl.PluralRules("de", options).resolvedOptions();

        expect(getOptions.locale).assertEqual("de");
        expect(getOptions.type).assertEqual("ordinal");
        expect(getOptions.minimumIntegerDigits).assertEqual(1);
        expect(getOptions.minimumFractionDigits).assertEqual(10);
        expect(getOptions.maximumFractionDigits).assertEqual(10);
        expect(getOptions.pluralCategories.toString()).assertEqual(["other"].toString());
        expect(Array.isArray(getOptions.pluralCategories)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28600
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0001
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0001";
      try {
        let locales = 'de-ID';
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result[0]).assertEqual("de-ID");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28700
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0002
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0002";
      try {
        let locales = "";
        Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28800
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0003
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0003";
      try {
        let locales = "test";
        Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_28900
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0004
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0004";
      try {
        let locales = [];
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_2900
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0005
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0005";
      try {
        let locales = ['id-u-co-pinyin'];
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result[0]).assertEqual('id-u-co-pinyin');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29100
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0006
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0006";
      try {
        let locales = ['id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(['id-u-co-pinyin', 'de-ID', 'en-US']));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29200
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0007
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0007";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29300
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0008
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0008";
      try {
        let locales = ['ban', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(['id-u-co-pinyin', 'de-ID', 'en-US']));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29400
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0009
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0009";
      try {
        let locales = 'de-ID';
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: 'lookup'
        };
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales, options);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result[0]).assertEqual("de-ID");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29500
     * @tc.name       : testIntlRelativeTimeFormatResolvedOptions0010
     * @tc.desc       : Test the function of the interface RelativeTimeFormatResolvedOptions.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatResolvedOptions0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatResolvedOptions0010";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: 'best fit'
        };
        let result = Intl.RelativeTimeFormat.supportedLocalesOf(locales, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29600
     * @tc.name       : testCollatorSupportedLocalesOf0001
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0001";
      try {
        let locales = 'de-ID';
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual("de-ID");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29700
     * @tc.name       : testCollatorSupportedLocalesOf0002
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0002";
      try {
        let locales = '';
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29800
     * @tc.name       : testCollatorSupportedLocalesOf0003
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0003";
      try {
        let locales = 'test';
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_29900
     * @tc.name       : testCollatorSupportedLocalesOf0004
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0004";
      try {
        let locales = [];
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30000
     * @tc.name       : testCollatorSupportedLocalesOf0005
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0005";
      try {
        let locales = ['id-u-co-pinyin'];
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual('id-u-co-pinyin');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30100
     * @tc.name       : testCollatorSupportedLocalesOf0006
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0006";
      try {
        let locales = ['id-u-co-pinyin', 'de-ID', 'en-US'];
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual('id-u-co-pinyin,de-ID,en-US');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30200
     * @tc.name       : testCollatorSupportedLocalesOf0007
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0007";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30300
     * @tc.name       : testCollatorSupportedLocalesOf0008
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0008";
      try {
        let locales = ['ban', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        const result = Intl.Collator.supportedLocalesOf(locales);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual('id-u-co-pinyin,de-ID,en-US');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30400
     * @tc.name       : testCollatorSupportedLocalesOf0009
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0009";
      try {
        let locales = 'de-ID';
        let options: Intl.CollatorOptions = {
          localeMatcher: 'lookup'
        };
        const result = Intl.Collator.supportedLocalesOf(locales, options);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual('de-ID');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30500
     * @tc.name       : testCollatorSupportedLocalesOf0010
     * @tc.desc       : Test the function of the constructor Collator-supportedLocalesOf.
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollatorSupportedLocalesOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCollatorSupportedLocalesOf0010";
      try {
        let locales = ['test', 'id-u-co-pinyin', 'de-ID', 'en-US'];
        let options: Intl.CollatorOptions = {
          localeMatcher: 'best fit'
        };
        let result = Intl.Collator.supportedLocalesOf(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale')
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30600
     * @tc.name       : testIntlRelativeTimeFormatConstructor0001
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0001";
      try {
        const locales = "";
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30700
     * @tc.name       : testIntlRelativeTimeFormatConstructor0002
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it(' testIntlRelativeTimeFormatConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = " testIntlRelativeTimeFormatConstructor0002";
      try {
        const locales = "test";
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30800
     * @tc.name       : testIntlRelativeTimeFormatConstructor0003
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0003";
      try {
        const locales = "de";
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_30900
     * @tc.name       : testIntlRelativeTimeFormatConstructor0004
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0004";
      try {
        const locales = [];
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3100
     * @tc.name       : testIntlRelativeTimeFormatConstructor0006
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0006";
      try {
        const locales = ["test", "en-US", "zh"];
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31100
     * @tc.name       : testIntlRelativeTimeFormatConstructor0007
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0007";
      try {
        const locales = "de";
        const options: Intl.NumberFormatOptions = {
          localeMatcher: "lookup"
        }
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31200
     * @tc.name       : testIntlRelativeTimeFormatConstructor0008
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0008";
      try {
        const locales = "de";
        const options: Intl.NumberFormatOptions = {
          localeMatcher: "best fit"
        }
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31300
     * @tc.name       : testIntlRelativeTimeFormatConstructor0011
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0011";
      try {
        const locales = "de";
        const options: Intl.NumberFormatOptions = {
          style: "long"
        }
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31400
     * @tc.name       : testIntlRelativeTimeFormatConstructor0012
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0012";
      try {
        const locales = "de";
        const options: Intl.NumberFormatOptions = {
          style: "short"
        }
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31500
     * @tc.name       : testIntlRelativeTimeFormatConstructor0013
     * @tc.desc       : Test the function of the interface RelativeTimeFormatConstructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatConstructor0013";
      try {
        const locales = "de";
        const options: Intl.NumberFormatOptions = {
          style: "narrow"
        }
        const relativeTimeFormat = new Intl.RelativeTimeFormat(locales);
        expect(relativeTimeFormat.constructor.name).assertEqual("RelativeTimeFormat");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31600
     * @tc.name       : testIntlRelativeTimeFormat0001
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0001';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options)
        let format = rtf.format(1, "year")
        expect(format).assertEqual("next year");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31700
     * @tc.name       : testIntlRelativeTimeFormat0002
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0002';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "short"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(-1, "years");
        expect(format).assertEqual("1 yr. ago");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31800
     * @tc.name       : testIntlRelativeTimeFormat0003
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0003';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "narrow"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(4, "quarter");
        expect(format).assertEqual("in 4 qtrs.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_31900
     * @tc.name       : testIntlRelativeTimeFormat0004
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0004';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "auto", style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(-5, "quarters");
        expect(format).assertEqual("5 quarters ago");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32000
     * @tc.name       : testIntlRelativeTimeFormat0005
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0005';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "short"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(0, "month");
        expect(format).assertEqual("in 0 mo.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32100
     * @tc.name       : testIntlRelativeTimeFormat0006
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testIntlRelativeTimeFormat0006';
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "narrow"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(10, "months");
        expect(format).assertEqual("in 10 mo.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32200
     * @tc.name       : testIntlRelativeTimeFormat0007
     * @tc.desc       : Test the function of the Interface Intl.RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0007";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(0, "week");
        expect(format).assertEqual("this wk.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32300
     * @tc.name       : testIntlRelativeTimeFormat0008
     * @tc.desc       : Test the function of the Interface Intl.RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0008";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(2, "weeks");
        expect(format).assertEqual("in 2 weeks");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32400
     * @tc.name       : testIntlRelativeTimeFormat0009
     * @tc.desc       : Test the function of the Interface Intl.RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0009";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(40, "day");
        expect(format).assertEqual("in 40 days");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32500
     * @tc.name       : testIntlRelativeTimeFormat0010
     * @tc.desc       : Test the function of the Interface RelativeTimeFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0010";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "auto", style: "narrow"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(-40, "days");
        expect(format).assertEqual('40 days ago');
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32600
     * @tc.name       : testIntlRelativeTimeFormat0011
     * @tc.desc       : Test the function of the Interface RelativeTimeFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0011";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(1, "hour");
        expect(format).assertEqual('in 1 hour');
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32700
     * @tc.name       : testIntlRelativeTimeFormat0012
     * @tc.desc       : Test the function of the Interface RelativeTimeFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testIntlRelativeTimeFormat0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0012";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(4, "hours");
        expect(format).assertEqual('in 4 hr.');
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32800
     * @tc.name       : testIntlRelativeTimeFormat-Format_0013
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0013";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup",
          numeric: "always",
          style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(-5, "minute");
        console.log(`Formatted output: ${format}`);
        expect(format).assertEqual("5 minutes ago");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_32900
     * @tc.name       : testIntlRelativeTimeFormat-Format_0014
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0014";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup",
          numeric: "always",
          style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(10, "minute");
        console.log(`Formatted output: ${format}`);
        expect(format).assertEqual("in 10 minutes");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_3300
     * @tc.name       : testIntlRelativeTimeFormat-Format_0015
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0015";
      try {
        let locales = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup",
          numeric: "always",
          style: "long"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(6, "second");
        console.log(`Formatted output: ${format}`);
        expect(format).assertEqual("in 6 seconds");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33100
     * @tc.name       : testIntlRelativeTimeFormat-Format_00136
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0016";
      try {
        let locales = "zh";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup",
          numeric: "always",
          style: "narrow"
        };
        let rtf = new Intl.RelativeTimeFormat(locales, options);
        let format = rtf.format(15, "seconds");
        expect(format).assertEqual("15秒后");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33200
     * @tc.name       : testIntlRelativeTimeFormat-Format_0017
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0017";
      try {
        let rtf = new Intl.RelativeTimeFormat();
        let format = rtf.format(1, "day");
        expect(format).assertEqual("in 1 day");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33300
     * @tc.name       : testIntlRelativeTimeFormat-Format_0018
     * @tc.desc       : Test the function of the interface RelativeTimeFormat().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormat0018";
      try {
        let rtf = new Intl.RelativeTimeFormat("de");
        let format = rtf.format(-1, "day");
        expect(format).assertEqual("vor 1 Tag");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33400
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0001
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0001";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "long"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(1, "year");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`).assertEqual('[{"type":"literal","value":"next year"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33500
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0002
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0002";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(-1, "year");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"1","unit":"year"},{"type":"literal","value":" yr. ago"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33600
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0003
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0003";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "narrow"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(4, "quarter");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"4","unit":"quarter"},{"type":"literal","value":" qtrs."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33700
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0004
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0004";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "auto", style: "long"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(-5, "quarter");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"5","unit":"quarter"},{"type":"literal","value":" quarters ago"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33800
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0005
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0005";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(0, "month");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"0","unit":"month"},{"type":"literal","value":" mo."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_33900
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0006
     * @tc.desc       : Test the function of the interface formatToParts().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0006";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "narrow"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(10, "months");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"10","unit":"month"},{"type":"literal","value":" mo."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34000
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0007
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0007";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(0, "week");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`).assertEqual('[{"type":"literal","value":"this wk."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34100
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0008
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0008";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "long"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(2, "week");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"2","unit":"week"},{"type":"literal","value":" weeks"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34200
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0009
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0009";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(40, "day");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"40","unit":"day"},{"type":"literal","value":" days"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34300
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0010
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0010";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "auto", style: "narrow"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(-40, "days");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"40","unit":"day"},{"type":"literal","value":" days ago"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34400
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0011
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0011";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "long"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(1, "hour");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"1","unit":"hour"},{"type":"literal","value":" hour"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34500
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0012
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0012";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(4, "hours");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"4","unit":"hour"},{"type":"literal","value":" hr."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34600
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0013
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0013";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "narrow"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(-5, "minute");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"5","unit":"minute"},{"type":"literal","value":" min. ago"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34700
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0014
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0014";
      try {
        let locales: string = "en";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "best fit", numeric: "always", style: "short"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(10, "minutes");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"10","unit":"minute"},{"type":"literal","value":" min."}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34800
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0015
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0015";
      try {
        let locales: string = "zh";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "auto", style: "long"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(6, "second");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        })
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"6","unit":"second"},{"type":"literal","value":"秒钟后"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_34900
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0016
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0016";
      try {
        let locales: string = "zh";
        let options: Intl.RelativeTimeFormatOptions = {
          localeMatcher: "lookup", numeric: "always", style: "narrow"
        };
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locales, options);
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(15, "seconds");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"integer","value":"15","unit":"second"},{"type":"literal","value":"秒后"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_35000
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0017
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0017";
      try {
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat();
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(1, "day");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"in "},{"type":"integer","value":"1","unit":"day"},{"type":"literal","value":" day"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INTL_35100
     * @tc.name       : testIntlRelativeTimeFormatFormatToParts0018
     * @tc.desc       : Test the function of the RelativeTimeFormat-FormatToParts.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIntlRelativeTimeFormatFormatToParts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIntlRelativeTimeFormatFormatToParts0018";
      try {
        let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("de");
        let format: Intl.RelativeTimeFormatPart[] = rtf.formatToParts(-1, "day");
        format.forEach((item) => {
          console.log(`${JSON.stringify(item)}`);
        });
        expect(`${JSON.stringify(format)}`)
          .assertEqual('[{"type":"literal","value":"vor "},{"type":"integer","value":"1","unit":"day"},{"type":"literal","value":" Tag"}]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}