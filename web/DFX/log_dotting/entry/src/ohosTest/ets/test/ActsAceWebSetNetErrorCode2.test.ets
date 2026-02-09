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
let emitKey = ''
const EVENT_ID_SET_EIMIT_KEY = 100000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode2() {
  describe('ActsAceWebSetNetErrorCode2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/ActsAceWebSetNetErrorCode2',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode2 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode2" == pages.name)) {
          console.info("get webSetNetErrorCode2 state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webSetNetErrorCode2 state success");
        }
      } catch (err) {
        console.error("push webSetNetErrorCode2 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webSetNetErrorCode2Button"), 10000);
      console.log("waitForComponent webSetNetErrorCode2Button");
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
     * @tc.name   testWebSetNetErrorCode_NET_OK
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0001
     * @tc.desc   test WebSetNetErrorCode_NET_OK (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetNetErrorCode_NET_OK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_NET_OK"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_NET_OK", true, 100010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_IO_PENDING
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0002
     * @tc.desc   test WebSetNetErrorCode_ERR_IO_PENDING (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_IO_PENDING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IO_PENDING"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IO_PENDING", true, 100020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0003
     * @tc.desc   test WebSetNetErrorCode_ERR_FAILED (-2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FAILED", true, 100030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ABORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0004
     * @tc.desc   test WebSetNetErrorCode_ERR_ABORTED (-3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ABORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ABORTED", true, 100040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_ARGUMENT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0005
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_ARGUMENT (-4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ARGUMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ARGUMENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ARGUMENT", true, 100050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INVALID_HANDLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0006
     * @tc.desc   test WebSetNetErrorCode_ERR_INVALID_HANDLE (-5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HANDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HANDLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HANDLE", true, 100060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_NOT_FOUND
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0007
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_NOT_FOUND (-6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NOT_FOUND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NOT_FOUND"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NOT_FOUND", true, 100070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TIMED_OUT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0008
     * @tc.desc   test WebSetNetErrorCode_ERR_TIMED_OUT (-7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TIMED_OUT"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TIMED_OUT", true, 100080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_TOO_LARGE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0009
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_TOO_LARGE (-8)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_TOO_LARGE"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_TOO_LARGE", true, 100090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UNEXPECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0010
     * @tc.desc   test WebSetNetErrorCode_ERR_UNEXPECTED (-9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED", true, 100100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ACCESS_DENIED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0011
     * @tc.desc   test WebSetNetErrorCode_ERR_ACCESS_DENIED (-10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ACCESS_DENIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ACCESS_DENIED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ACCESS_DENIED", true, 100110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0012
     * @tc.desc   test WebSetNetErrorCode_ERR_NOT_IMPLEMENTED (-11)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NOT_IMPLEMENTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED", true, 100120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0013
     * @tc.desc   test WebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES (-12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES", true, 100130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_OUT_OF_MEMORY
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0014
     * @tc.desc   test WebSetNetErrorCode_ERR_OUT_OF_MEMORY (-13)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_OUT_OF_MEMORY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_OUT_OF_MEMORY"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_OUT_OF_MEMORY", true, 100140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0015
     * @tc.desc   test WebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED (-14)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED", true, 100150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0016
     * @tc.desc   test WebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED (-15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED", true, 100160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_EXISTS
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0017
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_EXISTS (-16)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_EXISTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_EXISTS"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_EXISTS", true, 100170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })


    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0018
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG (-17)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG", true, 100180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })


    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_NO_SPACE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0019
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_NO_SPACE (-18)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NO_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NO_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NO_SPACE", true, 100190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0020
     * @tc.desc   test WebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED (-19)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED", true, 100200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0021
     * @tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT (-20)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT", true, 100210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NETWORK_CHANGED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0022
     * @tc.desc   test WebSetNetErrorCode_ERR_NETWORK_CHANGED (-21)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_CHANGED", true, 100220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0023
     * @tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR (-22)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR", true, 100230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SOCKET_CONNECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0024
     * @tc.desc   test WebSetNetErrorCode_ERR_SOCKET_CONNECTED (-23)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_CONNECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_CONNECTED", true, 100240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0025
     * @tc.desc   test WebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED (-25)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED", true, 100250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0026
     * @tc.desc   test WebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN (-26)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN", true, 100260, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0027
     * @tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE (-27)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE", true, 100270, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0028
     * @tc.desc   test WebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED (-29)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED", true, 100280, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0029
     * @tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_CSP (-30)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_CSP"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP", true, 100290, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0030
     * @tc.desc   test WebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED (-31)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED", true, 100300, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0031
     * @tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_ORB (-32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_ORB"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB", true, 100310, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_CLOSED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0032
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_CLOSED (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_CLOSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_CLOSED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_CLOSED", true, 100320  , done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_RESET
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0033
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_RESET (-101)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_RESET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_RESET"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_RESET", true, 100330  , done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_REFUSED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0034
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_REFUSED (-102)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_REFUSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_REFUSED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_REFUSED", true, 100340, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_ABORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0035
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_ABORTED (-103)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_ABORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_ABORTED", true, 100350, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0036
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_FAILED (-104)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_FAILED", true, 100360, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0037
     * @tc.desc   test WebSetNetErrorCode_ERR_NAME_NOT_RESOLVED (-105)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED", true, 100370, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0038
     * @tc.desc   test WebSetNetErrorCode_ERR_INTERNET_DISCONNECTED (-106)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED", true, 100380, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0039
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR (-107)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR", true, 100390, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ADDRESS_INVALID
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0040
     * @tc.desc   test WebSetNetErrorCode_ERR_ADDRESS_INVALID (-108)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ADDRESS_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_INVALID"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_INVALID", true, 100400, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0041
     * @tc.desc   test WebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE (-109)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE", true, 100410, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0042
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED (-110)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED", true, 100420, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     * @tc.name   testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0043
     * @tc.desc   test WebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED (-111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED", true, 100430, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0044
     * @tc.desc   test WebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED (-112)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED", true, 100440, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0045
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH (-113)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH", true, 100450, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0046
     * @tc.desc   test WebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED (-114)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED", true, 100460, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0047
     * @tc.desc   test WebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED (-115)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED", true, 100470, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0048
     * @tc.desc   test WebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT (-117)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT", true, 100480, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0049
     * @tc.desc   test WebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT (-118)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT", true, 100490, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     * @tc.name   testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE
     * @tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0050
     * @tc.desc   test WebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE (-119)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE", true, 100500, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
  })
}