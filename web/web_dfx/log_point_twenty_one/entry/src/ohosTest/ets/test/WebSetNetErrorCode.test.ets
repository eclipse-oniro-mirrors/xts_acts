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
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0049
     *@tc.name    testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
     *@tc.desc    test WebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH(-378)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH", true, 104490, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0050
     *@tc.name   testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE
     *@tc.desc   test WebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE(-379)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE", true, 104500, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0051
     *@tc.name    testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT
     *@tc.desc    test WebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT(-380)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT", true, 104510, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0052
     *@tc.name    testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
     *@tc.desc    test WebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED(-381)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED", true, 104520, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0053
     *@tc.name    testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS
     *@tc.desc    test WebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS(-382)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS", true, 104530, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0054
     *@tc.name    testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE
     *@tc.desc    test WebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE(-383)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE", true, 104540, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0055
     *@tc.name    testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY(-384)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY", true, 104550, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0056
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_MISS
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_MISS(-400)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_MISS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_MISS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_MISS", true, 104560, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0057
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_READ_FAILURE(-401)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_READ_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_READ_FAILURE", true, 104570, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0058
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE(-402)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE", true, 104580, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0059
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED(-403)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED", true, 104590, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0060
     *@tc.name   testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE
     *@tc.desc   test WebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE(-404)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE", true, 104600, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0061
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE(-405)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE", true, 104610, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0062
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_RACE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_RACE(-406)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_RACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_RACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_RACE", true, 104620, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0063
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE(-407)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE", true, 104630, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0064
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH(-408)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH", true, 104640, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0065
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT(-409)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT", true, 104650, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0066
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ(-410)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ", true, 104660, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0067
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE(-411)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE", true, 104670, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0068
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE(-412)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE", true, 104680, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0069
     *@tc.name    testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE
     *@tc.desc    test WebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE(-413)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE", true, 104690, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_0070
     *@tc.name testWebSetNetErrorCode_ERR_INSECURE_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_INSECURE_RESPONSE(-501)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INSECURE_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSECURE_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSECURE_RESPONSE", true, 104700, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_null_API_0071
     *@tc.name    testWebSetNetErrorCode_null
     *@tc.desc    test WebSetNetErrorCode_null (null)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_null"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_null", true, 104710, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })
    /**
     *@tc.number  SUB_ACE_WEB_SET_1000_API_0071
     *@tc.name    testWebSetNetErrorCode_1000
     *@tc.desc    test WebSetNetErrorCode_1000 (-1000)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_1000"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_1000", true, 104720, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode");
    })
  })
}