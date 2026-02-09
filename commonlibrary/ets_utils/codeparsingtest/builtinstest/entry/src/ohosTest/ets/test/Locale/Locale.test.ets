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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';

export default function LocaleTest() {
  describe('LocaleTest', () => {
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
     * @tc.name   testLocaleConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0100
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleConstructor0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const TAG = "testLocaleConstructor0001";
      try {
        const us = new Intl.Locale("en-US");
        let value = us.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocaleConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0200
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleConstructor0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const TAG = "testLocaleConstructor0002";
      try {
        const locale = new Intl.Locale("en-US", {
          hourCycle: "h11"
        })
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocaleConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0300
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleConstructor0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const TAG = "testLocaleConstructor0003";
      try {
        const locale = new Intl.Locale("en-US", {
          hourCycle: "h12"
        })
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocaleConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0400
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleConstructor0004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const TAG = "testLocaleConstructor0004";
      try {
        const locale = new Intl.Locale("en-US", {
          hourCycle: "h23"
        })
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocaleConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0500
     * @tc.desc   Test the function of the interface constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleConstructor0005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
      const TAG = "testLocaleConstructor0005";
      try {
        const locale = new Intl.Locale("en-US", {
          hourCycle: "h24"
        })
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.toString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0600
     * @tc.desc   Test the function of the interface prototype.toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.toString0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.toString0001";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h11", calendar: "gregory"
        })
        let value = myLocale.toString();
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR-u-ca-gregory-hc-h11');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.toString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0700
     * @tc.desc   Test the function of the interface prototype.toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.toString0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLocale.prototype.toString0002";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h12", calendar: "gregory"
        })
        let value = myLocale.toString();
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR-u-ca-gregory-hc-h12');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.toString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0800
     * @tc.desc   Test the function of the interface prototype.toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.toString0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.toString0003";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h23", calendar: "gregory"
        })
        let value = myLocale.toString();
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR-u-ca-gregory-hc-h23');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.toString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_0900
     * @tc.desc   Test the function of the interface prototype.toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.toString0004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.toString0004";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h24", calendar: "gregory"
        })
        let value = myLocale.toString();
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR-u-ca-gregory-hc-h24');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.baseName0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1000
     * @tc.desc   Test the function of the interface prototype.baseName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.baseName0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.baseName0001";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h11", calendar: "gregory"
        })
        let value = myLocale.baseName;
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.baseName0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1100
     * @tc.desc   Test the function of the interface prototype.baseName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.baseName0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.baseName0002";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h12", calendar: "gregory"
        })
        let value = myLocale.baseName;
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.baseName0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1200
     * @tc.desc   Test the function of the interface prototype.baseName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.baseName0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.baseName0003";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h23", calendar: "gregory"
        })
        let value = myLocale.baseName;
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.baseName0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1300
     * @tc.desc   Test the function of the interface prototype.baseName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.baseName0004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.baseName0004";
      try {
        const myLocale = new Intl.Locale("fr-Latn-FR", {
          hourCycle: "h24", calendar: "gregory"
        })
        let value = myLocale.baseName;
        console.log("result:" + value);
        expect(value).assertEqual('fr-Latn-FR');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.calendar0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1400
     * @tc.desc   Test the function of the interface prototype.calendar.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.calendar0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.calendar0001";
      try {
        const locale = new Intl.Locale("fr-FR-u-ca-buddhist");
        let value = locale.calendar;
        console.log("result:" + value);
        expect(value).assertEqual('buddhist');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.calendar0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1500
     * @tc.desc   Test the function of the interface prototype.calendar.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.calendar0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.calendar0002";
      try {
        const locale = new Intl.Locale("fr-FR", {
          calendar: "buddhist"
        })
        let value = locale.calendar;
        console.log("result:" + value);
        expect(value).assertEqual('buddhist');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.caseFirst0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1600
     * @tc.desc   Test the function of the interface prototype.caseFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.caseFirst0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.caseFirst0001";
      try {
        const locale = new Intl.Locale("fr-Latn-FR-u-kf-upper");
        let value = locale.caseFirst;
        console.log("result:" + value);
        expect(value).assertEqual('upper');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocale.prototype.caseFirst0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1700
     * @tc.desc   Test the function of the interface prototype.caseFirst.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocale.prototype.caseFirst0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocale.prototype.caseFirst0002";
      try {
        const locale = new Intl.Locale("en-Latn-US", {
          caseFirst: "lower"
        })
        let value = locale.caseFirst;
        console.log("result:" + value);
        expect(value).assertEqual('lower');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeCollation0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1800
     * @tc.desc   Test the function of the interface prototype.collation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeCollation0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeCollation0001";
      try {
        const locale = new Intl.Locale("zh-Hant-u-co-zhuyin");
        let value = locale.collation;
        console.log("result:" + value);
        expect(value).assertEqual('zhuyin');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeCollation0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_1900
     * @tc.desc   Test the function of the interface prototype.collation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeCollation0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeCollation0002";
      try {
        const locale = new Intl.Locale("zh-Hant", {
          collation: "zhuyin"
        })
        let value = locale.collation;
        console.log("result:" + value);
        expect(value).assertEqual('zhuyin');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeHourCycle0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2000
     * @tc.desc   Test the function of the interface prototype.hourCycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeHourCycle0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeHourCycle0001";
      try {
        const locale = new Intl.Locale("fr-FR-u-hc-h23");
        let value = locale.hourCycle;
        console.log("result:" + value);
        expect(value).assertEqual('h23');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeHourCycle0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2100
     * @tc.desc   Test the function of the interface prototype.hourCycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeHourCycle0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeHourCycle0002";
      try {
        const locale = new Intl.Locale("en-US", {
          hourCycle: "h12"
        })
        let value = locale.hourCycle;
        console.log("result:" + value);
        expect(value).assertEqual('h12');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeLanguage0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2200
     * @tc.desc   Test the function of the interface prototype.language.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeLanguage0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeLanguage0001";
      try {
        const locale = new Intl.Locale("en-Latn-US");
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('en');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeLanguage0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2300
     * @tc.desc   Test the function of the interface prototype.language.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeLanguage0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeLanguage0002";
      try {
        const locale = new Intl.Locale("en-Latn-US", {
          language: "es"
        })
        let value = locale.language;
        console.log("result:" + value);
        expect(value).assertEqual('es');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeNumberingSystem0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2400
     * @tc.desc   Test the function of the interface prototype.numberingSystem.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeNumberingSystem0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeNumberingSystem0001";
      try {
        const locale = new Intl.Locale("fr-Latn-FR-u-nu-mong");
        let value = locale.numberingSystem;
        console.log("result:" + value);
        expect(value).assertEqual('mong');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeNumberingSystem0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2500
     * @tc.desc   Test the function of the interface prototype.numberingSystem.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeNumberingSystem0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeNumberingSystem0002";
      try {
        const locale = new Intl.Locale("en-Latn-US", {
          numberingSystem: "latn"
        })
        let value = locale.numberingSystem;
        console.log("result:" + value);
        expect(value).assertEqual('latn');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeNumeric0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2600
     * @tc.desc   Test the function of the interface prototype.numeric.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeNumeric0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeNumeric0001";
      try {
        const locale = new Intl.Locale("fr-Latn-FR-u-kn-false");
        let value = locale.numeric;
        console.log("result:" + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeNumeric0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2700
     * @tc.desc   Test the function of the interface prototype.numeric.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeNumeric0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeNumeric0002";
      try {
        const locale = new Intl.Locale("en-Latn-US", {
          numeric: true
        })
        let value = locale.numeric;
        console.log("result:" + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeRegion0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2800
     * @tc.desc   Test the function of the interface prototype.region.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeRegion0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeRegion0001";
      try {
        const locale = new Intl.Locale("en-Latn-US");
        let value = locale.region;
        console.log("result:" + value);
        expect(value).assertEqual('US');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeRegion0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_2900
     * @tc.desc   Test the function of the interface prototype.region.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeRegion0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeRegion0002";
      try {
        const locale = new Intl.Locale("fr-Latn", {
          region: "FR"
        })
        let value = locale.region;
        console.log("result:" + value);
        expect(value).assertEqual('FR');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeScript0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_3000
     * @tc.desc   Test the function of the interface prototype.script.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeScript0001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeScript0001";
      try {
        const locale = new Intl.Locale("en-Latn-US");
        let value = locale.script;
        console.log("result:" + value);
        expect(value).assertEqual('Latn');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLocalePrototypeScript0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LOCALE_3100
     * @tc.desc   Test the function of the interface prototype.script.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocalePrototypeScript0002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
      const TAG = "testLocalePrototypeScript0002";
      try {
        const locale = new Intl.Locale("fr-FR", {
          script: "Latn"
        })
        let value = locale.script;
        console.log("result:" + value);
        expect(value).assertEqual('Latn');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}