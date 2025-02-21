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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ''

export default function ActsAceWebSetNetErrorCodeChen2() {
  describe('ActsAceWebSetNetErrorCodeChen2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSetNetErrorCodeChen2',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCodeChen2 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCodeChen2" == pages.name)) {
          console.info("get webSetNetErrorCodeChen2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCodeChen2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCodeChen2 page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
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
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED
     *@tc.desc test WebSetNetErrorCodeERR_SOCKS_CONNECTION_FAILED (-120)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED", true, 3050, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE
    *@tc.desc test WebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE (-121)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE", true, 3051, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED
    *@tc.desc test WebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED (-122)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED", true, 3052, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION (-123)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION", true, 3053, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES
    *@tc.desc test WebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES (-124)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES", true, 3054, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT (-125)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT", true, 3055, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT (-126)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT", true, 3056, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED
    *@tc.desc test WebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED (-127)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED", true, 3057, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED
    *@tc.desc test WebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED (-130)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED", true, 3058, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED
    *@tc.desc test WebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED (-131)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED", true, 3059, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT
    *@tc.desc test WebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT (-133)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT", true, 3060, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED (-134)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED", true, 3061, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY (-135)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY", true, 3062, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID
    *@tc.desc test WebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID (-136)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID", true, 3063, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED
    *@tc.desc test WebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED (-137)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED", true, 3064, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED
    *@tc.desc test WebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED (-138)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED", true, 3065, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED
    *@tc.desc test WebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED (-139)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED", true, 3066, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT
    *@tc.desc test WebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT (-140)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT", true, 3067, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED (-141)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED", true, 3068, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_ERR_MSG_TOO_BIG
    *@tc.desc test WebSetNetErrorCode_ERR_ERR_MSG_TOO_BIG (-142)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_MSG_TOO_BIG', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MSG_TOO_BIG"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MSG_TOO_BIG", true, 3069, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR
    *@tc.desc test WebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR (-145)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR", true, 3070, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_ADDRESS_IN_USE
    *@tc.desc test WebSetNetErrorCode_ERR_ADDRESS_IN_USE (-145)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_ADDRESS_IN_USE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_IN_USE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_IN_USE", true, 3071, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED (-148)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED", true, 3072, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY (-149)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY", true, 3073, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN (-150)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN", true, 3074, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED
    *@tc.desc test WebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED (-151)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED", true, 3075, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT (-153)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT", true, 3076, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE
    *@tc.desc test WebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE (-154)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE", true, 3077, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED (-156)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED", true, 3078, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT (-159)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT", true, 3079, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR
    *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR (-160)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR", true, 3080, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR
    *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR (-161)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR", true, 3081, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
    *@tc.name testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE
    *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE (-162)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE", true, 3082, done);
      sendEventByKey('webSetNetErrorCodeChen2', 10, '');
    })


  })
}
