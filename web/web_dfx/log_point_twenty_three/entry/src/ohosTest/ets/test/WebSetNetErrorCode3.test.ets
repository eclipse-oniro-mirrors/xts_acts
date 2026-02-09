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
const EVENT_ID_SET_EIMIT_KEY = 105000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode3() {
  describe('ActsAceWebSetNetErrorCode3', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("ActsAceWebSetNetErrorCode3Button"), 10000);
      console.log('waitForComponent ActsAceWebSetNetErrorCode3Button');
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
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0070
     *@tc.name    testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC
     *@tc.desc    test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC (-707)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC", true, 105200, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0071
     *@tc.name    testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE
     *@tc.desc    test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE (-708)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE", true, 105210, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0072
     *@tc.name    testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED
     *@tc.desc    test WebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED (-709)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED", true, 105220, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0073
     *@tc.name    testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_KEY_GENERATION_FAILED (-710)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED", true, 105230, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0074
     *@tc.name    testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED (-712)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED", true, 105240, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0075
     *@tc.name    testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED (-713)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED", true, 105250, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0076
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED (-714)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED", true, 105260, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0077
     *@tc.name    testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED
     *@tc.desc    test WebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED (-716)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED", true, 105270, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0078
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE (-800)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE", true, 105280, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0079
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP (-801)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP", true, 105290, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0080
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SERVER_FAILED (-802)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED", true, 105300, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0081
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_TIMED_OUT
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_TIMED_OUT (-803)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_TIMED_OUT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_TIMED_OUT", true, 105310, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0082
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_CACHE_MISS
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_CACHE_MISS (-804)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_CACHE_MISS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_CACHE_MISS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_CACHE_MISS", true, 105320, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0083
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY (-805)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY", true, 105330, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0084
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_SORT_ERROR
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_SORT_ERROR (-806)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SORT_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SORT_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SORT_ERROR", true, 105340, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0085
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED (-808)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED", true, 105350, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0086
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY (-809)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY", true, 105360, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0087
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED (-810)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED", true, 105370, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0088
     *@tc.name    testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
     *@tc.desc    test WebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN (-810)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN", true, 105380, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })
  })
}