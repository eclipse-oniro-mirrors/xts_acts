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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ''

export default function ActsAceWebSetNetErrorCode2() {
  describe('ActsAceWebSetNetErrorCode2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/ActsAceWebSetNetErrorCode2',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCode2 state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCode2" == pages.name)) {
          console.info("get webSetNetErrorCode2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCode2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCode2 page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
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
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0001
     *@tc.name testWebSetNetErrorCode_NET_OK
     *@tc.desc test WebSetNetErrorCode_NET_OK (0)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebSetNetErrorCode_NET_OK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_NET_OK"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_NET_OK", true, 3000, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0002
     *@tc.name testWebSetNetErrorCode_ERR_IO_PENDING
     *@tc.desc test WebSetNetErrorCode_ERR_IO_PENDING (-1)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_IO_PENDING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_IO_PENDING"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_IO_PENDING", true, 3001, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0003
     *@tc.name testWebSetNetErrorCode_ERR_FAILED
     *@tc.desc test WebSetNetErrorCode_ERR_FAILED (-2)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FAILED", true, 3002, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0004
     *@tc.name testWebSetNetErrorCode_ERR_ABORTED
     *@tc.desc test WebSetNetErrorCode_ERR_ABORTED (-3)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ABORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ABORTED", true, 3003, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0005
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_ARGUMENT
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_ARGUMENT (-4)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_ARGUMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_ARGUMENT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_ARGUMENT", true, 3004, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0006
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_HANDLE
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_HANDLE (-5)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_HANDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_HANDLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_HANDLE", true, 3005, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0007
     *@tc.name testWebSetNetErrorCode_ERR_FILE_NOT_FOUND
     *@tc.desc test WebSetNetErrorCode_ERR_FILE_NOT_FOUND (-6)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NOT_FOUND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NOT_FOUND"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NOT_FOUND", true, 3006, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0008
     *@tc.name testWebSetNetErrorCode_ERR_TIMED_OUT
      *@tc.desc test WebSetNetErrorCode_ERR_TIMED_OUT (-7)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TIMED_OUT"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TIMED_OUT", true, 3007, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0009
     *@tc.name testWebSetNetErrorCode_ERR_FILE_TOO_LARGE
      *@tc.desc test WebSetNetErrorCode_ERR_FILE_TOO_LARGE (-8)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_TOO_LARGE"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_TOO_LARGE", true, 3008, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0010
     *@tc.name testWebSetNetErrorCode_ERR_UNEXPECTED
      *@tc.desc test WebSetNetErrorCode_ERR_UNEXPECTED (-9)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED", true, 3009, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0011
     *@tc.name testWebSetNetErrorCode_ERR_ACCESS_DENIED
      *@tc.desc test WebSetNetErrorCode_ERR_ACCESS_DENIED (-10)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ACCESS_DENIED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ACCESS_DENIED"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ACCESS_DENIED", true, 3010, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0012
     *@tc.name testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED
      *@tc.desc test WebSetNetErrorCode_ERR_NOT_IMPLEMENTED (-11)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NOT_IMPLEMENTED"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NOT_IMPLEMENTED", true, 3011, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0013
     *@tc.name testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES
      *@tc.desc test WebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES (-12)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES", true, 3012, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0014
     *@tc.name testWebSetNetErrorCode_ERR_OUT_OF_MEMORY
      *@tc.desc test WebSetNetErrorCode_ERR_OUT_OF_MEMORY (-13)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_OUT_OF_MEMORY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_OUT_OF_MEMORY"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_OUT_OF_MEMORY", true, 3013, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0015
     *@tc.name testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED
      *@tc.desc test WebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED (-14)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED", true, 3014, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0016
     *@tc.name testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED
      *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED (-15)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED", true, 3015, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0017
     *@tc.name testWebSetNetErrorCode_ERR_FILE_EXISTS
      *@tc.desc test WebSetNetErrorCode_ERR_FILE_EXISTS (-16)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_EXISTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_EXISTS"
     Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_EXISTS", true, 3016, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0018
     *@tc.name testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG
      *@tc.desc test WebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG (-17)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG", true, 3017, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0019
     *@tc.name testWebSetNetErrorCode_ERR_FILE_NO_SPACE
      *@tc.desc test WebSetNetErrorCode_ERR_FILE_NO_SPACE (-18)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_NO_SPACE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_NO_SPACE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_NO_SPACE", true, 3018, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0020
     *@tc.name testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED
      *@tc.desc test WebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED (-19)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED", true, 3019, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0021
     *@tc.name testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT
      *@tc.desc test WebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT (-20)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT", true, 3020, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0022
     *@tc.name testWebSetNetErrorCode_ERR_NETWORK_CHANGED
      *@tc.desc test WebSetNetErrorCode_ERR_NETWORK_CHANGED (-21)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_NETWORK_CHANGED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NETWORK_CHANGED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NETWORK_CHANGED", true, 3021, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0023
     *@tc.name testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR
      *@tc.desc test WebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR (-22)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR", true, 3022, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0024
     *@tc.name testWebSetNetErrorCode_ERR_SOCKET_CONNECTED
      *@tc.desc test WebSetNetErrorCode_ERR_SOCKET_CONNECTED (-23)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SOCKET_CONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SOCKET_CONNECTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SOCKET_CONNECTED", true, 3023, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0025
     *@tc.name testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
      *@tc.desc test WebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED (-25)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED", true, 3024, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0026
     *@tc.name testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN
      *@tc.desc test WebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN (-26)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN", true, 3025, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0027
     *@tc.name testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE
      *@tc.desc test WebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE (-27)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE", true, 3026, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0028
     *@tc.name testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED
      *@tc.desc test WebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED (-29)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED", true, 3027, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0029
     *@tc.name testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP
      *@tc.desc test WebSetNetErrorCode_ERR_BLOCKED_BY_CSP (-30)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_CSP"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_CSP", true, 3028, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0030
     *@tc.name testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED
      *@tc.desc test WebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED (-31)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED", true, 3029, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0031
     *@tc.name testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB
      *@tc.desc test WebSetNetErrorCode_ERR_BLOCKED_BY_ORB (-32)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BLOCKED_BY_ORB"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BLOCKED_BY_ORB", true, 3030, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0032
     *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_CLOSED
      *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_CLOSED (-100)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_CLOSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_CLOSED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_CLOSED", true, 3031  , done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0033
     *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_RESET
      *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_RESET (-101)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_RESET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_RESET"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_RESET", true, 3032  , done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0034
     *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_REFUSED
      *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_REFUSED (-102)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_REFUSED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_REFUSED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_REFUSED", true, 3033, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0035
     *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_ABORTED
      *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_ABORTED (-103)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_ABORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_ABORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_ABORTED", true, 3034, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0036
     *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_FAILED
      *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_FAILED (-104)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_FAILED", true, 3035, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0037
     *@tc.name testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED
      *@tc.desc test WebSetNetErrorCode_ERR_NAME_NOT_RESOLVED (-105)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED", true, 3036, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0038
     *@tc.name testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED
      *@tc.desc test WebSetNetErrorCode_ERR_INTERNET_DISCONNECTED (-106)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED", true, 3037, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0039
     *@tc.name testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR
      *@tc.desc test WebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR (-107)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR", true, 3038, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0040
     *@tc.name testWebSetNetErrorCode_ERR_ADDRESS_INVALID
      *@tc.desc test WebSetNetErrorCode_ERR_ADDRESS_INVALID (-108)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ADDRESS_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_INVALID"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_INVALID", true, 3039, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0041
     *@tc.name testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE
      *@tc.desc test WebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE (-109)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE", true, 3040, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0042
     *@tc.name testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED
      *@tc.desc test WebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED (-110)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED", true, 3041, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0043
     *@tc.name testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED
      *@tc.desc test WebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED (-111)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED", true, 3042, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0044
     *@tc.name testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED
      *@tc.desc test WebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED (-112)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED", true, 3043, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0045
     *@tc.name testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH
     *@tc.desc test WebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH (-113)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH", true, 3044, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0046
    *@tc.name testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED
    *@tc.desc test WebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED (-114)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED", true, 3045, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0047
    *@tc.name testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED
    *@tc.desc test WebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED (-115)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED", true, 3046, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0048
    *@tc.name testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT
    *@tc.desc test WebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT (-117)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT", true, 3047, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0049
    *@tc.name testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT
    *@tc.desc test WebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT (-118)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT", true, 3048, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_API_TWO_PART_0050
    *@tc.name testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE
    *@tc.desc test WebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE (-119)
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE", true, 3049, done);
      sendEventByKey('webSetNetErrorCode2Button', 10, '');
    })
  })
}
