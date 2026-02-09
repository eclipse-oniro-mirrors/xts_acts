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
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0072
     *@tc.name testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
     *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE (-163)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE", true, 106010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0073
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT (-164)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT", true, 106020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0074
     *@tc.name    testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION
     *@tc.desc    test WebSetNetErrorCode_ERR_ICANN_NAME_COLLISION (-166)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION", true, 106030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0075
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT (-167)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT", true, 106040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0076
     *@tc.name    testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED (-168)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED", true, 106050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0077
     *@tc.name testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE
     *@tc.desc test WebSetNetErrorCode_ERR_CT_STH_INCOMPLETE (-169)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE", true, 106060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0078
     *@tc.name    testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
     *@tc.desc    test WebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH (-170)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH", true, 106070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0079
     *@tc.name testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED (-171)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED", true, 106080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0080
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER (-172)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER", true, 106090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0081
     *@tc.name testWebSetNetErrorCode_ERR_WS_UPGRADE
     *@tc.desc test WebSetNetErrorCode_ERR_WS_UPGRADE (-172)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_WS_UPGRADE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_UPGRADE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_UPGRADE", true, 106100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0082
     *@tc.name    testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED
     *@tc.desc    test WebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED (-174)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED", true, 106110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0083
     *@tc.name    testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE
     *@tc.desc    test WebSetNetErrorCode_ERR_NO_BUFFER_SPACE (-176)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_BUFFER_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE", true, 106120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0084
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS (-177)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS", true, 106130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0085
     *@tc.name    testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED
     *@tc.desc    test WebSetNetErrorCode_ERR_EARLY_DATA_REJECTED (-178)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED", true, 106140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0086
     *@tc.name    testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA
     *@tc.desc    test WebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA (-179)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA", true, 106150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0087
     *@tc.name    testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED
     *@tc.desc    test WebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED (-180)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED", true, 106160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0088
     *@tc.name    testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE
     *@tc.desc    test WebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE (-181)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE", true, 106170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0089
     *@tc.name    testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST
     *@tc.desc    test WebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST (-182)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST", true, 106180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0090
     *@tc.name    testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED
     *@tc.desc    test WebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED (-183)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED", true, 106190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
  })
}