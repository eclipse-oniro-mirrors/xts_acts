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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebSetNetErrorCodeChen1() {
  describe('ActsAceWebSetNetErrorCodeChen1', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webSetNetErrorCodeChen1',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCodeChen1 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCodeChen1" == pages.name)) {
          console.info("get webSetNetErrorCodeChen1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCodeChen1 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCodeChen1 page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      done();
    })

    afterEach(async (done: Function) => {
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent : events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.error("emit emitKey error:" + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0072
     *@tc.name testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
     *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE (-163)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE", true, 3083, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0073
     *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT (-164)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT", true, 3084, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0074
     *@tc.name testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION
     *@tc.desc test WebSetNetErrorCode_ERR_ICANN_NAME_COLLISION (-166)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION", true, 3085, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0075
     *@tc.name testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT (-167)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT", true, 3086, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0076
     *@tc.name testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED (-168)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED", true, 3087, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0077
     *@tc.name testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE
     *@tc.desc test WebSetNetErrorCode_ERR_CT_STH_INCOMPLETE (-169)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE", true, 3088, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0078
     *@tc.name testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
     *@tc.desc test WebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH (-170)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH", true, 3089, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0079
     *@tc.name testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED (-171)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED", true, 3090, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0080
     *@tc.name testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER (-172)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER", true, 3091, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0081
     *@tc.name testWebSetNetErrorCode_ERR_WS_UPGRADE
     *@tc.desc test WebSetNetErrorCode_ERR_WS_UPGRADE (-172)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_WS_UPGRADE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_UPGRADE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_UPGRADE", true, 3092, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0082
     *@tc.name testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED
     *@tc.desc test WebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED (-174)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED", true, 3093, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0083
     *@tc.name testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE
     *@tc.desc test WebSetNetErrorCode_ERR_NO_BUFFER_SPACE (-176)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_BUFFER_SPACE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_BUFFER_SPACE", true, 3094, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0084
     *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS (-177)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS", true, 3095, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0085
     *@tc.name testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED
     *@tc.desc test WebSetNetErrorCode_ERR_EARLY_DATA_REJECTED (-178)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED", true, 3096, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0086
     *@tc.name testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA
     *@tc.desc test WebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA (-179)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA", true, 3097, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0087
     *@tc.name testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED
     *@tc.desc test WebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED (-180)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED", true, 3098, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0088
     *@tc.name testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE (-181)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE", true, 3099, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0089
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST (-182)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST", true, 3100, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0090
     *@tc.name testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED
     *@tc.desc test WebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED (-183)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED", true, 3101, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0091
     *@tc.name testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID
     *@tc.desc test WebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID (-184)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID", true, 3102, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0092
     *@tc.name testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID (-200)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID", true, 3103, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0093
     *@tc.name testWebSetNetErrorCode_ERR_CERT_DATE_INVALID
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_DATE_INVALID (-201)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATE_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATE_INVALID", true, 3104, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0094
     *@tc.name testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID (-202)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID", true, 3105, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0095
     *@tc.name testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS (-203)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS", true, 3106, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0096
     *@tc.name testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM (-204)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM", true, 3107, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0097
     *@tc.name testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION (-205)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION", true, 3108, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0098
     *@tc.name testWebSetNetErrorCode_ERR_CERT_REVOKED
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_REVOKED (-206)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_REVOKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_REVOKED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_REVOKED", true, 3109, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0099
     *@tc.name testWebSetNetErrorCode_ERR_CERT_INVALID
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_INVALID (-207)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_INVALID", true, 3110, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0100
     *@tc.name testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM (-208)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM", true, 3111, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0101
     *@tc.name testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME (-210)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME", true, 3112, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0102
     *@tc.name testWebSetNetErrorCode_ERR_CERT_WEAK_KEY
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_WEAK_KEY (-211)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_WEAK_KEY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_WEAK_KEY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_WEAK_KEY", true, 3113, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0103
     *@tc.name testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION (-212)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION", true, 3114, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0104
     *@tc.name testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG (-213)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG", true, 3115, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0105
     *@tc.name testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
     *@tc.desc test WebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED (-214)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED", true, 3116, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0106
     *@tc.name testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY (-215)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY", true, 3117, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0107
     *@tc.name testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED (-217)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED", true, 3118, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0108
     *@tc.name testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER (-218)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER", true, 3119, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0109
     *@tc.name testWebSetNetErrorCode_ERR_CERT_END
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_END (-219)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_END', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_END"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_END", true, 3120, done);
      sendEventByKey('webSetNetErrorCodeChen1Button', 10, '');
    })


  })
}
