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

export default function ActsAceWebSetNetErrorCode3() {
  describe('ActsAceWebSetNetErrorCode3', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSetNetErrorCode3',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode3 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode3" == pages.name)) {
          console.info("get webSetNetErrorCode3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCode3 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCode3 page error:" + err);
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
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0001
     *@tc.name testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT
     *@tc.desc test WebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT (-502)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT", true, 1001, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0002
     *@tc.name testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED (-503)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED", true, 1002, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0003
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE (-504)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE", true, 1003, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0004
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE (-505)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE", true, 1004, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0005
     *@tc.name testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED (-506)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED", true, 1005, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0006
     *@tc.name testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
     *@tc.desc test WebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST (-507)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST", true, 1006, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0007
     *@tc.name testWebSetNetErrorCode_ERR_FTP_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_FAILED (-601)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FAILED", true, 1007, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0008
     *@tc.name testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE (-602)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE", true, 1008, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0009
     *@tc.name testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED (-603)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED", true, 1009, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0010
     *@tc.name testWebSetNetErrorCode_ERR_FTP_FILE_BUSY
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_FILE_BUSY (-604)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_FILE_BUSY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_FILE_BUSY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_FILE_BUSY", true, 1010, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0011
     *@tc.name testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR (-605)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR", true, 1011, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0012
     *@tc.name testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED (-606)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED", true, 1012, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0013
     *@tc.name testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE
     *@tc.desc test WebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE (-607)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE", true, 1013, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0014
     *@tc.name testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD
     *@tc.desc test WebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD (-701)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD", true, 1014, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0015
     *@tc.name testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED (-702)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED", true, 1015, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0016
     *@tc.name testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA
     *@tc.desc test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA (-703)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA", true, 1016, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0017
     *@tc.name testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS
     *@tc.desc test WebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS (-704)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS", true, 1017, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0018
     *@tc.name testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED (-705)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED", true, 1018, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0019
     *@tc.name testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED (-706)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED", true, 1019, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0020
     *@tc.name testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC
     *@tc.desc test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC (-707)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC", true, 1020, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0021
     *@tc.name testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE
     *@tc.desc test WebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE (-708)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE", true, 1021, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0022
     *@tc.name testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED
     *@tc.desc test WebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED (-709)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED", true, 1022, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0023
     *@tc.name testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_KEY_GENERATION_FAILED (-710)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED", true, 1023, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0024
     *@tc.name testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED (-712)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED", true, 1024, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0025
     *@tc.name testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED (-713)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED", true, 1025, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0026
     *@tc.name testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED (-714)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED", true, 1026, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0027
     *@tc.name testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED
     *@tc.desc test WebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED (-716)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED", true, 1027, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0028
     *@tc.name testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE (-800)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE", true, 1028, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0029
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP (-801)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP", true, 1029, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0030
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SERVER_FAILED (-802)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SERVER_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SERVER_FAILED", true, 1030, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0031
     *@tc.name testWebSetNetErrorCode_ERR_DNS_TIMED_OUT
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_TIMED_OUT (-803)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_TIMED_OUT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_TIMED_OUT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_TIMED_OUT", true, 1031, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0032
     *@tc.name testWebSetNetErrorCode_ERR_DNS_CACHE_MISS
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_CACHE_MISS (-804)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_CACHE_MISS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_CACHE_MISS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_CACHE_MISS", true, 1032, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0033
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY (-805)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY", true, 1033, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0034
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SORT_ERROR
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SORT_ERROR (-806)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SORT_ERROR', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SORT_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SORT_ERROR", true, 1034, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0035
     *@tc.name testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED (-808)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED", true, 1035, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0036
     *@tc.name testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY (-809)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY", true, 1036, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0037
     *@tc.name testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED (-810)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED", true, 1037, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0038
     *@tc.name testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
     *@tc.desc test WebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN (-810)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN", true, 1038, done);
      sendEventByKey('ActsAceWebSetNetErrorCode3Button', 10, '');
    })

  })
}
