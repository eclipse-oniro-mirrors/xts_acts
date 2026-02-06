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
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0111
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED (-148)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED", true, 107230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0112
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY (-149)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY", true, 107240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })

    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0113
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN (-150)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN", true, 107250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })

    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0114
    *@tc.name   testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED
    *@tc.desc   test WebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED (-151)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED", true, 107260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })

    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0115
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT (-153)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT", true, 107270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0116
    *@tc.name   testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE
    *@tc.desc   test WebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE (-154)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE", true, 107280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0117
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED (-156)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED", true, 107290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0118
    *@tc.name   testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT
    *@tc.desc   test WebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT (-159)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT", true, 107300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0119
    *@tc.name   testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR
    *@tc.desc   test WebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR (-160)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR", true, 107310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0120
    *@tc.name   testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR
    *@tc.desc   test WebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR (-161)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR", true, 107320, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
    /**
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0121
    *@tc.name   testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE
    *@tc.desc   test WebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE (-162)
    *@tc.size   MediumTest
    *@tc.type   Function
    *@tc.level  Level 1
    */
    it('testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE", true, 107330, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeChen2");
    })
  })
}