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
let emitKey = ""

export default function ActsAceWebSetNetErrorCode() {
  describe('ActsAceWebSetNetErrorCode', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSetNetErrorCode',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode" == pages.name)) {
          console.info("get webSetNetErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCode state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCode page error:" + err);
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
     *@tc.name testWebSetNetErrorCode_ERR_EMPTY_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_EMPTY_RESPONSE (-324)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_EMPTY_RESPONSE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EMPTY_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EMPTY_RESPONSE", true, 1001, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0002
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG (-325)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG", true, 1002, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0003
     *@tc.name testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED (-327)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED", true, 1003, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0004
     *@tc.name testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE
     *@tc.desc test WebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE (-328)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE", true, 1004, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0005
     *@tc.name testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY
     *@tc.desc test WebSetNetErrorCode_ERR_MALFORMED_IDENTITY (-329)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MALFORMED_IDENTITY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY", true, 1005, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0006
     *@tc.name testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED (-330)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED", true, 1006, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0007
     *@tc.name testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED
     *@tc.desc test WebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED (-331)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED", true, 1007, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0008
     *@tc.name testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED
     *@tc.desc test WebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED (-332)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED", true, 1008, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0009
     *@tc.name testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED (-333)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED", true, 1009, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0010
     *@tc.name testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
     *@tc.desc test WebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT (-334)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT", true, 1010, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0011
     *@tc.name testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES
     *@tc.desc test WebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES (-336)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES", true, 1011, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0012
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR (-337)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR", true, 1012, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0013
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS (-338)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS", true, 1013, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0014
     *@tc.name testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME
     *@tc.desc test WebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME (-339)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME", true, 1014, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0015
     *@tc.name testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED (-340)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED", true, 1015, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0016
     *@tc.name testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS
     *@tc.desc test WebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS (-341)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS", true, 1016, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0017
     *@tc.name testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
     *@tc.desc test WebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS (-342)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS", true, 1017, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0018
     *@tc.name testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT
     *@tc.desc test WebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT (-343)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT", true, 1018, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0019
     *@tc.name testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
     *@tc.desc test WebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS (-344)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS", true, 1019, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0020
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN (-345)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN", true, 1020, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0021
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH (-346)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH", true, 1021, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0022
     *@tc.name testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS
     *@tc.desc test WebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS (-347)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS", true, 1022, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0023
     *@tc.name testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP
     *@tc.desc test WebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP (-348)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP", true, 1023, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0024
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION (-349)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION", true, 1024, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0025
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION (-350)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION", true, 1025, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0026
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM (-351)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM", true, 1026, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0027
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_PING_FAILED (-352)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PING_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED", true, 1027, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0028
     *@tc.name testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH
     *@tc.desc test WebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH (-354)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH", true, 1028, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0029
     *@tc.name testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING
     *@tc.desc test WebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING (-355)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING", true, 1029, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0030
     *@tc.name testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR (-356)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR", true, 1030, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0031
     *@tc.name testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED
     *@tc.desc test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED (-357)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED", true, 1031, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0032
     *@tc.name testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED (-358)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED", true, 1032, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0033
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY (-360)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY", true, 1033, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0034
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR (-361)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR", true, 1034, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0035
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR (-362)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR", true, 1035, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0036
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR (-363)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR", true, 1036, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0037
     *@tc.name testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
     *@tc.desc test WebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION(-364)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION", true, 1037, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0038
     *@tc.name testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED(-365)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED", true, 1038, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0039
     *@tc.name testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED
     *@tc.desc test WebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED(-366)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED", true, 1039, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0040
     *@tc.name testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED
     *@tc.desc test WebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED(-367)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED", true, 1040, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0041
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE(-370)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE", true, 1041, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0042
     *@tc.name testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED(-371)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED", true, 1042, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0043
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED(-372)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED", true, 1043, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0044
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE(-373)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE", true, 1044, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0045
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER(-374)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER", true, 1045, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0046
     *@tc.name testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES
     *@tc.desc test WebSetNetErrorCode_ERR_TOO_MANY_RETRIES(-375)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_RETRIES"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES", true, 1046, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0047
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED(-376)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED", true, 1047, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0048
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM(-377)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM", true, 1048, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0049
     *@tc.name testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH(-378)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH", true, 1049, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0050
     *@tc.name testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE(-379)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE", true, 1050, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0051
     *@tc.name testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT
     *@tc.desc test WebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT(-380)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT", true, 1051, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0052
     *@tc.name testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
     *@tc.desc test WebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED(-381)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED", true, 1052, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0053
     *@tc.name testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS
     *@tc.desc test WebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS(-382)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS", true, 1053, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0054
     *@tc.name testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE
     *@tc.desc test WebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE(-383)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE", true, 1054, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0055
     *@tc.name testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
     *@tc.desc test WebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY(-384)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY", true, 1055, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0056
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_MISS
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_MISS(-400)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_MISS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_MISS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_MISS", true, 1056, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0057
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_READ_FAILURE(-401)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_READ_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE", true, 1057, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0058
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE(-402)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE", true, 1058, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0059
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED(-403)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED", true, 1059, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0060
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE(-404)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE", true, 1060, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0061
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE(-405)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE", true, 1061, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0062
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_RACE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_RACE(-406)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_RACE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_RACE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_RACE", true, 1062, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0063
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE(-407)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE", true, 1063, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0064
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH(-408)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH", true, 1064, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0065
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT(-409)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT", true, 1065, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0066
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ(-410)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ", true, 1066, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0067
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE(-411)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE", true, 1067, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0068
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE(-412)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE", true, 1068, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0069
     *@tc.name testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE
     *@tc.desc test WebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE(-413)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE", true, 1069, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0070
     *@tc.name testWebSetNetErrorCode_ERR_INSECURE_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_INSECURE_RESPONSE(-501)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INSECURE_RESPONSE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSECURE_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSECURE_RESPONSE", true, 1070, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_null_API_0071
     *@tc.name testWebSetNetErrorCode_null
     *@tc.desc test WebSetNetErrorCode_null (null)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_null', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_null"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_null", true, 1071, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_1000_API_0071
     *@tc.name testWebSetNetErrorCode_1000
     *@tc.desc test WebSetNetErrorCode_1000 (-1000)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_1000', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_1000"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_1000", true, 1072, done);
      sendEventByKey('webSetNetErrorCode', 10, '');
    })


  })
}
