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
const EVENT_ID_SET_EIMIT_KEY = 105000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode3() {
  describe('ActsAceWebSetNetErrorCode3', () => {
    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webSetNetErrorCode3',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode3 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode3" == pages.name)) {
          console.info("get webSetNetErrorCode3 state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webSetNetErrorCode3 state success");
        }
      } catch (err) {
        console.error("push webSetNetErrorCode3 page error:" + err);
      }
      await driver.waitForComponent(ON.id("ActsAceWebSetNetErrorCode3Button"), 10000);
      console.log("waitForComponent ActsAceWebSetNetErrorCode3Button");
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
     * @tc.name   testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0051
     * @tc.desc   test WebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT (-502)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT", true, 105010, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0052
     * @tc.desc   test WebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED (-503)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED", true, 105020, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0053
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE (-504)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE", true, 105030, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0054
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE (-505)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE", true, 105040, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0055
     * @tc.desc   test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED (-506)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED", true, 105050, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0056
     * @tc.desc   test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST (-507)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST", true, 105060, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0057
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_FAILED (-601)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FAILED", true, 105070, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0058
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE (-602)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE", true, 105080, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0059
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED (-603)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED", true, 105090, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_FILE_BUSY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0060
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_FILE_BUSY (-604)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FILE_BUSY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FILE_BUSY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FILE_BUSY", true, 105100, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0061
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR (-605)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR", true, 105110, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0062
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED (-606)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED", true, 105120, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0063
     * @tc.desc   test WebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE (-607)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE", true, 105130, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0064
     * @tc.desc   test WebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD (-701)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD", true, 105140, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0065
     * @tc.desc   test WebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED (-702)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED", true, 105150, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0066
     * @tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA (-703)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA", true, 105160, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0067
     * @tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS (-704)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS", true, 105170, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0068
     * @tc.desc   test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED (-705)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED", true, 105180, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0069
     * @tc.desc   test WebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED (-706)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED", true, 105190, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0070
     * @tc.desc   test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC (-707)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC", true, 105200, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0071
     * @tc.desc   test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE (-708)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE", true, 105210, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0072
     * @tc.desc   test WebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED (-709)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED", true, 105220, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0073
     * @tc.desc   test WebSetNetErrorCode_ERR_KEY_GENERATION_FAILED (-710)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED", true, 105230, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0074
     * @tc.desc   test WebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED (-712)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED", true, 105240, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0075
     * @tc.desc   test WebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED (-713)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED", true, 105250, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0076
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED (-714)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED", true, 105260, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0077
     * @tc.desc   test WebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED (-716)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED", true, 105270, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0078
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE (-800)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE", true, 105280, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0079
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP (-801)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP", true, 105290, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0080
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_SERVER_FAILED (-802)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED", true, 105300, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_TIMED_OUT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0081
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_TIMED_OUT (-803)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_TIMED_OUT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_TIMED_OUT", true, 105310, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_CACHE_MISS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0082
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_CACHE_MISS (-804)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_CACHE_MISS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_CACHE_MISS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_CACHE_MISS", true, 105320, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0083
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY (-805)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY", true, 105330, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_SORT_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0084
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_SORT_ERROR (-806)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SORT_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SORT_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SORT_ERROR", true, 105340, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0085
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED (-808)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED", true, 105350, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0086
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY (-809)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY", true, 105360, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0087
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED (-810)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED", true, 105370, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0088
     * @tc.desc   test WebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN (-810)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN", true, 105380, done);
      Utils.waitAndClickComponent(driver, "ActsAceWebSetNetErrorCode3Button");
    })
  })
}