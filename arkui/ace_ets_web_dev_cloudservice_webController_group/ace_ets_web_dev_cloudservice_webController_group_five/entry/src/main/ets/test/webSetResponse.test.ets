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

export default function ActsAceWebSetResponse() {
  describe('ActsAceWebSetResponse', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSetResponse',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSetResponse state success " + JSON.stringify(pages));
        if (!("webSetResponse" == pages.name)) {
          console.info("get webSetResponse state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSetResponse state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetResponse page error:" + err);
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
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0001
     *@tc.name testWebSetResponseStatus
     *@tc.desc test WebSetResponseStatus
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseStatus', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseStatus"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseStatus", true, 1001, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0002
     *@tc.name testWebSetResponseStatusText
     *@tc.desc test WebSetResponseStatusText
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseStatusText', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseStatusText"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseStatusText", true, 1002, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0003
     *@tc.name testWebSetResponseMimeType
     *@tc.desc test WebSetResponseMimeType
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseMimeType', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseMimeType"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseMimeType", true, 1003, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0004
     *@tc.name testWebSetResponseEncoding
     *@tc.desc test WebSetResponseEncoding
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseEncoding', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseEncoding"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseEncoding", true, 1004, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0005
     *@tc.name testWebSetResponseHeaderNameNull
     *@tc.desc test WebSetResponseHeaderNameNull
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseHeaderNameNull', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderNameNull"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseHeaderNameNull", true, 1005, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0006
     *@tc.name testWebSetResponseHeaderValueNull
     *@tc.desc test WebSetResponseHeaderValueNull
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseHeaderValueNull', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderValueNull"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseHeaderValueNull", true, 1006, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SET_RESPONSE_API_0008
     *@tc.name testWebSetResponseHeaderOverwriteNull
     *@tc.desc test WebSetResponseHeaderOverwriteNull
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebSetResponseHeaderOverwriteNull', 0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderOverwriteNull"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebSetResponseHeaderOverwriteNull", true, 1007, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webSetNetErrorCode', 10, '');
    })
  })
}
