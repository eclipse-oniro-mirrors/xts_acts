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

export default function ConnectionAsciiTest() {
  describe('ConnectionAsciiTest', () => {
    /**
     * @tc.name    testConnectiongetDnsAscii0100
     * @tc.number  SUB_Connection_getDnsAscii_0100
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0200
     * @tc.number  SUB_Connection_getDnsAscii_0200
     * @tc.desc    Test normal parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0300
     * @tc.number  SUB_Connection_getDnsAscii_0300
     * @tc.desc    Test pure ASCII domain name, result should remain unchanged.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(PURE_ASCII_DOMAIN);
      expect(result).assertEqual(PURE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0400
     * @tc.number  SUB_Connection_getDnsAscii_0400
     * @tc.desc    Test "" parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0500
     * @tc.number  SUB_Connection_getDnsAscii_0500
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr = SIMPLIFIED_CHINESE_DOMAIN;
      hostStr = TRADITIONAL_CHINESE_DOMAIN;
      const result = connection.getDnsAscii(hostStr);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0600
     * @tc.number  SUB_Connection_getDnsAscii_0600
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr = TRADITIONAL_CHINESE_DOMAIN;
      hostStr = SIMPLIFIED_CHINESE_DOMAIN;
      const result = connection.getDnsAscii(hostStr);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0700
     * @tc.number  SUB_Connection_getDnsAscii_0700
     * @tc.desc    Test change parameters, single parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hostStr: null | string = null;
      hostStr = SIMPLIFIED_CHINESE_DOMAIN;
      const result = connection.getDnsAscii(hostStr);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0800
     * @tc.number  SUB_Connection_getDnsAscii_0800
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii0900
     * @tc.number  SUB_Connection_getDnsAscii_0900
     * @tc.desc    Test normal parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1000
     * @tc.number  SUB_Connection_getDnsAscii_1000
     * @tc.desc    Test "" parameters, NO_CONFIGURATIO.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", connection.ConversionProcess.NO_CONFIGURATION);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1100
     * @tc.number  SUB_Connection_getDnsAscii_1100
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1200
     * @tc.number  SUB_Connection_getDnsAscii_1200
     * @tc.desc    Test normal parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1300
     * @tc.number  SUB_Connection_getDnsAscii_1300
     * @tc.desc    Test "" parameters, ALLOW_UNASSIGNED.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1400
     * @tc.number  SUB_Connection_getDnsAscii_1400
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1500
     * @tc.number  SUB_Connection_getDnsAscii_1500
     * @tc.desc    Test normal parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result =
        connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1600
     * @tc.number  SUB_Connection_getDnsAscii_1600
     * @tc.desc    Test "" parameters, USE_STD3_ASCII_RULES.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", connection.ConversionProcess.USE_STD3_ASCII_RULES);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1700
     * @tc.number  SUB_Connection_getDnsAscii_1700
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, 0);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1800
     * @tc.number  SUB_Connection_getDnsAscii_1800
     * @tc.desc    Test normal parameters, 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, 0);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii1900
     * @tc.number  SUB_Connection_getDnsAscii_1900
     * @tc.desc    Test "",0 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2000
     * @tc.number  SUB_Connection_getDnsAscii_2000
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, 1);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2100
     * @tc.number  SUB_Connection_getDnsAscii_2100
     * @tc.desc    Test normal parameters, 1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, 1);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2200
     * @tc.number  SUB_Connection_getDnsAscii_2200
     * @tc.desc    Test "",1 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", 1);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2300
     * @tc.number  SUB_Connection_getDnsAscii_2300
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, 2);
      expect(result).assertEqual(SIMPLIFIED_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2400
     * @tc.number  SUB_Connection_getDnsAscii_2400
     * @tc.desc    Test normal parameters, 2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, 2);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2500
     * @tc.number  SUB_Connection_getDnsAscii_2500
     * @tc.desc    Test "",2 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("", 2);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2600
     * @tc.number  SUB_Connection_getDnsAscii_2600
     * @tc.desc    Test normal parameters, 3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii(SIMPLIFIED_CHINESE_DOMAIN, 3);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2700
     * @tc.number  SUB_Connection_getDnsAscii_2700
     * @tc.desc    Test normal parameters, 3.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, 3);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2800
     * @tc.number  SUB_Connection_getDnsAscii_2800
     * @tc.desc    Test "",3 parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii("", 3);
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100001);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii2900
     * @tc.number  SUB_Connection_getDnsAscii_2900
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.NO_CONFIGURATION);
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100003);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3000
     * @tc.number  SUB_Connection_getDnsAscii_3000
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual("www.xn--pyb.com");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3100
     * @tc.number  SUB_Connection_getDnsAscii_3100
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii("www.\u08A0.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100003);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3200
     * @tc.number  SUB_Connection_getDnsAscii_3200
     * @tc.desc    Test special  parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii("www.-hello.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100003);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3300
     * @tc.number  SUB_Connection_getDnsAscii_3300
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 500;
      for (let i = 0; i < TEST_COUNT; i++) {
        const startTime = Date.now();
        const result = connection.getDnsAscii("www.中国你好.com");
        const endTime = Date.now();
        const conversionTime = endTime - startTime;
        expect(conversionTime).assertLess(100);
        expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3400
     * @tc.number  SUB_Connection_getDnsAscii_3400
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.台灣早安.com");
        expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3500
     * @tc.number  SUB_Connection_getDnsAscii_3500
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3600
     * @tc.number  SUB_Connection_getDnsAscii_3600
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.NO_CONFIGURATION);
        expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3700
     * @tc.number  SUB_Connection_getDnsAscii_3700
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3800
     * @tc.number  SUB_Connection_getDnsAscii_3800
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.ALLOW_UNASSIGNED);
        expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii3900
     * @tc.number  SUB_Connection_getDnsAscii_3900
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.中国你好.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("www.xn--fiq02ab1ogvc.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4000
     * @tc.number  SUB_Connection_getDnsAscii_4000
     * @tc.desc    Stability test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TEST_COUNT = 50;
      for (let i = 0; i < TEST_COUNT; i++) {
        const result = connection.getDnsAscii("www.台灣早安.com", connection.ConversionProcess.USE_STD3_ASCII_RULES);
        expect(result).assertEqual("www.xn--kprs0pw9ir0k.com");
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4100
     * @tc.number  SUB_Connection_getDnsAscii_4100
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("!@#$，。￥");
      expect(result).assertEqual("!@#$,.xn--cba");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4200
     * @tc.number  SUB_Connection_getDnsAscii_4200
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii("😊", connection.ConversionProcess.NO_CONFIGURATION);
        expect().assertFail();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100003);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4300
     * @tc.number  SUB_Connection_getDnsAscii_4300
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii("😊", connection.ConversionProcess.ALLOW_UNASSIGNED);
      expect(result).assertEqual("xn--o28h");
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4400
     * @tc.number  SUB_Connection_getDnsAscii_4400
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const result = connection.getDnsAscii('www.' + 'b'.repeat(64) + '.com');
        expect().assertFail();
      } catch (error) {
        expect(Number(error.code)).assertEqual(2100003);
      }
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4500
     * @tc.number  SUB_Connection_getDnsAscii_4500
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, null);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4600
     * @tc.number  SUB_Connection_getDnsAscii_4600
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii(TRADITIONAL_CHINESE_DOMAIN, undefined);
      expect(result).assertEqual(TRADITIONAL_CHINESE_ASCII_DOMAIN);
    });

    /**
     * @tc.name    testConnectiongetDnsAscii4700
     * @tc.number  SUB_Connection_getDnsAscii_4700
     * @tc.desc    special param test.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testConnectiongetDnsAscii4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = connection.getDnsAscii('www.' + 'b'.repeat(63) + '.com');
      expect(result).assertEqual("www.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.com");
    });

  });
}