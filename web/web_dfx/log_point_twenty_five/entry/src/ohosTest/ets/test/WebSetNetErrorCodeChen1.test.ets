/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
const EVENT_ID_SET_EIMIT_KEY = 106000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCodeChen1() {
  describe('ActsAceWebSetNetErrorCodeChen1', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webSetNetErrorCodeChen1Button"), 10000);
      console.log('waitForComponent webSetNetErrorCodeChen1Button');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0091
     *@tc.name    testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID
     *@tc.desc    test WebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID (-184)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID", true, 106200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0092
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID (-200)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID", true, 106210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0093
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_DATE_INVALID
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_DATE_INVALID (-201)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATE_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATE_INVALID", true, 106220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0094
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID (-202)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID", true, 106230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0095
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS (-203)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS", true, 106240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0096
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM (-204)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM", true, 106250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0097
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION (-205)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION", true, 106260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0098
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_REVOKED
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_REVOKED (-206)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_REVOKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_REVOKED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_REVOKED", true, 106270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0099
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_INVALID
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_INVALID (-207)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_INVALID", true, 106280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0100
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM (-208)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM", true, 106290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0101
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME (-210)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME", true, 106300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0102
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_WEAK_KEY
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_WEAK_KEY (-211)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_KEY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_KEY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_KEY", true, 106310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0103
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION (-212)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION", true, 106320, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0104
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG (-213)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG", true, 106330, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0105
     *@tc.name    testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
     *@tc.desc    test WebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED (-214)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED", true, 106340, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0106
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY (-215)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY", true, 106350, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0107
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED (-217)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED", true, 106360, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0108
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER (-218)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER", true, 106370, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0109
     *@tc.name   testWebSetNetErrorCode_ERR_CERT_END
     *@tc.desc   test WebSetNetErrorCode_ERR_CERT_END (-219)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_END', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_END"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_END", true, 106380, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
  })
}