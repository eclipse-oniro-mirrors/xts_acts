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
const EVENT_ID_SET_EIMIT_KEY = 100000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCode2() {
  describe('ActsAceWebSetNetErrorCode2', () => {

    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webSetNetErrorCode2Button"), 10000);
      console.log('waitForComponent webSetNetErrorCode2Button');
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
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0001
     *@tc.name   testWebSetNetErrorCode_NET_OK
     *@tc.desc   test WebSetNetErrorCode_NET_OK (0)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 0
     */
    it('testWebSetNetErrorCode_NET_OK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_NET_OK"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_NET_OK", true, 100010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0002
     *@tc.name   testWebSetNetErrorCode_ERR_IO_PENDING
     *@tc.desc   test WebSetNetErrorCode_ERR_IO_PENDING (-1)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_IO_PENDING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IO_PENDING"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IO_PENDING", true, 100020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0003
     *@tc.name   testWebSetNetErrorCode_ERR_FAILED
     *@tc.desc   test WebSetNetErrorCode_ERR_FAILED (-2)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FAILED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FAILED", true, 100030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0004
     *@tc.name   testWebSetNetErrorCode_ERR_ABORTED
     *@tc.desc   test WebSetNetErrorCode_ERR_ABORTED (-3)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ABORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ABORTED", true, 100040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0005
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_ARGUMENT
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_ARGUMENT (-4)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ARGUMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ARGUMENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ARGUMENT", true, 100050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0006
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_HANDLE
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_HANDLE (-5)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HANDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HANDLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HANDLE", true, 100060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0007
     *@tc.name   testWebSetNetErrorCode_ERR_FILE_NOT_FOUND
     *@tc.desc   test WebSetNetErrorCode_ERR_FILE_NOT_FOUND (-6)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NOT_FOUND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NOT_FOUND"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NOT_FOUND", true, 100070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0008
     *@tc.name   testWebSetNetErrorCode_ERR_TIMED_OUT
     *@tc.desc   test WebSetNetErrorCode_ERR_TIMED_OUT (-7)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TIMED_OUT"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TIMED_OUT", true, 100080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0009
     *@tc.name   testWebSetNetErrorCode_ERR_FILE_TOO_LARGE
     *@tc.desc   test WebSetNetErrorCode_ERR_FILE_TOO_LARGE (-8)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_TOO_LARGE"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_TOO_LARGE", true, 100090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0010
     *@tc.name   testWebSetNetErrorCode_ERR_UNEXPECTED
     *@tc.desc   test WebSetNetErrorCode_ERR_UNEXPECTED (-9)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED", true, 100100, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0011
     *@tc.name   testWebSetNetErrorCode_ERR_ACCESS_DENIED
     *@tc.desc   test WebSetNetErrorCode_ERR_ACCESS_DENIED (-10)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_ACCESS_DENIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ACCESS_DENIED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ACCESS_DENIED", true, 100110, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0012
     *@tc.name   testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED
     *@tc.desc   test WebSetNetErrorCode_ERR_NOT_IMPLEMENTED (-11)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NOT_IMPLEMENTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED", true, 100120, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0013
     *@tc.name   testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES
     *@tc.desc   test WebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES (-12)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES", true, 100130, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0014
     *@tc.name   testWebSetNetErrorCode_ERR_OUT_OF_MEMORY
     *@tc.desc   test WebSetNetErrorCode_ERR_OUT_OF_MEMORY (-13)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_OUT_OF_MEMORY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_OUT_OF_MEMORY"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_OUT_OF_MEMORY", true, 100140, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0015
     *@tc.name   testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED
     *@tc.desc   test WebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED (-14)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED", true, 100150, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0016
     *@tc.name   testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED
     *@tc.desc   test WebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED (-15)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED", true, 100160, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0017
     *@tc.name   testWebSetNetErrorCode_ERR_FILE_EXISTS
     *@tc.desc   test WebSetNetErrorCode_ERR_FILE_EXISTS (-16)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_EXISTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_EXISTS"
     Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_EXISTS", true, 100170, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })


    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0018
     *@tc.name   testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG
     *@tc.desc   test WebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG (-17)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG", true, 100180, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })


    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0019
     *@tc.name testWebSetNetErrorCode_ERR_FILE_NO_SPACE
     *@tc.desc test WebSetNetErrorCode_ERR_FILE_NO_SPACE (-18)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NO_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NO_SPACE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NO_SPACE", true, 100190, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0020
     *@tc.name   testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED
     *@tc.desc   test WebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED (-19)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED", true, 100200, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0021
     *@tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT
     *@tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT (-20)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT", true, 100210, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0022
     *@tc.name   testWebSetNetErrorCode_ERR_NETWORK_CHANGED
     *@tc.desc   test WebSetNetErrorCode_ERR_NETWORK_CHANGED (-21)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_CHANGED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_CHANGED", true, 100220, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0023
     *@tc.name   testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR
     *@tc.desc   test WebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR (-22)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR", true, 100230, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0024
     *@tc.name   testWebSetNetErrorCode_ERR_SOCKET_CONNECTED
     *@tc.desc   test WebSetNetErrorCode_ERR_SOCKET_CONNECTED (-23)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_CONNECTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_CONNECTED", true, 100240, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0025
     *@tc.name   testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
     *@tc.desc   test WebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED (-25)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED", true, 100250, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCode2Button");
    })
  })
}