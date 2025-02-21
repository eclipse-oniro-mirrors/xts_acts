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

export default function ActsAceWebSetNetErrorCodeFly() {
  describe('ActsAceWebSetNetErrorCodeFly', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSetNetErrorCodeFly',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetNetErrorCodeFly state success " + JSON.stringify(pages));
        if (!("webSetNetErrorCodeFly" == pages.name)) {
          console.info("get webSetNetErrorCodeFly state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetNetErrorCodeFly state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetNetErrorCodeFly page error:" + err);
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
     *@tc.name testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME
     *@tc.desc test WebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME (-302)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME", true, 1301, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0002
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_REDIRECT
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_REDIRECT (-303)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_REDIRECT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_REDIRECT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_REDIRECT", true, 1302, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0003
     *@tc.name testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS
     *@tc.desc test WebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS (-310)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS", true, 1303, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0004
     *@tc.name testWebSetNetErrorCode_ERR_UNSAFE_REDIRECT
     *@tc.desc test WebSetNetErrorCode_ERR_UNSAFE_REDIRECT (-311)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_ERR_UNSAFE_REDIRECT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSAFE_REDIRECT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSAFE_REDIRECT", true, 1304, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0005
     *@tc.name testWebSetNetErrorCode_ERR_UNSAFE_PORT
     *@tc.desc test WebSetNetErrorCode_ERR_UNSAFE_PORT (-312)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNSAFE_PORT', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSAFE_PORT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSAFE_PORT", true, 1305, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0006
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_RESPONSE
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_RESPONSE (-320)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_RESPONSE', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_RESPONSE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_RESPONSE", true, 1306, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0007
     *@tc.name testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING
     *@tc.desc test WebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING (-321)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING", true, 1307, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0008
     *@tc.name testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED
     *@tc.desc test WebSetNetErrorCode_ERR_METHOD_UNSUPPORTED (-322)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED", true, 1308, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0009
     *@tc.name testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH
     *@tc.desc test WebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH (-323)
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH', 0, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH", true, 1309, done);
      sendEventByKey('webSetNetErrorCodeFly', 10, '');
    })

  })
}
