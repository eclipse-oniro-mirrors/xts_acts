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
import Utils from './Utils';
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
      let options : router.RouterOptions = {
        url: 'testability/pages/webSetNetErrorCodeChen1',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCodeChen1 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCodeChen1" == pages.name)) {
          console.info("get webSetNetErrorCodeChen1 state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webSetNetErrorCodeChen1 state success");
        }
      } catch (err) {
        console.error("push webSetNetErrorCodeChen1 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webSetNetErrorCodeChen1Button"), 10000);
      console.log("waitForComponent webSetNetErrorCodeChen1Button");
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
     * @tc.name   testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0072
     * @tc.desc   test WebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE (-163)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE", true, 106010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0073
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT (-164)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT", true, 106020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0074
     * @tc.desc   test WebSetNetErrorCode_ERR_ICANN_NAME_COLLISION (-166)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION", true, 106030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0075
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT (-167)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT", true, 106040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0076
     * @tc.desc   test WebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED (-168)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED", true, 106050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0077
     * @tc.desc   test WebSetNetErrorCode_ERR_CT_STH_INCOMPLETE (-169)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE", true, 106060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0078
     * @tc.desc   test WebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH (-170)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH", true, 106070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0079
     * @tc.desc   test WebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED (-171)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED", true, 106080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0080
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER (-172)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER", true, 106090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_WS_UPGRADE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0081
     * @tc.desc   test WebSetNetErrorCode_ERR_WS_UPGRADE (-172)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_WS_UPGRADE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_UPGRADE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_UPGRADE", true, 106100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0082
     * @tc.desc   test WebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED (-174)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED", true, 106110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0083
     * @tc.desc   test WebSetNetErrorCode_ERR_NO_BUFFER_SPACE (-176)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_BUFFER_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE", true, 106120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0084
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS (-177)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS", true, 106130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0085
     * @tc.desc   test WebSetNetErrorCode_ERR_EARLY_DATA_REJECTED (-178)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED", true, 106140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0086
     * @tc.desc   test WebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA (-179)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA", true, 106150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0087
     * @tc.desc   test WebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED (-180)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED", true, 106160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0088
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE (-181)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE", true, 106170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0089
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST (-182)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST", true, 106180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0090
     * @tc.desc   test WebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED (-183)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED", true, 106190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0091
     * @tc.desc   test WebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID (-184)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID", true, 106200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0092
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID (-200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID", true, 106210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_DATE_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0093
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_DATE_INVALID (-201)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATE_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATE_INVALID", true, 106220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0094
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID (-202)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID", true, 106230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0095
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS (-203)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS", true, 106240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0096
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM (-204)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM", true, 106250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0097
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION (-205)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION", true, 106260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_REVOKED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0098
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_REVOKED (-206)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_REVOKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_REVOKED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_REVOKED", true, 106270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0099
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_INVALID (-207)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_INVALID", true, 106280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0100
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM (-208)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM", true, 106290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0101
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME (-210)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME", true, 106300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_WEAK_KEY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0102
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_WEAK_KEY (-211)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_KEY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_KEY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_KEY", true, 106310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0103
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION (-212)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION", true, 106320, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0104
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG (-213)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG", true, 106330, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0105
     * @tc.desc   test WebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED (-214)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED", true, 106340, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0106
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY (-215)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY", true, 106350, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0107
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED (-217)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED", true, 106360, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0108
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER (-218)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER", true, 106370, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_END
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0109
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_END (-219)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_END', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_END"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_END", true, 106380, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen1Button");
    })
  })
}