/*
 *  Copyright (c) 2026 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License")
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { connection } from '@kit.NetworkKit';

const SIMPLIFIED_CHINESE_DOMAIN = "www.中国你好.com"
const SIMPLIFIED_CHINESE_ASCII_DOMAIN = "www.xn--fiq02ab1ogvc.com"
const TRADITIONAL_CHINESE_DOMAIN = "www.台灣早安.com"
const TRADITIONAL_CHINESE_ASCII_DOMAIN = "www.xn--kprs0pw9ir0k.com"
const PURE_ASCII_DOMAIN = "www.example.com"

export default function ConnectionUnicodeTest() {
  describe('ConnectionUnicodeTest', () => {
    /**
     * @tc.name    testConnectionGetDnsUnicode0100
     * @tc.number  SUB_Connection_GETUNICODE_0100
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0200
     * @tc.number  SUB_Connection_GETUNICODE_0200
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0300
     * @tc.number  SUB_Connection_GETUNICODE_0300
     * @tc.desc    Test pure ASCII domain name, result should remain unchanged.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(PURE_ASCII_DOMAIN);
      expect(result).assertEqual(PURE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0400
     * @tc.number  SUB_Connection_GETUNICODE_0400
     * @tc.desc    Test "" parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0500
     * @tc.number  SUB_Connection_GETUNICODE_0500
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
      hostStr = TRADITIONAL_CHINESE_ASCII_DOMAIN;
      const result = connection.getDnsUnicode(hostStr);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0600
     * @tc.number  SUB_Connection_GETUNICODE_0600
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr = TRADITIONAL_CHINESE_ASCII_DOMAIN;
      hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
      const result = connection.getDnsUnicode(hostStr);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0700
     * @tc.number  SUB_Connection_GETUNICODE_0700
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr: null | string = null;
      hostStr = SIMPLIFIED_CHINESE_ASCII_DOMAIN;
      const result = connection.getDnsUnicode(hostStr);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0800
     * @tc.number  SUB_Connection_GETUNICODE_0800
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode0900
     * @tc.number  SUB_Connection_GETUNICODE_0900
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1000
     * @tc.number  SUB_Connection_GETUNICODE_1000
     * @tc.desc    Test "" parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1100
     * @tc.number  SUB_Connection_GETUNICODE_1100
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1200
     * @tc.number  SUB_Connection_GETUNICODE_1200
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1300
     * @tc.number  SUB_Connection_GETUNICODE_1300
     * @tc.desc    Test "" parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1400
     * @tc.number  SUB_Connection_GETUNICODE_1400
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1500
     * @tc.number  SUB_Connection_GETUNICODE_1500
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1600
     * @tc.number  SUB_Connection_GETUNICODE_1600
     * @tc.desc    Test "" parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1700
     * @tc.number  SUB_Connection_GETUNICODE_1700
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, 0);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1800
     * @tc.number  SUB_Connection_GETUNICODE_1800
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, 0);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode1900
     * @tc.number  SUB_Connection_GETUNICODE_1900
     * @tc.desc    Test "",0 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2000
     * @tc.number  SUB_Connection_GETUNICODE_2000
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, 1);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2100
     * @tc.number  SUB_Connection_GETUNICODE_2100
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, 1);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2200
     * @tc.number  SUB_Connection_GETUNICODE_2200
     * @tc.desc    Test "",1 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", 1);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2300
     * @tc.number  SUB_Connection_GETUNICODE_2300
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, 2);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2400
     * @tc.number  SUB_Connection_GETUNICODE_2400
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, 2);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2500
     * @tc.number  SUB_Connection_GETUNICODE_2500
     * @tc.desc    Test "",2 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("", 2);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2600
     * @tc.number  SUB_Connection_GETUNICODE_2600
     * @tc.desc    Test normal parameters, 3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsUnicode(SIMPLIFIED_CHINESE_ASCII_DOMAIN, 3);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2700
     * @tc.number  SUB_Connection_GETUNICODE_2700
     * @tc.desc    Test normal parameters, 3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, 3);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2800
     * @tc.number  SUB_Connection_GETUNICODE_2800
     * @tc.desc    Test "",3 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsUnicode("", 3);
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode2900
     * @tc.number  SUB_Connection_GETUNICODE_2900
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 500;
      for (let i = 0; i < TEST_COUNT; i++) {
        const startTime = Date.now();
        const result = connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com");
        const endTime = Date.now();
        const conversionTime = endTime - startTime;
        expect(conversionTime).assertLess(100);
        expect(result).assertEqual("www.中国你好.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3000
     * @tc.number  SUB_Connection_GETUNICODE_3000
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com");
        expect(result).assertEqual("www.台灣早安.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3100
     * @tc.number  SUB_Connection_GETUNICODE_3100
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("www.中国你好.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3200
     * @tc.number  SUB_Connection_GETUNICODE_3200
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("www.台灣早安.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3300
     * @tc.number  SUB_Connection_GETUNICODE_3300
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("www.中国你好.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3400
     * @tc.number  SUB_Connection_GETUNICODE_3400
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("www.台灣早安.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3500
     * @tc.number  SUB_Connection_GETUNICODE_3500
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--fiq02ab1ogvc.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("www.中国你好.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3600
     * @tc.number  SUB_Connection_GETUNICODE_3600
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result =
          connection.getDnsUnicode("www.xn--kprs0pw9ir0k.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("www.台灣早安.com");
      }
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3700
     * @tc.number  SUB_Connection_GETUNICODE_3700
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("!@#$,.xn--cba");
      expect(result).assertEqual("!@#$,.¥");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3800
     * @tc.number  SUB_Connection_GETUNICODE_3800
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("xn--o28h", connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual("xn--o28h");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode3900
     * @tc.number  SUB_Connection_GETUNICODE_3900
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode("xn--o28h", connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual("😊");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode4000
     * @tc.number  SUB_Connection_GETUNICODE_4000
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode('www.' + 'b'.repeat(300) + '.com');
      expect(result)
        .assertEqual("www.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode4100
     * @tc.number  SUB_Connection_GETUNICODE_4100
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, null);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

    /**
     * @tc.name    testConnectionGetDnsUnicode4200
     * @tc.number  SUB_Connection_GETUNICODE_4200
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectionGetDnsUnicode4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsUnicode(TRADITIONAL_CHINESE_ASCII_DOMAIN, undefined);
      expect(result).assertEqual(TRADITIONAL_CHINESE_DOMAIN);
    });

  });
}