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
const EVENT_ID_SET_EIMIT_KEY = 104000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode() {
  describe('ActsAceWebSetNetErrorCode', () => {
    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webSetNetErrorCode',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode" == pages.name)) {
          console.info("get webSetNetErrorCode state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webSetNetErrorCode state success");
        }
      } catch (err) {
        console.error("push webSetNetErrorCode page error:" + err);
      }
      await driver.waitForComponent(ON.id("webSetNetErrorCode"), 10000);
      console.log("waitForComponent webSetNetErrorCode");
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
     * @tc.name   testWebSetNetErrorCode_ERR_EMPTY_RESPONSE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
     * @tc.desc   test WebSetNetErrorCode_ERR_EMPTY_RESPONSE (-324)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_EMPTY_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EMPTY_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EMPTY_RESPONSE", true, 104010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0002
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG (-325)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG", true, 104020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0003
     * @tc.desc   test WebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED (-327)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED", true, 104030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0004
     * @tc.desc   test WebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE (-328)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE", true, 104040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0005
     * @tc.desc   test WebSetNetErrorCode_ERR_MALFORMED_IDENTITY (-329)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MALFORMED_IDENTITY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY", true, 104050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0006
     * @tc.desc   test WebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED (-330)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED", true, 104060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0007
     * @tc.desc   test WebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED (-331)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED", true, 104070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0008
     * @tc.desc   test WebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED (-332)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED", true, 104080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0009
     * @tc.desc   test WebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED (-333)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED", true, 104090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0010
     * @tc.desc   test WebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT (-334)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT", true, 104100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0011
     * @tc.desc   test WebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES (-336)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES", true, 104110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0012
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR (-337)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR", true, 104120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0013
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS (-338)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS", true, 104130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0014
     * @tc.desc   test WebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME (-339)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME", true, 104140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0015
     * @tc.desc   test WebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED (-340)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED", true, 104150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0016
     * @tc.desc   test WebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS (-341)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS", true, 104160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0017
     * @tc.desc   test WebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS (-342)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS", true, 104170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0018
     * @tc.desc   test WebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT (-343)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT", true, 104180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0019
     * @tc.desc   test WebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS (-344)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS", true, 104190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0020
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN (-345)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN", true, 104200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0021
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH (-346)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH", true, 104210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0022
     * @tc.desc   test WebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS (-347)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS", true, 104220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0023
     * @tc.desc   test WebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP (-348)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP", true, 104230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0024
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION (-349)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION", true, 104240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0025
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION (-350)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION", true, 104250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0026
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM (-351)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM", true, 104260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0027
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_PING_FAILED (-352)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PING_FAILED", true, 104270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0028
     * @tc.desc   test WebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH (-354)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH", true, 104280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0029
     * @tc.desc   test WebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING (-355)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING", true, 104290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0030
     * @tc.desc   test WebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR (-356)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR", true, 104300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0031
     * @tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED (-357)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED", true, 104310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0032
     * @tc.desc   test WebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED (-358)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED", true, 104320, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0033
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY (-360)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY", true, 104330, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0034
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR (-361)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR", true, 104340, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0035
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR (-362)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR", true, 104350, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0036
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR (-363)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR", true, 104360, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0037
     * @tc.desc   test WebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION(-364)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION", true, 104370, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0038
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED(-365)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED", true, 104380, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0039
     * @tc.desc   test WebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED(-366)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED", true, 104390, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0040
     * @tc.desc   test WebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED(-367)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED", true, 104400, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0041
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE(-370)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE", true, 104410, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0042
     * @tc.desc   test WebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED(-371)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED", true, 104420, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0043
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED(-372)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED", true, 104430, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0044
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE(-373)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE", true, 104440, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0045
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER(-374)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER", true, 104450, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0046
     * @tc.desc   test WebSetNetErrorCode_ERR_TOO_MANY_RETRIES(-375)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_RETRIES"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_RETRIES", true, 104460, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0047
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED(-376)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED", true, 104470, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0048
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM(-377)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM", true, 104480, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0049
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH(-378)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH", true, 104490, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0050
     * @tc.desc   test WebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE(-379)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE", true, 104500, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0051
     * @tc.desc   test WebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT(-380)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT", true, 104510, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0052
     * @tc.desc   test WebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED(-381)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED", true, 104520, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0053
     * @tc.desc   test WebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS(-382)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS", true, 104530, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0054
     * @tc.desc   test WebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE(-383)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE", true, 104540, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0055
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY(-384)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY", true, 104550, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_MISS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0056
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_MISS(-400)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_MISS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_MISS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_MISS", true, 104560, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0057
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_READ_FAILURE(-401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_READ_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE", true, 104570, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0058
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE(-402)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE", true, 104580, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0059
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED(-403)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED", true, 104590, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0060
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE(-404)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE", true, 104600, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0061
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE(-405)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE", true, 104610, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_RACE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0062
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_RACE(-406)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_RACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_RACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_RACE", true, 104620, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0063
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE(-407)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE", true, 104630, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0064
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH(-408)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH", true, 104640, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0065
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT(-409)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT", true, 104650, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0066
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ(-410)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ", true, 104660, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0067
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE(-411)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE", true, 104670, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0068
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE(-412)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE", true, 104680, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0069
     * @tc.desc   test WebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE(-413)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE", true, 104690, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INSECURE_RESPONSE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0070
     * @tc.desc   test WebSetNetErrorCode_ERR_INSECURE_RESPONSE(-501)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INSECURE_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSECURE_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSECURE_RESPONSE", true, 104700, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_null
     * @tc.number SUB_ACE_WEB_SET_null_API_0071
     * @tc.desc   test WebSetNetErrorCode_null (null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_null"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_null", true, 104710, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_1000
     * @tc.number SUB_ACE_WEB_SET_1000_API_0071
     * @tc.desc   test WebSetNetErrorCode_1000 (-1000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_1000"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_1000", true, 104720, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })
  })
}