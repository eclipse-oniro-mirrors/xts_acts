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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function abilityTest() {
  describe('BigIntTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    ;
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    ;
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    ;
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0100
     * @tc.name       : testBigIntAsIntN0001
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntAsIntN0001', 0, () => {
      const TAG = "testBigIntAsIntN0001";
      try {
        const I64_CEIL = 2n**63n;
        let value = BigInt.asIntN(64, I64_CEIL - 1n);
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('9223372036854775807');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0200
     * @tc.name       : testBigIntAsIntN0002
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntAsIntN0002', 0, () => {
      const TAG = "testBigIntAsIntN0002";
      try {
        const I64_CEIL = 2n**63n;
        let value = (BigInt.asIntN(64, I64_CEIL));
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('-9223372036854775808');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0300
     * @tc.name       : testBigIntAsIntN0003
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntAsIntN0003', 0, () => {
      const TAG = "testBigIntAsIntN0003";
      try {
        const I64_CEIL = 2n**63n;
        let value = (BigInt.asIntN(64, I64_CEIL + 1n));
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('-9223372036854775807');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0400
     * @tc.name       : testBigIntAsIntN0004
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntAsIntN0004', 0, () => {
      const TAG = "testBigIntAsIntN0004";
      try {
        const I64_CEIL = 2n**63n;
        let value = (BigInt.asIntN(64, I64_CEIL * 2n));
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0500
     * @tc.name       : testBigIntAsIntN0005
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntAsIntN0005", 0, () => {
      const TAG = "testBigIntAsIntN0005";
      try {
        const I64_CEIL = 2n**63n;
        let value = (BigInt.asIntN(64, -I64_CEIL * -42n));
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0600
     * @tc.name       : testBigIntUintN0001
     * @tc.desc       : Test the function of the Interface BigInt.asUintN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntUintN0001", 0, () => {
      const TAG = "testBigIntUintN0001";
      try {
        const U64_CEIL = 2n**64n;
        let value = BigInt.asUintN(64, U64_CEIL - 1n);
        console.log('result ' + value.toString());
        expect(value > 0n).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0700
     * @tc.name       : testBigIntUintN0002
     * @tc.desc       : Test the function of the Interface BigInt.asUintN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntUintN0002", 0, () => {
      const TAG = "testBigIntUintN0002";
      try {
        const U64_CEIL = 2n**64n;
        let value = BigInt.asUintN(64, U64_CEIL);
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0800
     * @tc.name       : testBigIntUintN0003
     * @tc.desc       : Test the function of the Interface BigInt.asIntN().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntUintN0003", 0, () => {
      const TAG = "testBigIntUintN0003";
      try {
        const U64_CEIL = 2n**64n;
        let value = BigInt.asUintN(64, U64_CEIL + 1n);
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_0900
     * @tc.name       : testBigIntUnitN0003
     * @tc.desc       : Test the function of the asUnitN.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntUnitN0004', 0, () => {
      const TAG = "testBigIntUnitN0004";
      try {
        const U64_CEIL = 2n**64n;
        let value = BigInt.asUintN(64, U64_CEIL * 2n);
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1000
     * @tc.name       : testBigIntUnitN0005
     * @tc.desc       : Test the function of the asUnitN.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntUnitN0005', 0, () => {
      const TAG = "testBigIntUnitN0005";
      try {
        const U64_CEIL = 2n**64n;
        let value = BigInt.asUintN(64, U64_CEIL * -42n);
        console.log('result ' + value.toString());
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1100
     * @tc.name       : testBigIntToLocaleString0001
     * @tc.desc       : Test the function of the prototype.toLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntToLocaleString0001', 0, () => {
      const TAG = "testBigIntToLocaleString0001";
      try {
        const bigint = 3500n;
        let value = Number(bigint).toLocaleString();
        console.log('result ' + value.toString());
        expect(value).assertEqual('3,500');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1200
     * @tc.name       : testBigIntToLocaleString0002
     * @tc.desc       : Test the function of the prototype.toLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntToLocaleString0002', 0, () => {
      const TAG = "testBigIntToLocaleString0002";
      try {
        const bigint = '';
        let value = bigint.toLocaleString();
        console.log('result ' + value.toString());
        expect(value).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1300
     * @tc.name       : testBigIntToLocaleString0003
     * @tc.desc       : Test the function of the prototype.toLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntToLocaleString0003', 0, () => {
      const TAG = "testBigIntToLocaleString0003";
      try {
        const bigint = -1n;
        let value = Number(bigint).toLocaleString();
        console.log('result ' + value.toString());
        expect(value).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1400
     * @tc.name       : testBigIntToLocaleString0004
     * @tc.desc       : Test the function of the prototype.toLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntToLocaleString0004', 0, () => {
      const TAG = "testBigIntToLocaleString0004";
      try {
        const bigint = 'Test';
        let value = String(bigint).toLocaleString();
        console.log('result ' + value.toString());
        expect(value).assertEqual('Test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1500
     * @tc.name       : testBigIntToLocaleString0005
     * @tc.desc       : Test the function of the Interface BigInt.toLocaleString()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntToLocaleString0005", 0, () => {
      const TAG = "testBigIntToLocaleString0005";
      try {
        const bigint = 123456789123456789n;
        console.log('result ' + bigint.toLocaleString("de-DE"));
        expect(bigint.toLocaleString("de-DE")).assertEqual('123.456.789.123.456.789');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1600
     * @tc.name       : testBigIntToLocaleString0006
     * @tc.desc       : Test the function of the Interface BigInt.toLocaleString()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntToLocaleString0006", 0, () => {
      const TAG = "testBigIntToLocaleString0006";
      try {
        const bigint = 123456789123456789n;
        console.log('result ' + bigint.toLocaleString("ar-EG"));
        expect(bigint.toLocaleString("ar-EG")).assertEqual('١٢٣٬٤٥٦٬٧٨٩٬١٢٣٬٤٥٦٬٧٨٩');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1700
     * @tc.name       : testBigIntToLocaleString0007
     * @tc.desc       : Test the function of the Interface BigInt.toLocaleString()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntToLocaleString0007", 0, () => {
      const TAG = "testBigIntToLocaleString0007";
      try {
        const bigint = 123456789123456789n;
        console.log('result ' + bigint.toLocaleString("en-IN"));
        expect(bigint.toLocaleString('en-IN')).assertEqual('1,23,45,67,89,12,34,56,789');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1800
     * @tc.name       : testBigIntToLocaleString0008
     * @tc.desc       : Test the function of the Interface BigInt.toLocaleString()
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBigIntToLocaleString0008", 0, () => {
      const TAG = "testBigIntToLocaleString0008";
      try {
        const bigint = 123456789123456789n;
        console.log('result ' + bigint.toLocaleString('zh-Hans-CN-u-nu-hanidec'));
        expect(bigint.toLocaleString('zh-Hans-CN-u-nu-hanidec'))
          .assertEqual('一二三,四五六,七八九,一二三,四五六,七八九');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_1900
     * @tc.name       : testBigIntToLocaleString0001
     * @tc.desc       : Test the function of the prototype.toLocaleString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntToLocaleString0009', 0, () => {
      const TAG = "testBigIntToLocaleString0009";
      try {
        const bigint = 123456789123456789n;
        let value = bigint.toLocaleString(["ban", "id"]);
        console.log('result ' + value);
        expect(value).assertEqual('123.456.789.123.456.789');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2000
     * @tc.name       : testBigIntPrototypeToString17n0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 17n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString17n0001', 0, () => {
      const TAG = "testBigIntPrototypeToString17n0001";
      try {
        let s = 17n;
        let value = s.toString();
        console.log('result ' + value);
        expect(value).assertEqual('17');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2100
     * @tc.name       : testBigIntPrototypeToString17n0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 17n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString17n0002', 0, () => {
      const TAG = "testBigIntPrototypeToString17n0002";
      try {
        let s = 17n;
        let value = s.toString(undefined);
        console.log('result ' + value);
        expect(value).assertEqual('17');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2200
     * @tc.name       : testBigIntPrototypeToString17n0003
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 17n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString17n0003', 0, () => {
      const TAG = "testBigIntPrototypeToString17n0003";
      try {
        let s = 17n;
        s.toString(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2300
     * @tc.name       : testBigIntPrototypeToString17n0004
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 17n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString17n0004', 0, () => {
      const TAG = "testBigIntPrototypeToString17n0004";
      try {
        let s = 17n;
        s.toString(37);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2400
     * @tc.name       : testBigIntPrototypeToString17n0005
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 17n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString17n0005', 0, () => {
      const TAG = "testBigIntPrototypeToString17n0005";
      try {
        let s = 17n;
        s.toString(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2500
     * @tc.name       : testBigIntPrototypeToString66n0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString66n0001', 0, () => {
      const TAG = "testBigIntPrototypeToString66n0001";
      try {
        let s = 66n;
        let value = s.toString();
        console.log('result ' + value);
        expect(value).assertEqual('66');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2600
     * @tc.name       : testBigIntPrototypeToString66n0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString66n0002', 0, () => {
      const TAG = "testBigIntPrototypeToString66n0002";
      try {
        let s = 66n;
        let value = s.toString(undefined);
        console.log('result ' + value);
        expect(value).assertEqual('66');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2700
     * @tc.name       : testBigIntPrototypeToString66n0003
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString66n0003', 0, () => {
      const TAG = "testBigIntPrototypeToString66n0003";
      try {
        let s = 66n;
        s.toString(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2800
     * @tc.name       : testBigIntPrototypeToString66n0004
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString66n0004', 0, () => {
      const TAG = "testBigIntPrototypeToString66n0004";
      try {
        let s = 66n;
        s.toString(37);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_2900
     * @tc.name       : testBigIntPrototypeToString66n0005
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString66n0005', 0, () => {
      const TAG = "testBigIntPrototypeToString66n0005";
      try {
        let s = 66n;
        s.toString(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3000
     * @tc.name       : testBigIntPrototypeToString254n0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString254n0001', 0, () => {
      const TAG = "testBigIntPrototypeToString254n0001";
      try {
        let s = 254n;
        let value = s.toString();
        expect(value).assertEqual('254');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3100
     * @tc.name       : testBigIntPrototypeToString254n0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString254n0002', 0, () => {
      const TAG = "testBigIntPrototypeToString254n0002";
      try {
        let s = 254n;
        let value = s.toString(undefined);
        expect(value).assertEqual('254');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3200
     * @tc.name       : testBigIntPrototypeToString254n0003
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString254n0003', 0, () => {
      const TAG = "testBigIntPrototypeToString254n0003";
      try {
        let s = 254n;
        let value = s.toString(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3300
     * @tc.name       : testBigIntPrototypeToString254n0004
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString254n0004', 0, () => {
      const TAG = "testBigIntPrototypeToString254n0004";
      try {
        let s = 254n;
        s.toString(37);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3400
     * @tc.name       : testBigIntPrototypeToString254n0005
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString254n0005', 0, () => {
      const TAG = "testBigIntPrototypeToString254n0005";
      try {
        let s = 254n;
        s.toString(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3500
     * @tc.name       : testBigInt.prototype.toString0016
     * @tc.desc       : Test the function of the interface .prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigInt.prototype.toString0016', 0, () => {
      const TAG = 'testBigInt.prototype.toString0016';
      try {
        let s = -10n;
        let value = s.toString();
        console.log('result ' + value);
        expect(value).assertEqual('-10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3600
     * @tc.name       : testBigInt.prototype.toString0017
     * @tc.desc       : Test the function of the interface .prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigInt.prototype.toString0017', 0, () => {
      const TAG = 'testBigInt.prototype.toString0017';
      try {
        let s = -10n;
        let value = s.toString(undefined);
        console.log('result ' + value);
        expect(value).assertEqual('-10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3700
     * @tc.name       : testBigInt.prototype.toString0018
     * @tc.desc       : Test the function of the interface .prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigInt.prototype.toString0018', 0, () => {
      const TAG = 'testBigInt.prototype.toString0018';
      try {
        let s = -10n;
        let value = s.toString(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('toString() radix argument must be between 2 and 36');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3800
     * @tc.name       : testBigInt.prototype.toString0019
     * @tc.desc       : Test the function of the interface .prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigInt.prototype.toString0019', 0, () => {
      const TAG = 'testBigInt.prototype.toString0019';
      try {
        let s = -10n;
        let value = s.toString(37);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('toString() radix argument must be between 2 and 36');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_3900
     * @tc.name       : testBigInt.prototype.toString0020
     * @tc.desc       : Test the function of the interface .prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigInt.prototype.toString0020', 0, () => {
      const TAG = 'testBigInt.prototype.toString0020';
      try {
        let s = -10n;
        let value = s.toString(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('toString() radix argument must be between 2 and 36');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4000
     * @tc.name       : testBigIntPrototypeToString0xffn0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with -0xffn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString0xffn0001', 0, () => {
      const TAG = "testBigIntPrototypeToString0xffn0001";
      try {
        let s = -0xffn;
        let value = s.toString();
        console.log('result ' + value);
        expect(value).assertEqual('-255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4100
     * @tc.name       : testBigIntPrototypeToString0xffn0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with -0xffn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString0xffn0002', 0, () => {
      const TAG = "testBigIntPrototypeToString0xffn0002";
      try {
        let s = -0xffn;
        let value = s.toString(undefined);
        console.log('result ' + value);
        expect(value).assertEqual('-255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4200
     * @tc.name       : testBigIntPrototypeToString0xffn0003
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with -0xffn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString0xffn0003', 0, () => {
      const TAG = "testBigIntPrototypeToString0xffn0003";
      try {
        let s = -0xffn;
        s.toString(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4300
     * @tc.name       : testBigIntPrototypeToString0xffn0004
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with -0xffn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString0xffn0004', 0, () => {
      const TAG = "testBigIntPrototypeToString0xffn0004";
      try {
        let s = -0xffn;
        s.toString(37);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4400
     * @tc.name       : testBigIntPrototypeToString0xffn0005
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with -0xffn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToString0xffn0005', 0, () => {
      const TAG = "testBigIntPrototypeToString0xffn0005";
      try {
        let s = -0xffn;
        s.toString(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("toString() radix argument must be between 2 and 36");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4500
     * @tc.name       : testBigIntPrototypeToStringOn0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with On.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToStringOn0001', 0, () => {
      const TAG = "testBigIntPrototypeToStringOn0001";
      try {
        let s = 0n;
        let result = s.toString();
        console.log('result ' + result);
        expect(result).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4600
     * @tc.name       : testBigIntPrototypeToStringOn0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with On.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToStringOn0002', 0, () => {
      const TAG = "testBigIntPrototypeToStringOn0002";
      try {
        let s = 0n;
        let result = s.toString(undefined);
        console.log('result ' + result);
        expect(result).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4700
     * @tc.name       : testBigIntPrototypeToStringBigInt0001
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with 66n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToStringBigInt0001', 0, () => {
      const TAG = "testBigIntPrototypeToStringBigInt0001";
      try {
        let result = BigInt(-0).toString();
        console.log('result ' + result);
        expect(result).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BIGINT_4800
     * @tc.name       : testBigIntPrototypeToStringBigInt0002
     * @tc.desc       : Test the function of the interface BigInt.prototype.toString with On.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBigIntPrototypeToStringBigInt0002', 0, () => {
      const TAG = "testBigIntPrototypeToStringBigInt0002";
      try {
        let result = BigInt(-0).toString(undefined);
        console.log('result ' + result);
        expect(result).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}