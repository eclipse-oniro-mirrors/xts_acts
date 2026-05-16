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
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0051
     *@tc.name    testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT
     *@tc.desc    test WebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT (-502)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT", true, 105010, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0052
     *@tc.name    testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED (-503)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED", true, 105020, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0053
     *@tc.name    testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE
     *@tc.desc    test WebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE (-504)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE", true, 105030, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0054
     *@tc.name    testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE
     *@tc.desc    test WebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE (-505)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE", true, 105040, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0055
     *@tc.name    testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED (-506)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED", true, 105050, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0056
     *@tc.name    testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
     *@tc.desc    test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST (-507)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST", true, 105060, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0057
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_FAILED (-601)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FAILED", true, 105070, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0058
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE (-602)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE", true, 105080, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0059
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED (-603)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED", true, 105090, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0060
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_FILE_BUSY
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_FILE_BUSY (-604)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FILE_BUSY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FILE_BUSY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FILE_BUSY", true, 105100, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0061
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR (-605)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR", true, 105110, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0062
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED (-606)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED", true, 105120, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0063
     *@tc.name    testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE
     *@tc.desc    test WebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE (-607)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE", true, 105130, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0064
     *@tc.name    testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD
     *@tc.desc    test WebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD (-701)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD", true, 105140, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0065
     *@tc.name    testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED
     *@tc.desc    test WebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED (-702)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED", true, 105150, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0066
     *@tc.name   testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA
     *@tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA (-703)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA", true, 105160, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0067
     *@tc.name   testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS
     *@tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS (-704)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS", true, 105170, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0068
     *@tc.name   testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED (-705)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED", true, 105180, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0069
     *@tc.name   testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED (-706)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED", true, 105190, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })
  })
}