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
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0001
     *@tc.name   testWebSetNetErrorCode_ERR_EMPTY_RESPONSE
     *@tc.desc   test WebSetNetErrorCode_ERR_EMPTY_RESPONSE (-324)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_EMPTY_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_EMPTY_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_EMPTY_RESPONSE", true, 104010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0002
     *@tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG
     *@tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG (-325)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG", true, 104020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0003
     *@tc.name   testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED (-327)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED", true, 104030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0004
     *@tc.name   testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE
     *@tc.desc   test WebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE (-328)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE", true, 104040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0005
     *@tc.name   testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY
     *@tc.desc   test WebSetNetErrorCode_ERR_MALFORMED_IDENTITY (-329)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MALFORMED_IDENTITY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MALFORMED_IDENTITY", true, 104050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0006
     *@tc.name   testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED (-330)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED", true, 104060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0007
     *@tc.name   testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED
     *@tc.desc   test WebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED (-331)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED", true, 104070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0008
     *@tc.name   testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED
     *@tc.desc   test WebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED (-332)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED", true, 104080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0009
     *@tc.name   testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED (-333)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED", true, 104090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0010
     *@tc.name   testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
     *@tc.desc   test WebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT (-334)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT", true, 104100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0011
     *@tc.name   testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES
     *@tc.desc   test WebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES (-336)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES", true, 104110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0012
     *@tc.name   testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR
     *@tc.desc   test WebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR (-337)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR", true, 104120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0013
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS (-338)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS", true, 104130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0014
     *@tc.name   testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME
     *@tc.desc   test WebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME (-339)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME", true, 104140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0015
     *@tc.name   testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED (-340)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED", true, 104150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0016
     *@tc.name   testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS
     *@tc.desc   test WebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS (-341)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS", true, 104160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0017
     *@tc.name   testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
     *@tc.desc   test WebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS (-342)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS", true, 104170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0018
     *@tc.name    testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT
     *@tc.desc    test WebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT (-343)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT", true, 104180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0019
     *@tc.name   testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
     *@tc.desc   test WebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS (-344)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS", true, 104190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0020
     *@tc.name   testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
     *@tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN (-345)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN", true, 104200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0021
     *@tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
     *@tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH (-346)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH", true, 104210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0022
     *@tc.name   testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS
     *@tc.desc   test WebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS (-347)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS", true, 104220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0023
     *@tc.name   testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP
     *@tc.desc   test WebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP (-348)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP", true, 104230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0024
     *@tc.name   testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
     *@tc.desc   test WebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION (-349)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION", true, 104240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })
  })
}