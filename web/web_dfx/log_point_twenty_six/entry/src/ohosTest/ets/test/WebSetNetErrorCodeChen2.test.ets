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
let emitKey = ''
const EVENT_ID_SET_EIMIT_KEY = 107000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCodeChen2() {
  describe('ActsAceWebSetNetErrorCodeChen2', () => {

    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webSetNetErrorCodeChen2"), 10000);
      console.log('waitForComponent webSetNetErrorCodeChen2');
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
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0089
    *@tc.name   testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED
    *@tc.desc   test WebSetNetErrorCodeERR_SOCKS_CONNECTION_FAILED (-120)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED", true, 107010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })

    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0090
    *@tc.name   testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE
    *@tc.desc   test WebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE (-121)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE", true, 107020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })

    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0091
    *@tc.name   testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED
    *@tc.desc   test WebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED (-122)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED", true, 107030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0092
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION (-123)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION", true, 107040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0093
    *@tc.name   testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES
    *@tc.desc   test WebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES (-124)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES", true, 107050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0094
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT (-125)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT", true, 107060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0095
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT (-126)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT", true, 107070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0096
    *@tc.name   testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED
    *@tc.desc   test WebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED (-127)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED", true, 107080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0097
    *@tc.name   testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED
    *@tc.desc   test WebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED (-130)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED", true, 107090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0098
    *@tc.name   testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED
    *@tc.desc   test WebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED (-131)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED", true, 107100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0099
    *@tc.name   testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT
    *@tc.desc   test WebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT (-133)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT", true, 107110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0100
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED (-134)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED", true, 107120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0101
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY (-135)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY", true, 107130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0102
    *@tc.name   testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID
    *@tc.desc   test WebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID (-136)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID", true, 107140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0103
    *@tc.name   testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED
    *@tc.desc   test WebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED (-137)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED", true, 107150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0104
    *@tc.name   testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED
    *@tc.desc   test WebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED (-138)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED", true, 107160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0105
    *@tc.name   testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED
    *@tc.desc   test WebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED (-139)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED", true, 107170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0106
    *@tc.name testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT
    *@tc.desc test WebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT (-140)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT", true, 107180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0107
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED (-141)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED", true, 107190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0108
    *@tc.name   testWebSetNetErrorCode_ERR_MSG_TOO_BIG
    *@tc.desc   test WebSetNetErrorCode_ERR_ERR_MSG_TOO_BIG (-142)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_MSG_TOO_BIG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MSG_TOO_BIG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MSG_TOO_BIG", true, 107200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0109
    *@tc.name   testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR
    *@tc.desc   test WebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR (-145)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR", true, 107210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0110
    *@tc.name   testWebSetNetErrorCode_ERR_ADDRESS_IN_USE
    *@tc.desc   test WebSetNetErrorCode_ERR_ADDRESS_IN_USE (-145)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_ADDRESS_IN_USE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_IN_USE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_IN_USE", true, 107220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
  })
}