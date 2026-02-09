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
const EVENT_ID_SET_EIMIT_KEY = 104000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode() {
  describe('ActsAceWebSetNetErrorCode', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webSetNetErrorCode"), 10000);
      console.log('waitForComponent webSetNetErrorCode');
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
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0025
     *@tc.name    testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
     *@tc.desc    test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION (-350)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION", true, 104250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0026
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM (-351)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM", true, 104260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0027
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_PING_FAILED (-352)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED", true, 104270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0028
     *@tc.name    testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH
     *@tc.desc    test WebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH (-354)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH", true, 104280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0029
     *@tc.name    testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING
     *@tc.desc    test WebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING (-355)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING", true, 104290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0030
     *@tc.name    testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR
     *@tc.desc    test WebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR (-356)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR", true, 104300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0031
     *@tc.name    testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED
     *@tc.desc    test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED (-357)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED", true, 104310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0032
     *@tc.name   testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED (-358)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED", true, 104320, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0033
     *@tc.name   testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
     *@tc.desc   test WebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY (-360)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY", true, 104330, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0034
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR (-361)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR", true, 104340, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0035
     *@tc.name   testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR
     *@tc.desc   test WebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR (-362)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR", true, 104350, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0036
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR (-363)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR", true, 104360, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0037
     *@tc.name    testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
     *@tc.desc    test WebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION(-364)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION", true, 104370, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0038
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED(-365)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED", true, 104380, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0039
     *@tc.name    testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED
     *@tc.desc    test WebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED(-366)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED", true, 104390, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0040
     *@tc.name    testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED
     *@tc.desc    test WebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED(-367)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED", true, 104400, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0041
     *@tc.name    testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE
     *@tc.desc    test WebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE(-370)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE", true, 104410, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0042
     *@tc.name    testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED(-371)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED", true, 104420, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0043
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED(-372)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED", true, 104430, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0044
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE(-373)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE", true, 104440, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0045
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER(-374)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER", true, 104450, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0046
     *@tc.name    testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES
     *@tc.desc    test WebSetNetErrorCode_ERR_TOO_MANY_RETRIES(-375)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_RETRIES"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES", true, 104460, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0047
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED(-376)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED", true, 104470, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0048
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM(-377)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM", true, 104480, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

  })
}